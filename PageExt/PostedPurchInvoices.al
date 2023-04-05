pageextension 50065 PostedPurchInvsExt extends "Posted Purchase Invoices"
{
    layout
    {
        addafter("Buy-from Vendor Name")
        {
            field("Posting Description"; rec."Posting Description")
            {
                ApplicationArea = all;
            }
        }
    }
}