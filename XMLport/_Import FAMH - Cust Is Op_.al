xmlport 50000 "Import FAMH - Cust Is Op"
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
    Clear(FAMHcustno);
    Message('1');
    CheckMovement(FAMovementHistory."FA No.", FAMovementHistory);
    Message('2');
    CheckCustomerName(FAMovementHistory."Customer Name", FAMovementHistory."FA No.");
    Message('3');
    CheckCustomerSite(FAMovementHistory.Site, FAMovementHistory."Customer Name", FAMovementHistory."FA No.");
    Message('4');
    CheckCustIsOp(FAMovementHistory);
    Message('5');
  end;
  trigger OnAfterInsertRecord()var begin
    FAMovementHistory."Date":=ImportDate;
    FAMovementHistory.Modify();
    Message('6');
    UpdateFAStartDepDate(FAMovementHistory);
    Message('7');
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
            ApplicationArea = all;
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
  FAMHcustno: Code[20];
  trigger OnPostXmlPort()begin
    //Assign default dimensions
    Message('assign');
    FaDimMgt.AssignFADimension();
  end;
  trigger OnInitXmlPort()var begin
  end;
  procedure UpdateFAStartDepDate(FAMH: Record "FA Movement History")//if Start Dep. Date of FA is empty, update 
  var FA: Record "Fixed Asset";
  FADB: Record "FA Depreciation Book";
  begin
    FADB.SetFilter(FADB."FA No.", FA."No.");
    if FADB.FindFirst()then begin
      if(FADB."Depreciation Starting Date" = 0D)then begin
        FADB."Depreciation Starting Date":=FAMH."Start Dep. Date";
        FADB.Modify();
      end;
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
      FAMHcustno:=Customer."No.";
  end;
  procedure CheckCustomerSite(CustSite: Text[250];
  CustName: Text[100];
  FANo: Code[20])//check that site exists
  var Customer: Record Customer;
  CustNo: Code[20];
  CustomerSite: Record "Customer-Site";
  Text001: Label 'You are trying to import an FA Movement for Fixed Asset %1 with a Site Name that cannot be found related to a customer.';
  begin
    Clear(CustNo);
    Customer.Reset();
    Customer.SetFilter(Customer.Name, CustName);
    if Customer.FindFirst()then begin
      CustNo:=Customer."No.";
      CustomerSite.Reset();
      CustomerSite.SetFilter("Site Name", CustSite);
      CustomerSite.SetFilter(CustomerSite."Customer No.", CustNo);
      if not CustomerSite.FindFirst()then Error(Text001, FANo);
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
  procedure CheckCustIsOp(MovementHistory: Record "FA Movement History")var Text001: Label 'Movement History entry for Fixed Asset %1 must have the same Operator & Customer Name!';
  begin
    if MovementHistory."Corporate Name" <> MovementHistory."Customer Name" then error(Text001, MovementHistory."FA No.");
  end;
}
