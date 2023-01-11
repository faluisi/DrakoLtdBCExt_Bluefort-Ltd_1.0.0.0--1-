pageextension 50002 SalesReceivablesSetupExt extends "Sales & Receivables Setup"
{
  layout
  {
    addbefore("Discount Posting")
    {
      field("Show Hall Invoice Warning";"Show Hall Invoice Warning")
      {
        ApplicationArea = All;
        Caption = 'Show Hall Invoice Warning';
        ToolTip = 'Determine whether to show a warning when a customer is set to Separate Halls Inv. in Sales Documents';
      }
    }
  }
  actions
  {
    addlast(navigation)
    {
      group("Sales T&&C")
      {
        action("Terms & Conditions")
        {
          ApplicationArea = All;

          trigger OnAction()begin
            TCP.Run();
          end;
        }
      }
    }
  }
  var TCP: Page TermsConditions;
}
