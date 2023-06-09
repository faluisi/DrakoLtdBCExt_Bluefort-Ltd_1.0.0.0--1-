pageextension 50025 PostedSalesInvoiceExt extends "Posted Sales Invoice"
{
    layout
    {
        addafter("External Document No.")
        {
            field(Site; rec.Site)
            {
                ApplicationArea = All;
            }
            field(Segment; rec.Segment)
            {
                ApplicationArea = All;
            }
            //DevOps #619 -- begin
            field("Contract Code"; rec."Contract Code")
            {
                ApplicationArea = All;
                //Editable = false;
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
            field(Currency2; rec.Currency2)
            {
                ApplicationArea = all;
                Editable = false;
            }

        }
        addafter("Currency Code")
        {
            field("Customer Payment Bank Code"; rec."Customer Payment Bank Code")
            {
                ApplicationArea = all;
                Editable = false;
            }

            field("Customer Payment Bank Code2"; rec."Customer Payment Bank Code2")
            {
                ApplicationArea = all;
                Editable = false;
            }

        }
        modify("Company Bank Account Code")
        {

            Visible = false;
        }
        addlast(factboxes)
        {

            part(signature; Factbox_SIH)
            {

                SubPageLink = "No." = field("No.");
            }
        }
    }
    actions
    {
        addLast(Navigation)
        {
            action(ChangePeriodDate)
            {
                Caption = 'Change Period Date';
                Image = ChangeDate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction();
                begin

                    CLEAR(InputDialog);
                    search := 'Period Date';
                    InputDialog.SetValues(search, "Period Start", "Period End");
                    IF ACTION::OK = InputDialog.RUNMODAL THEN BEGIN
                        InputDialog.GetValues(search, PeriodStart, PeriodEnd);
                        changedate.ChangeSalesInvoiceDate(PeriodStart, PeriodEnd, Rec);
                        CurrPage.UPDATE;
                    END;
                end;
            }
        }
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
        changedate: Codeunit "Change Periode Date Sales";
        PeriodStart: Date;
        PeriodEnd: Date;
        InputDialog: Page "Input Dialog Page";
        search: Text;
}
