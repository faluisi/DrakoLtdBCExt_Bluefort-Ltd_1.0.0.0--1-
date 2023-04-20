query 50005 "G/L Entry Bank Acc. Ledger"
{

    elements
    {
        dataitem(QueryElement1; "G/L Entry")
        {
            column(G_L_Account_No; "G/L Account No.")
            {
            }
            column(Posting_Date; "Posting Date")
            {
            }
            column(Document_No; "Document No.")
            {
            }
            column(Description; Description)
            {
            }
            column(Amount; Amount)
            {
                Method = Sum;
            }
            column(Transaction_No; "Transaction No.")
            {
            }
            column(Dimension_Set_ID; "Dimension Set ID")
            {
            }
            column(DebitAmount; "Debit Amount")
            {
                Method = Sum;
            }
            column(CreditAmount; "Credit Amount")
            {
                Method = Sum;
            }
            column(Reversed; Reversed)
            { }
            column(ReversedbyEntryNo; "Reversed by Entry No.")
            { }
            column(ReversedEntryNo; "Reversed Entry No.")
            { }
            dataitem(QueryElement9; "Bank Account Ledger Entry")
            {
                DataItemLink = "Transaction No." = QueryElement1."Transaction No.",
                            "Document No." = QueryElement1."Document No.",
                            "Posting Date" = QueryElement1."Posting Date";
                SqlJoinType = LeftOuterJoin;
                column(Min_Entry_No; "Entry No.")
                {
                    Method = Min;
                }
                column(Bank_Account_No; "Bank Account No.")
                {
                }
                column(Currency_Code; "Currency Code")
                {
                }
                column(AmountCurrency; Amount)
                {
                    Caption = 'Amount Currency';
                }
                column(Amount_LCY; "Amount (LCY)")
                {
                }
                dataitem(QueryElement11; "Bank Account")
                {
                    DataItemLink = "No." = QueryElement9."Bank Account No.";
                    column(No; "No.")
                    {
                    }
                    column(Bank_Account_Name; Name)
                    {
                    }
                    dataitem(QueryElement14; "Cust. Ledger Entry")
                    {
                        DataItemLink = "Posting Date" = QueryElement1."Posting Date",
                        "Transaction No." = QueryElement1."Transaction No.",
                        "Document No." = QueryElement1."Document No.";
                        SqlJoinType = LeftOuterJoin;
                        column(Customer_No; "Customer No.")
                        {
                        }

                        dataitem(QueryElement17; "Vendor Ledger Entry")
                        {
                            DataItemLink = "Posting Date" = QueryElement1."Posting Date",
                            "Transaction No." = QueryElement1."Transaction No.",
                            "Document No." = QueryElement1."Document No.";
                            SqlJoinType = LeftOuterJoin;
                            column(Vendor_No; "Vendor No.")
                            {
                            }
                            dataitem(QueryElement16; Customer)
                            {
                                DataItemLink = "No." = QueryElement14."Customer No.";
                                column(CustomerName; Name)
                                {
                                }
                                dataitem(QueryElement20; Vendor)
                                {
                                    DataItemLink = "No." = QueryElement17."Vendor No.";
                                    column(VendorName; Name)
                                    {
                                    }
                                }
                            }

                        }
                    }
                }
            }

        }
    }
}

