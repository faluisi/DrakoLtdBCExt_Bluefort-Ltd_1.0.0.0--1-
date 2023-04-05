tableextension 50014 DetailedCustLedgerEntryExt extends "Detailed Cust. Ledg. Entry"
{
    fields
    {
        //DEVOPS #622 -- begin
        field(50000; "Period Start"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Period End"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; Site; Code[20])
        {
            TableRelation = "Cust-Op-Site"."Site Code";


        }
    }
    var
}
