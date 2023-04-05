pageextension 50078 VendPostGroupsExt extends "Vendor Posting Groups"
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