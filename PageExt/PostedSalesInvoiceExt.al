pageextension 50025 PostedSalesInvoiceExt extends "Posted Sales Invoice"
{
    layout
    {
        addafter("External Document No.")
        {
            field(Site; Site)
            {
                ApplicationArea = All;
            }
            //DevOps #619 -- begin
            field("Contract Code"; rec."Contract Code")
            {
                ApplicationArea = All;
                Editable = false;
            }
            //DevOps #619 -- end
            //DEVOPS #622 -- begin
            field("Period Start"; rec."Period Start")
            {
                ApplicationArea = all;
                Editable = false;
            }
            field("Period End"; rec."Period End")
            {
                ApplicationArea = all;
                Editable = false;
            }
            //DEVOPS #622 -- end
        }
        addlast(General)
        {
            field(LocalCurrAmt; rec.LocalCurrAmt)
            {
                ApplicationArea = all;
                Editable = false;
            }
        }
    }
    actions
    {
        addfirst(Navigation)
        {
            action("Print Billing Statement")
            {
                ApplicationArea = all;
                // RunObject = Report "NTT Sales - Billing Statement";

                Image = Print;
                trigger OnAction()
                var
                    rep: report "NTT Sales - Billing Statement";
                    currentdoc: Record "Sales Invoice Header";
                    rep1: report "NTT SALES BILLING NEW";

                begin
                    currentdoc.SetRange("No.", rec."No.");

                    if (CompanyName = 'D2R Ltd Branch') then begin

                        rep1.SetTableView(currentdoc);
                        rep1.Run();
                    end

                    else
                        if (currentdoc.FindFirst()) then begin
                            rep.SetTableView(currentdoc);
                            rep.Run();

                        end;

                end;

            }
        }
    }
    var
}
