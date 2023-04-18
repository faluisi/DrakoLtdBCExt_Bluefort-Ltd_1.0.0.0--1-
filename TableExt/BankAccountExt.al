tableextension 50030 BankAccount extends "Bank Account"
{
    fields
    {
        field(50000; "Check Layout Code"; code[20])
        {
            caption = 'Check Layout';
            TableRelation = "Custom Report Layout" where("Report ID" = const(50041));
        }
    }


}