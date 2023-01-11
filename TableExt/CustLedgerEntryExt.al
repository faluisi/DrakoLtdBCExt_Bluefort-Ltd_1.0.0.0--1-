tableextension 50013 CustLedgerEntryExt extends "Cust. Ledger Entry"
{
  fields
  {
    //DEVOPS #622 -- begin
    field(50000;"Period Start";Date)
    {
      DataClassification = ToBeClassified;
    }
    field(50001;"Period End";Date)
    {
      DataClassification = ToBeClassified;
    }
  }
  var
}
