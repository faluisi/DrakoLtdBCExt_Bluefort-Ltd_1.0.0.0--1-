pageextension 50026 PostedSalesCrMemoExt extends "Posted Sales Credit Memo"
{
    layout
    {
        addafter("External Document No.")
        {
            field(Site; rec.Site)
            {
                ApplicationArea = All;
            }
            //DevOps #619 -- begin
            field("Contract Code"; rec."Contract Code")
            {
                ApplicationArea = All;
                Editable = false;
            }
            //DevOps #619 -- end
            //DEVOPS #622 -- begin
            field("Period Start"; rec."Period Start")
            {
                ApplicationArea = all;
                Editable = false;
            }
            field("Period End"; rec."Period End")
            {
                ApplicationArea = all;
                Editable = false;
            }
            //DEVOPS #622 -- end
        }
        addlast(General)
        {
            field(LocalCurrAmt; rec.LocalCurrAmt)
            {
                ApplicationArea = all;
                Editable = false;
            }
        }
    }
    actions
    {
    }
    var
}
