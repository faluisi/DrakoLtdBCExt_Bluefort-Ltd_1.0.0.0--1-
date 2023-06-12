tableextension 50088 DetVendLEExt extends "Detailed Vendor Ledg. Entry"
{
    fields
    {
        field(50026; approved; Boolean)
        {
            Caption = 'Finance Approved';

            FieldClass = FlowField;
            CalcFormula = lookup("Vendor Ledger Entry".approved where("Entry No." = field("Vendor Ledger Entry No.")));

        }
        field(50027; "Default Bank Account"; Code[20])
        {
            TableRelation = "Bank Account";
            Caption = 'Default Bank Account';

            FieldClass = FlowField;
            CalcFormula = lookup(Vendor."Default Bank Account" where("No." = field("Vendor No.")));
        }

    }

}