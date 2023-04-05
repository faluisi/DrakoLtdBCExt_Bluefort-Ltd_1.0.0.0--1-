pageextension 50076 VendPostGroupExt extends "Vendor Posting Group Card"
{
    layout
    {
        addlast(General)
        {
            field(BudgetAccount; rec.BudgetAccount)
            {
                ApplicationArea = all;
            }
        }

    }
}