pageextension 50011 PostedSalesInvoiceSubformExt extends "Posted Sales Invoice Subform"
{
    layout
    {
        addafter("Variant Code")
        {
            // field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
            // {
            //     ApplicationArea = all;
            // }
            // field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
            // {
            //     ApplicationArea = all;
            // }
            //DEVOPS #622 -- begin
            field("Period Start"; "Period Start")
            {
                ApplicationArea = all;
            }
            field("Period End"; "Period End")
            {
                ApplicationArea = all;
            }
            //DEVOPS #622 -- end
        }
    }
    actions
    {
        addLast(processing)
        {
            action(ChangeGroup)
            {
                Caption = 'Change Posting Group';

                trigger OnAction();
                var
                    InputDialog: Page "Input Dialog Post Group";
                    GenBusGroup: Code[20];
                    GenItemgroup: Code[20];
                    search: Text;
                    change: Codeunit "Change Periode Date Sales";
                begin

                    CLEAR(InputDialog);
                    search := 'Item Posting Group';
                    InputDialog.SetValues(search, "Gen. Bus. Posting Group", "Gen. Prod. Posting Group");
                    IF ACTION::OK = InputDialog.RUNMODAL THEN BEGIN
                        InputDialog.GetValues(search, GenBusGroup, GenItemgroup);
                        change.ChangeSalesInvoicePostGroup(GenBusGroup, GenItemgroup, Rec);
                        CurrPage.UPDATE;
                    END;
                end;
            }
        }
    }
    var
        changedate: Codeunit "Change Periode Date Sales";

}
