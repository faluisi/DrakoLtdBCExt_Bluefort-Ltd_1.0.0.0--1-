xmlport 50002 "Import FAMH - Cust Not Op"
{
  Direction = Import;
  Format = VariableText;
  RecordSeparator = '<LF>';
  FieldSeparator = ',';
  TextEncoding = UTF8;

  schema
  {
  textelement(Root)
  {
  tableelement(FAMovementHistory;
  "FA Movement History")
  {
  fieldelement(SN;
  FAMovementHistory."FA No.")
  {
  }
  fieldelement(Type;
  FAMovementHistory.Type)
  {
  }
  fieldelement(Site;
  FAMovementHistory.Site)
  {
  }
  fieldelement(CorporateName;
  FAMovementHistory."Corporate Name")
  {
  //corporate name == operarator
  }
  fieldelement(StartDepDate;
  FAMovementHistory."Start Dep. Date")
  {
  }
  fieldelement(Remarks;
  FAMovementHistory.Remarks)
  {
  }
  fieldelement(CustomerName;
  FAMovementHistory."Customer Name")
  {
  }
  fieldelement(Version;
  FAMovementHistory.Version)
  {
  }
  fieldelement(Status;
  FAMovementHistory.Status)
  {
  }
  fieldelement(StockArrival;
  FAMovementHistory."Stock Arrival")
  {
  }
  fieldelement(ForecastDepDate;
  FAMovementHistory."Forecast Dep. Date")
  {
  }
  trigger OnBeforeInsertRecord()var begin
    Clear(FAMHcust);
    Clear(FAMHop);
    Clear(FAMHsite);
    CheckMovement(FAMovementHistory."FA No.", FAMovementHistory);
    CheckCustomerName(FAMovementHistory."Customer Name", FAMovementHistory."FA No.");
    SiteExists(FAMovementHistory.Site);
    OperatorExists(FAMovementHistory."Corporate Name");
  end;
  trigger OnAfterInsertRecord()var begin
    FAMovementHistory."Date":=ImportDate;
    FAMovementHistory.Modify();
    UpdateFAStartDepDate(FAMovementHistory);
    CheckCustOpSiteCombination();
  end;
  }
  }
  }
  requestpage
  {
    layout
    {
      area(Content)
      {
        group(Import)
        {
          field(ImportDate;ImportDate)
          {
            ApplicationArea = All;
            Caption = 'Import Date';
          }
        }
      }
    }
    actions
    {
    }
  }
  var ImportDate: Date;
  FaDimMgt: Codeunit FixedAssetDimMgt;
  CompanyInfo: Record "Company Information";
  FAMHop: Code[20];
  FAMHcust: Code[20];
  FAMHsite: Code[20];
  NoSeriesMgt: codeunit "NoSeriesManagement";
  trigger OnPostXmlPort()begin
    //Assign default dimensions
    FaDimMgt.AssignFADimension();
  end;
  trigger OnInitXmlPort()var begin
    CompanyInfo.Get();
  end;
  //if Start Dep. Date of FA is empty, update 
  procedure UpdateFAStartDepDate(FAMH: Record "FA Movement History")var FA: Record "Fixed Asset";
  FADB: Record "FA Depreciation Book";
  begin
    FADB.SetFilter(FADB."FA No.", FA."No.");
    if FADB.FindFirst()then begin
      if(FADB."Depreciation Starting Date" = 0D)then FADB."Depreciation Starting Date":=FAMH."Start Dep. Date";
    end;
  end;
  procedure CheckCustomerName(CustName: Text[150];
  FANo: Code[20])//check that customer exists
  var Customer: Record Customer;
  Text000: Label 'You are trying to import an FA Movement for Fixed Asset %1 with a Customer Name that cannot be found as customer.';
  begin
    Customer.Reset();
    Customer.SetFilter(Customer.Name, CustName);
    if not Customer.FindFirst()then Error(Text000, FANo)
    else
      FAMHcust:=Customer."No.";
  end;
  procedure SiteExists(Site: Text[250])//check if site exsist already - if not, create
  var Site_DimValue: Record "Dimension Value";
  FASetup: Record "FA Setup";
  begin
    if FASetup.Get()then begin
      Site_DimValue.Reset();
      Site_DimValue.SetFilter(Site_DimValue."Dimension Code", FASetup."Site Dimension");
      Site_DimValue.SetFilter(Site_DimValue.Name, Site);
      if not Site_DimValue.FindFirst()then begin
        Site_DimValue.Reset();
        Site_DimValue.Init();
        Site_DimValue."Dimension Code":=FASetup."Site Dimension";
        //Site_DimValue."Code" := UpperCase(COPYSTR(Site, 1, 3));
        Site_DimValue."Code":=NoSeriesMgt.GetNextNo('SITES', Today, true);
        Site_DimValue.Name:=Site;
        if Site_DimValue.Insert(true)then begin
          FAMHsite:=Site_DimValue."Code";
        end;
      end
      else
        FAMHsite:=Site_DimValue."Code";
    end;
  end;
  procedure OperatorExists(CorpName: Text[150])//check if operator exsist already - if not, create
  var Op_DimValue: Record "Dimension Value";
  FASetup: Record "FA Setup";
  begin
    if FASetup.Get()then begin
      Op_DimValue.Reset();
      Op_DimValue.SetFilter(Op_DimValue."Dimension Code", FASetup."Operator Dimension");
      Op_DimValue.SetFilter(Op_DimValue.Name, CorpName);
      if not Op_DimValue.FindFirst()then begin
        Op_DimValue.Reset();
        Op_DimValue.Init();
        Op_DimValue."Dimension Code":=FASetup."Operator Dimension";
        //Op_DimValue."Code" := UpperCase(COPYSTR(CorpName, 1, 3));
        Op_DimValue."Code":=NoSeriesMgt.GetNextNo('OPERATORS', Today, true);
        Op_DimValue.Name:=CorpName;
        if Op_DimValue.Insert(true)then FAMHop:=Op_DimValue."Code";
      end
      else
        FAMHop:=Op_DimValue."Code";
    end;
  end;
  procedure CheckMovement(FANo: Code[20];
  FAMHistory: Record "FA Movement History")//if machine has not moved from last import i.e. still at same operator and same site, then do not import
  var FAMH: Record "FA Movement History";
  begin
    FAMH.Reset();
    FAMH.SetCurrentKey("Date");
    FAMH.SetFilter(FAMH."FA No.", FANo);
    if FAMH.FindLast()then begin
      if((FAMH."Corporate Name" = FAMHistory."Corporate Name") AND (FAMH.Site = FAMHistory.Site))then currXMLport.Skip();
    end;
  end;
  procedure CheckCustOpSiteCombination()//if cust-op-site combination does not exist, create
  var CustOpSite: Record "Cust-Op-Site";
  begin
    CustOpSite.Reset();
    if not CustOpSite.Get(FAMHcust, FAMHop, FAMHsite)then begin
      CustOpSite.init;
      CustOpSite."Customer No.":=FAMHcust;
      CustOpSite."Operator No.":=FAMHop;
      CustOpSite."Site Code":=FAMHsite;
      CustOpSite.Insert();
    end;
  end;
}
