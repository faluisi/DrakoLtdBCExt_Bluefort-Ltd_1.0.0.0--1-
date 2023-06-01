pageextension 50007 SalesQuoteSubformExt extends "Sales Quote Subform"
{
    layout
    {
        modify("VAT Prod. Posting Group")
        {
            Visible = true;
        }
        addafter("VAT Prod. Posting Group")
        {
            // field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
            // {
            //     ApplicationArea = all;
            // }
            //DEVOPS #622 -- begin
            field(Site; Site)
            {
                ApplicationArea = all;
            }
            field("Period Start"; "Period Start")
            {
                ApplicationArea = all;
            }
            field("Period End"; "Period End")
            {
                ApplicationArea = all;
            }
            //DEVOPS #622 -- end
        }
    }
    actions
    {
    }
    var
}
