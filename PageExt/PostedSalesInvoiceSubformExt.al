pageextension 50011 PostedSalesInvoiceSubformExt extends "Posted Sales Invoice Subform"
{
    layout
    {
        addafter("Variant Code")
        {
            // field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
            // {
            //     ApplicationArea = all;
            // }
            // field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
            // {
            //     ApplicationArea = all;
            // }
            //DEVOPS #622 -- begin
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
}
