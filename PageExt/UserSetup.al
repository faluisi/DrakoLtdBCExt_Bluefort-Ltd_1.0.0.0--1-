pageextension 50044 UserSetup extends "User Setup"
{
    layout
    {
        addafter("Time Sheet Admin.")
        {
            field("See LCY in Journals"; rec."See LCY in Journals")
            {
                ApplicationArea = All;
            }

        }
    }
    actions
    {
    }
    var
}
