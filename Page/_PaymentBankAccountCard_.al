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

        field("Bank Code";"Bank Code")
        {
          ApplicationArea = All;
        }
        field("Bank Name";"Bank Name")
        {
          ApplicationArea = All;
        }
        field("Bank Branch No.";"Bank Branch No.")
        {
          ApplicationArea = All;
        }
        field("Bank Account No.";"Bank Account No.")
        {
          ApplicationArea = All;
        }
        field("Bank Address";"Bank Address")
        {
          ApplicationArea = All;
        }
        field("Bank Address 2";"Bank Address 2")
        {
          ApplicationArea = All;
        }
        field("Payment Routing No.";"Payment Routing No.")
        {
          ApplicationArea = All;
        }
        field("Giro No.";"Giro No.")
        {
          ApplicationArea = All;
        }
        field("SWIFT Code";"SWIFT Code")
        {
          ApplicationArea = All;
        }
        field("IBAN";"IBAN")
        {
          ApplicationArea = All;
        }
        field("Currency";"Currency")
        {
          ApplicationArea = All;
        }
      }
      group(Intermediary)
      {
        Caption = 'Intermediary Details';

        field("Intermediary Bank";"Intermediary Bank")
        {
          ApplicationArea = All;
        }
        field("Intermediary SWIFT Code";"Intermediary SWIFT")
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
