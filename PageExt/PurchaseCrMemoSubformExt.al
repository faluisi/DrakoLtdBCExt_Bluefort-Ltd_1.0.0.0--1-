pageextension 50010 PurchaseCrMemoSubformExt extends "Purch. Cr. Memo Subform"
{
    layout
    {
        modify("VAT Prod. Posting Group")
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
