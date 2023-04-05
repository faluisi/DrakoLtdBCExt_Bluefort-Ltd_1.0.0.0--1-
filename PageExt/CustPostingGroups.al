pageextension 50077 CustPostGroupsExt extends "Customer Posting Groups"
{
    layout
    {
        addlast(Control1)
        {
            field(BudgetAccount; rec.BudgetAccount)
            {
                ApplicationArea = all;
            }
        }

    }
}