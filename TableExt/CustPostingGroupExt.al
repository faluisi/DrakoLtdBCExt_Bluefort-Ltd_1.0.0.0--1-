tableextension 50090 CustPostingGroupExt extends "Customer Posting Group"
{
    fields
    {
        field(50000; BudgetAccount; code[20])
        {
            Caption = 'Replace Budget Account for VAT';
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('BUDGET_ACCOUNT'));

        }

    }

}