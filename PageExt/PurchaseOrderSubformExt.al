pageextension 50005 PurchaseOrderSubformExt extends "Purchase Order Subform"
{
    layout
    {
        modify("VAT Prod. Posting Group")
        {
            Visible = true;
        }
        modify("Prepayment %")
        {
            Visible = true;
        }
        addafter("VAT Prod. Posting Group")
        {
            field("Gen. Prod. Posting Group"; rec."Gen. Prod. Posting Group")
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
