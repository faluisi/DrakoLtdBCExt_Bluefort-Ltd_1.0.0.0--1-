page 50010 PaymentBankAccounts
{
    Caption = 'Payment Bank Accounts';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Payment Bank Accounts";
    Editable = false;
    CardPageId = 50011;
    InsertAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Bank Code"; "Bank Code")
                {
                    ApplicationArea = All;
                }
                field("Bank Name"; "Bank Name")
                {
                    ApplicationArea = All;
                }
                field("Bank Branch No."; "Bank Branch No.")
                {
                    ApplicationArea = All;
                }
                field("Bank Account No."; "Bank Account No.")
                {
                    ApplicationArea = All;
                }
                field("Bank Address"; "Bank Address")
                {
                    ApplicationArea = All;
                }
                field("Bank Address 2"; "Bank Address 2")
                {
                    ApplicationArea = All;
                }
                field("Payment Routing No."; "Payment Routing No.")
                {
                    ApplicationArea = All;
                }
                field("Giro No."; "Giro No.")
                {
                    ApplicationArea = All;
                }
                field("SWIFT Code"; "SWIFT Code")
                {
                    ApplicationArea = All;
                }
                field("IBAN"; "IBAN")
                {
                    ApplicationArea = All;
                }
                field("Currency"; "Currency")
                {
                    ApplicationArea = All;
                }
                field("Intermediary Bank"; "Intermediary Bank")
                {
                    ApplicationArea = All;
                }
                field("Intermediary SWIFT Code"; "Intermediary SWIFT")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
