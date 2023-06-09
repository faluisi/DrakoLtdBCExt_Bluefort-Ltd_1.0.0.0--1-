pageextension 50058 ItemListExtOneTech extends "Item List"
{
    layout
    {
        addafter("Description")
        {
            field("Description 2"; "Description 2")
            {
                ApplicationArea = all;
            }

        }
    }
    actions
    {
    }

    var

        usersetup: Record "User Setup";


    trigger OnOpenPage()
    begin
        if usersetup.Get(UserId) then begin
            if usersetup."Item Filter" <> '' then
                Rec.SetFilter("No.", usersetup."Item Filter");

        end;


    end;
}