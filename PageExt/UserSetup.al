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
        addafter("Email")
        {
            field("Item Filter"; "Item Filter")
            {
                ApplicationArea = All;
            }

            field("Bank Filter"; "Bank Filter")
            {
                ApplicationArea = All;
            }
            field("Approve Finance"; "Approve Finance")
            {

            }
        }
    }
    actions
    {
    }
    var
}
