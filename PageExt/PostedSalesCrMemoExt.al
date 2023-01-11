pageextension 50026 PostedSalesCrMemoExt extends "Posted Sales Credit Memo"
{
  layout
  {
    addafter("External Document No.")
    {
      field(Site;Site)
      {
        ApplicationArea = All;
      }
      //DevOps #619 -- begin
      field("Contract Code";"Contract Code")
      {
        ApplicationArea = All;
        Editable = false;
      }
      //DevOps #619 -- end
      //DEVOPS #622 -- begin
      field("Period Start";"Period Start")
      {
        ApplicationArea = all;
        Editable = false;
      }
      field("Period End";"Period End")
      {
        ApplicationArea = all;
        Editable = false;
      }
    //DEVOPS #622 -- end
    }
  }
  actions
  {
  }
  var
}
