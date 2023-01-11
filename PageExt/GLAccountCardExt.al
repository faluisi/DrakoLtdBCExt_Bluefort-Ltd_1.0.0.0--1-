pageextension 50016 GLAccountCardExt extends "G/L Account Card"
{
    layout
    {
        //addafter("No.")
        //{
        //field("No. 2";"No. 2")
        //{
        //ApplicationArea = all;
        //}
        //}
        addbefore(Blocked)
        {
            field("Period Required"; "Periods Required")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
    }
    var
}
