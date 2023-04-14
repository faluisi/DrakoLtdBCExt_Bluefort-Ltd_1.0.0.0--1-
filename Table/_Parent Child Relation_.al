table 50003 "Parent Child Relation"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Parent; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Dimension.Code;
        }
        field(2; Child; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Dimension.Code;
        }
    }
    keys
    {
        key(PK; Parent, Child)
        {
            Clustered = true;
        }
    }



}
