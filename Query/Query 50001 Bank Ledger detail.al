query 50001 "Bank Ledger detail"
{
    QueryType = Normal;
    elements
    {
        dataitem(BankAccountLedgerEntry; "Bank Account Ledger Entry")
        {
            column(Document_No; "Document No.")
            {
            }
            column(Posting_Date; "Posting Date")
            {
            }
            column(Bank_Account_No; "Bank Account No.")
            {
            }
            column(Description; Description)
            {
            }
            dataitem(GLEntry; "G/L Entry")
            {
                DataItemLink = "Document No." = BankAccountLedgerEntry."Document No.",
"Posting Date" = BankAccountLedgerEntry."Posting Date";
                column(G_L_Account_No; "G/L Account No.")
                {
                }
                column(Sum_Amount; Amount)
                {
                    Method = Sum;
                }
            }
        }
    }
}

