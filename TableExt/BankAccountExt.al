tableextension 50030 BankAccount extends "Bank Account"
{
    fields
    {
        field(50000; "Check Layout Code"; code[20])
        {
            caption = 'Check Layout';
            TableRelation = "Custom Report Layout" where("Report ID" = const(50041));
        }
        field(50003; "Approval Batch Amount"; Decimal)
        {
            FieldClass = FlowField;


            CalcFormula = Sum("Gen. Journal Line"."Amount" where("Bal. Account No." = FIELD("No."),
             "Journal Batch Name" = filter('APPROVALS'),
             "Reason Code" = filter('APPROVED')));



        }
        field(50004; "Approval Batch Amount2"; Decimal)
        {
            FieldClass = FlowField;

            CalcFormula = Sum("Detailed Vendor Ledg. Entry".Amount where
             ("Default Bank Account" = field("Bank Account No."), Open = filter(true), approved = filter(true)));
        }

        // Add changes to table fields here

    }


}