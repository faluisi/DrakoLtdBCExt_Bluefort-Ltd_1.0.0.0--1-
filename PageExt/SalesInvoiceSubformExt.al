pageextension 50004 SalesInvoiceSubformExt extends "Sales Invoice Subform"
{
    layout
    {
        modify("VAT Prod. Posting Group")
        {
            Visible = true;
        }

        addafter("VAT Prod. Posting Group")
        {

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

        addafter("Quantity")
        {

            field(Site; Site)
            {

                ApplicationArea = all;
            }

        }
    }
}
