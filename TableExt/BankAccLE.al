tableextension 50087 BancAccLE extends "Bank Account Ledger Entry"
{
    fields
    {
        field(50004; "Approval Batch Amount2"; Decimal)
        {
            FieldClass = FlowField;

            CalcFormula = Sum("Detailed Vendor Ledg. Entry".Amount where
             ("Default Bank Account" = field("Bank Account No."), Open = filter(true), approved = filter(true)));
        }

    }

}