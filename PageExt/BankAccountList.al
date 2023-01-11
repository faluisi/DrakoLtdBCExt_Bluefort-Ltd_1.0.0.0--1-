pageextension 50039 BankAccountList extends "Bank Account List"
{
  layout
  {
    addafter(Name)
    {
      field(Balance;Balance)
      {
        ApplicationArea = all;
      }
      field("Balance (LCY)";"Balance (LCY)")
      {
        ApplicationArea = All;
      }
    }
  }
  actions
  {
    addafter("Trial Balance")
    {
      action(BankTrialBalance)
      {
        Caption = 'Bank Trial Balance';
        ApplicationArea = All;
        Image = BankAccountStatement;

        trigger OnAction()begin
          BTB.Run();
        end;
      }
    }
  }
  var BTB: Report "Bank Trial Balance";
}
