tableextension 50019 ItemExt extends Item
{
    fields
    {
        // Add changes to table fields here
    }

    fieldgroups
    {
        addlast(DropDown; "Description 2") { }
    }
    var
        myInt: Integer;
}

pageextension 50051 ItemCardExt extends "Item Card"
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
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}

