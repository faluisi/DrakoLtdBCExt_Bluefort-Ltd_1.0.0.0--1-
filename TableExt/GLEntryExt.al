tableextension 50011 GLEntryExt extends "G/L Entry"
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
