page 50009 "IC FA Movement History"
{
  PageType = List;
  ApplicationArea = All;
  UsageCategory = Lists;
  SourceTable = "FA Movement History";
  SourceTableTemporary = true;
  Editable = false;

  layout
  {
    area(Content)
    {
      repeater(GroupName)
      {
        field("Entry No.";"Entry No.")
        {
          ApplicationArea = All;
          Editable = false;
        }
        field("Date";"Date")
        {
          ApplicationArea = All;
        }
        field("FA No.";"FA No.")
        {
          ApplicationArea = All;
        }
        field(Type;Type)
        {
          ApplicationArea = All;
        }
        field(Site;Site)
        {
          ApplicationArea = All;
        }
        field("Corporate Name";"Corporate Name")
        {
          ApplicationArea = All;
          Caption = 'Operator Name';
        }
        field("Start Dep. Date";"Start Dep. Date")
        {
          ApplicationArea = All;
        }
        field("Customer Name";"Customer Name")
        {
          ApplicationArea = All;
        }
        field(Version;Version)
        {
          ApplicationArea = All;
        }
        field(Status;Status)
        {
          ApplicationArea = All;
        }
        field("Stock Arrival";"Stock Arrival")
        {
          ApplicationArea = All;
        }
        field("Forecast Dep. Date";"Forecast Dep. Date")
        {
          ApplicationArea = All;
        }
        field("Date From";"Date From")
        {
          ApplicationArea = All;
          Visible = false;
        }
        field("Date To";"Date To")
        {
          ApplicationArea = All;
          Visible = false;
        }
        field(Remarks;Remarks)
        {
          ApplicationArea = All;
        }
      }
    }
    area(Factboxes)
    {
    }
  }
  actions
  {
  }
  var FANo: code[20];
  FAMHV: Codeunit 50002;
  procedure InitTempTable(FANo: Code[20])var FAMH: Record "FA Movement History";
  EntryNo: Integer;
  FASetup: record "FA Setup";
  begin
    EntryNo:=1;
    FAMH.Reset();
    //change company to where FA Movement Entries are held
    FAMH.ChangeCompany(FASetup."FA Company");
    FAMH.SetFilter(FAMH."FA No.", FANo); //get movement entries of the required FA only
    if FAMH.FindSet()then begin
      repeat //fill in temp table with required records only
        EntryNo:=EntryNo + 1;
        Rec."Entry No.":=EntryNo;
        Rec:=FAMH;
        Insert();
      until(FAMH.Next = 0);
    end;
  end;
  trigger OnOpenPage()begin
    FANo:=FAMHV.GetFANo();
    InitTempTable(FANo);
  end;
  trigger OnClosePage()begin
    FAMHV.ClearValues();
  end;
}
