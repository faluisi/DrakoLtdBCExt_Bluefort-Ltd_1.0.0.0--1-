pageextension 50000 CompanyInformationExt extends "Company Information"
{
  layout
  {
    addafter("Bank Account No.")
    {
      field("Bank Address";"Bank Address")
      {
        ApplicationArea = All;
      }
    }
    addafter(GLN)
    {
      field("Customer Is Operator";"Customer Is Operator")
      {
        ApplicationArea = All;
      }
    }
    addafter("VAT Registration No.")
    {
      field("TIN Number";"TIN Number")
      {
        ApplicationArea = All;
      }
    }
  }
  actions
  {
    addlast(navigation)
    {
      group("Payment Banks")
      {
        action("Payment Bank Accounts")
        {
          ApplicationArea = All;
          Image = Bank;

          trigger OnAction()begin
            PaymentBankP.Editable(true);
            PaymentBankP.Run()end;
        }
      /* action("Run Dimensions")
                {
                    ApplicationArea = All;
                    trigger OnAction()
                    begin
                        Codeunit.run(50005);
                    end;
                } */
      }
    }
  }
  var PaymentBankP: Page "PaymentBankAccounts";
}
