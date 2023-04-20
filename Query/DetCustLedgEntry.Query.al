query 50004 "Det. Cust. Ledg. Entry"
{

    elements
    {
        dataitem(QueryElement10; "Cust. Ledger Entry")
        {
            column(Open; Open)
            {
            }
            column(Document_No; "Document No.")
            {
            }
            column(Document_Type; "Document Type")
            {
            }
            column(Description; Description)
            {
            }
            dataitem(QueryElement1; "Detailed Cust. Ledg. Entry")
            {
                DataItemLink = "Cust. Ledger Entry No." = QueryElement10."Entry No.";
                column(Entry_Type; "Entry Type")
                {
                }
                column(Posting_Date; "Posting Date")
                {
                }
                column(Amount; Amount)
                {
                }
                column(Amount_LCY; "Amount (LCY)")
                {
                }
                column(Currency_Code; "Currency Code")
                {
                }
                column(Initial_Entry_Due_Date; "Initial Entry Due Date")
                {
                }
                column(Gen_Bus_Posting_Group; "Gen. Bus. Posting Group")
                {
                }
                column(Transaction_No; "Transaction No.")
                {
                }
                dataitem(QueryElement14; Customer)
                {
                    DataItemLink = "No." = QueryElement10."Customer No.";
                    column(Name; Name)
                    {
                    }
                    column(Customer_Posting_Group; "Customer Posting Group")
                    {
                    }
                }
            }
        }
    }
}

