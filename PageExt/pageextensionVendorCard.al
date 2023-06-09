pageextension 50055 VendorCardExt extends "Vendor Card"
{
    layout
    {
        addafter("Disable Search by Name")
        {
            field("Default Bank Account"; "Default Bank Account")
            {
                ApplicationArea = All;
            }


        }
        addlast(General)
        {
            field("Print Name on Check"; Rec."Print Name on Check")
            {
                ApplicationArea = All;
            }
        }
    }
}