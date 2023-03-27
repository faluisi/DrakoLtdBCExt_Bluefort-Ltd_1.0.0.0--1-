pageextension 50045 PaymentJournalExt extends "Payment Journal"
{
    layout
    {
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
            field("Check No. PHL"; rec."Check No. PHL")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
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
