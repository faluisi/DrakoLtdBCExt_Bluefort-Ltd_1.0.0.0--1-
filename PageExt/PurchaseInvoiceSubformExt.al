pageextension 50006 PurchaseInvoiceSubformExt extends "Purch. Invoice Subform"
{
    layout
    {
        modify("VAT Prod. Posting Group")
        {
            Visible = true;
        }
        modify("Deferral Code")
        {
            Visible = true;
        }
        //addafter("VAT Prod. Posting Group")
        //{
        //field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
        //{
        //ApplicationArea = all;
        //}
        //}
    }
    actions
    {
    }
    var
}
