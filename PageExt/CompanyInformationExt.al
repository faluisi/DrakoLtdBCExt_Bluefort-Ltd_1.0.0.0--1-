pageextension 50000 CompanyInformationExt extends "Company Information"
{
    layout
    {
        addafter("Bank Account No.")
        {
            field("Bank Address"; "Bank Address")
            {
                ApplicationArea = All;
            }
        }
        addafter(GLN)
        {
            field("Customer Is Operator"; "Customer Is Operator")
            {
                ApplicationArea = All;
            }
        }
        addafter("VAT Registration No.")
        {
            field("TIN Number"; "TIN Number")
            {
                ApplicationArea = All;
            }
        }

        addlast(General)
        {
            field(FBM_EnableWS; rec.FBM_EnableWS)
            {
                ApplicationArea = All;
            }
            field(FBM_EnableSiteWS; rec.FBM_EnableSiteWS)
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

                    trigger OnAction()
                    begin
                        PaymentBankP.Editable(true);
                        PaymentBankP.Run()
                    end;
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
        addlast(Processing)
        {
            action("Fix Data")
            {
                ApplicationArea = All;
                Image = Database;

                trigger OnAction()
                var
                    custsite: record "Customer-Site";
                    custopsite: Record "Cust-Op-Site";
                    window: Dialog;
                    nrec: Integer;
                    crec: Integer;
                begin
                    custsite.DeleteAll();
                    // Window.OPEN('Processing data... @1@@@@@@@@@@');
                    // nrec := custopsite.count;
                    // if custopsite.FindFirst() then
                    //     repeat

                    //         crec += 1;
                    //         IF nrec <= 100 THEN
                    //             Window.UPDATE(1, (crec / nrec * 10000) DIV 1)
                    //         ELSE
                    //             IF crec MOD (nrec DIV 100) = 0 THEN
                    //                 Window.UPDATE(1, (crec / nrec * 10000) DIV 1);
                    //         custsite.Init();
                    //         custsite."Customer No." := custopsite."Customer No.";
                    //         custsite."Site Code" := custopsite."Site Code";
                    //         if not custsite.get(custopsite."Customer No.", custopsite."Site Code") then
                    //             custsite.Insert();
                    //     until custopsite.Next() = 0;
                    // window.Close();
                end;
            }
        }
    }
    var
        PaymentBankP: Page "PaymentBankAccounts";
}
