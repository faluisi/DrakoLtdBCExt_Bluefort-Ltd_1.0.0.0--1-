page 50011 "PaymentBankAccountCard"
{
    Caption = 'Payment Bank Account Card';
    PageType = Card;
    //ApplicationArea = All;
    //UsageCategory = Lists;
    SourceTable = "Payment Bank Accounts";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'Bank Details';

                field("Bank Code"; rec."Bank Code")
                {
                    ApplicationArea = All;
                }
                field("Bank Name"; rec."Bank Name")
                {
                    ApplicationArea = All;
                }
                field("Bank Branch No."; rec."Bank Branch No.")
                {
                    ApplicationArea = All;
                }
                field("Bank Account No."; rec."Bank Account No.")
                {
                    ApplicationArea = All;
                }
                field("Bank Address"; rec."Bank Address")
                {
                    ApplicationArea = All;
                }
                field("Bank Address 2"; rec."Bank Address 2")
                {
                    ApplicationArea = All;
                }
                field("Payment Routing No."; rec."Payment Routing No.")
                {
                    ApplicationArea = All;
                }
                field("Giro No."; rec."Giro No.")
                {
                    ApplicationArea = All;
                }
                field("SWIFT Code"; rec."SWIFT Code")
                {
                    ApplicationArea = All;
                }
                field("IBAN"; rec."IBAN")
                {
                    ApplicationArea = All;
                }
                field("Currency"; rec."Currency")
                {
                    ApplicationArea = All;
                }
                field(BeneficiaryBank; rec.BeneficiaryBank)
                {
                    ApplicationArea = All;
                }
            }
            group(Intermediary)
            {
                Caption = 'Intermediary Details';

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
    actions
    {
        area(Processing)
        {
        }
    }
}
