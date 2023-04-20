query 50008 GlEntriesBI
{
    Caption = 'GlEntriesBI';


    elements
    {
        dataitem(G_L_Entry; "G/L Entry")
        {
            column(Entry_No; "Entry No.")
            {
            }
            column(Transaction_No; "Transaction No.")
            {
            }
            column(G_L_Account_No; "G/L Account No.")
            {
            }
            column(Description; Description)
            { }
            column(Posting_Date; "Posting Date")
            {
            }
            column(Document_Date; "Document Date")
            {
            }
            column(Document_Type; "Document Type")
            {
            }
            column(Document_No; "Document No.")
            {
            }
            column(Source_Code; "Source Code")
            {
            }
            column(Job_No; "Job No.")
            {
            }
            column(Business_Unit_Code; "Business Unit Code")
            {
            }
            column(Reason_Code; "Reason Code")
            {
            }
            column(Gen_Posting_Type; "Gen. Posting Type")
            {
            }
            column(Gen_Bus_Posting_Group; "Gen. Bus. Posting Group")
            {
            }
            column(Gen_Prod_Posting_Group; "Gen. Prod. Posting Group")
            {
            }
            column(Tax_Area_Code; "Tax Area Code")
            {
            }
            column(Tax_Liable; "Tax Liable")
            {
            }
            column(Tax_Group_Code; "Tax Group Code")
            {
            }
            column(Use_Tax; "Use Tax")
            {
            }
            column(VAT_Bus_Posting_Group; "VAT Bus. Posting Group")
            {
            }
            column(VAT_Prod_Posting_Group; "VAT Prod. Posting Group")
            {
            }
            column(IC_Partner_Code; "IC Partner Code")
            {
            }
            column(Amount; Amount)
            {
            }
            column(Debit_Amount; "Debit Amount")
            {
            }
            column(Credit_Amount; "Credit Amount")
            {
            }
            column(VAT_Amount; "VAT Amount")
            {
            }
            column(Additional_Currency_Amount; "Additional-Currency Amount")
            {
            }
            column(Add_Currency_Debit_Amount; "Add.-Currency Debit Amount")
            {
            }
            column(Add_Currency_Credit_Amount; "Add.-Currency Credit Amount")
            {
            }
            column(Dimension_Set_ID; "Dimension Set ID")
            {
            }
            column(G_L_Account_Name; "G/L Account Name")
            {
            }
            column(Reversed; Reversed)
            {
            }
            dataitem(Sales_Invoice_Header; "Sales Invoice Header")
            {
                DataItemLink = "No." = G_L_Entry."Document No.";
                column(Sell_to_Customer_No_; "Sell-to Customer No.")
                {
                }
                column(Sell_to_Customer_Name; "Sell-to Customer Name")
                {
                }
                column(Period_Start; "Period Start")
                {
                }
                dataitem(Purch__Inv__Header; "Purch. Inv. Header")
                {
                    DataItemLink = "No." = G_L_Entry."Document No.";
                    column(Buy_from_Vendor_No_; "Buy-from Vendor No.")
                    {
                    }
                    column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
                    {
                    }
                }
            }
        }

    }
}
