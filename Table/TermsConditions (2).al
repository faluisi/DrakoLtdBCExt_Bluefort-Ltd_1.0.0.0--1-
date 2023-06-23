table 50000 TermsConditions
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Country; Code[10])
        {
            caption = 'Country';
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region".Code;
        }
        field(2; "Line No."; Integer)
        {
            caption = 'Line No.';
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(3; "Terms Conditions"; Text[1000])
        {
            caption = 'Text';
        }
        field(10; DocType; Option)
        {
            OptionMembers = SI,PO,CM;
            caption = 'Document Type';
        }
    }
    keys
    {
        key(PK; country, DocType, "Line No.")
        {
            Clustered = true;
        }
    }
    var
    trigger OnInsert()
    begin
    end;

    trigger OnModify()
    begin
    end;

    trigger OnDelete()
    begin
    end;

    trigger OnRename()
    begin
    end;
}
