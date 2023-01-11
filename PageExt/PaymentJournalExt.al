pageextension 50045 PaymentJournalExt extends "Payment Journal"
{
  layout
  {
    modify("Amount (LCY)")
    {
    Visible = SeeLCY;
    }
    modify("Currency Code")
    {
    Visible = true;
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
