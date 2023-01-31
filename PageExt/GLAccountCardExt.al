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
            field("Period Required"; rec."Periods Required")
            {
                ApplicationArea = all;
            }
        }
        addafter("Gen. Prod. Posting Group")
        {
            field("Gen. Prod. Posting Group2"; rec."Gen. Prod. Posting Group2")
            {
                ApplicationArea = all;
            }
        }
        modify("Gen. Prod. Posting Group")
        {
            Visible = false;
        }
    }
    actions
    {
    }
    trigger
    OnAfterGetRecord()
    begin
        rec."Gen. Prod. Posting Group2" := rec."Gen. Prod. Posting Group";
    end;
}
