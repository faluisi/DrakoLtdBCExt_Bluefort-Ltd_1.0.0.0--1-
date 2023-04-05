pageextension 50075 CustPostGroupExt extends "Customer Posting Group Card"
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