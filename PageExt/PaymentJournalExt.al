pageextension 50045 PaymentJournalExt extends "Payment Journal"
{
    layout
    {
        modify("Reason Code")
        {
            trigger OnBeforeValidate();
            var
                Publisher: Codeunit MyPublishers;
            begin
                Publisher.OnReasonCodeChanged(CurrPage.Banks.Page);
            end;
        }

        modify("Amount")
        {
            trigger OnBeforeValidate();
            var
                Publisher: Codeunit MyPublishers;
            begin
                Publisher.OnReasonCodeChanged(CurrPage.Banks.Page);
            end;
        }
        addlast(factboxes)
        {
            part("Banks"; "PaymentJournal Bank List Part")
            {
                ApplicationArea = Basic, Suite;

            }
        }
        modify("Amount (LCY)")
        {
            Visible = true;
            //Visible = SeeLCY;
        }
        modify("Currency Code")
        {
            Visible = true;
        }
        addafter("Bal. Account No.")
        {
            field("Check No. PHL"; rec."Check No. PHL")//restore
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        addlast(processing)
        {
            action("Suggest Vendor Payments New")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Suggest Vendor Payments New';
                Image = "Vendor";

                trigger OnAction()
                var
                    SuggestVendorPayments: Report "Suggest Vendor Payments New";
                begin
                    Clear(SuggestVendorPayments);
                    SuggestVendorPayments.SetGenJnlLine(Rec);
                    SuggestVendorPayments.RunModal;
                end;
            }
        }
    }
    var
        UserSetup: Record "User Setup";
        SeeLCY: Boolean;

    trigger OnOpenPage()
    begin
        UserSetup.Reset();
        if UserSetup.Get(USERID) then
            SeeLCY := UserSetup."See LCY in Journals"
        else
            SeeLCY := false;
    end;
}
