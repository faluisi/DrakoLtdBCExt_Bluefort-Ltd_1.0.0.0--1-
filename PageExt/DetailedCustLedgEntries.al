pageextension 50038 DetailedCustLedgEntries extends "Detailed Cust. Ledg. Entries"
{
  layout
  {
    addafter("Initial Entry Due Date")
    {
      field("Period Start";"Period Start")
      {
        ApplicationArea = All;
      }
      field("Period End";"Period End")
      {
        ApplicationArea = All;
      }
    }
  }
  actions
  {
  }
  var
}
