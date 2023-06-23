pageextension 50053 SalesInvoicesListExt extends "Sales Invoice List"
{
    layout
    {
        addafter("No.")
        {


            field("Billing Statement"; rec."Billing Statement")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
    }
    var
}
