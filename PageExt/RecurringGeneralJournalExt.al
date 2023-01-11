pageextension 50020 RecurringGeneralJournalExt extends "Recurring General Journal"
{
  layout
  {
    modify("VAT Prod. Posting Group")
    {
    Visible = true;
    }
    modify("VAT Bus. Posting Group")
    {
    Visible = true;
    }
    modify("Currency Code")
    {
    Visible = true;
    }
    modify("Amount (LCY)")
    {
    Visible = SeeLCY;
    }
  }
  actions
  {
  }
  var UserSetup: Record "User Setup";
  SeeLCY: Boolean;
  trigger OnOpenPage()begin
    UserSetup.Reset();
    if UserSetup.Get(USERID)then SeeLCY:=UserSetup."See LCY in Journals"
    else
      SeeLCY:=false;
  end;
}
