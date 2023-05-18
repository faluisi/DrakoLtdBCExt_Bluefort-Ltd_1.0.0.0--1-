pageextension 50013 PostedPurchInvoiceSubformExt extends "Posted Purch. Invoice Subform"
{
    layout
    {
        addafter("Variant Code")
        {
            field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
            {
                ApplicationArea = all;
            }
            field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
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
