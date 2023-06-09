pageextension 50026 PostedSalesCrMemoExt extends "Posted Sales Credit Memo"
{
    layout
    {
        addafter("External Document No.")
        {
            field(Site; rec.Site)
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
        addlast(factboxes)
        {

            part(signature; Factbox_SCH)
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
                        changedate.ChangeSalesCrMemoDate(PeriodStart, PeriodEnd, Rec);
                        CurrPage.UPDATE;
                    END;
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
