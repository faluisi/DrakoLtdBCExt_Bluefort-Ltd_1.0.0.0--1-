tableextension 50010 SalesInvoiceLineExt extends "Sales Invoice Line"
{
    fields
    {
        //DEVOPS #622 -- begin
        field(50000; "Period Start"; Date)
        {
        }
        field(50001; "Period End"; Date)
        {
        }
        field(50003; Site; Code[20])
        {
            Caption = 'Site';
            TableRelation = "Cust-Op-Site"."Site Code";
        }
        //DEVOPS #623 -- end
    }
}
