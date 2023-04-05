tableextension 50012 GenJournalLineExt extends "Gen. Journal Line"
{
    fields
    {
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
