table 50007 "Payment Bank Accounts"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(13; "Bank Code"; Code[20]) // fix ids
        {
        }
        field(1; "Bank Name"; Text[100])
        {
        }
        field(2; "Bank Branch No."; Text[20])
        {
        }
        field(3; "Bank Account No."; Text[30])
        {
        }
        field(4; "Bank Address"; Text[250])
        {
        }
        field(5; "Payment Routing No."; Text[20])
        {
        }
        field(6; "Giro No."; Text[20])
        {
        }
        field(7; "SWIFT Code"; Code[20])
        {
        }
        field(8; "IBAN"; Code[50])
        {
        }
        field(9; "Intermediary Bank"; Text[100])
        {
        }
        field(10; "Intermediary SWIFT"; Code[20])
        {
        }
        field(11; "Bank Address 2"; Text[250])
        {
        }
        field(12; "Currency"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
        }
        field(50011; "BeneficiaryBank"; text[100])
        {
            caption = 'Payment Bank Beneficiary ';

        }
    }
    keys
    {
        key(PK; "Bank Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Bank Code", "Bank Name", "Bank Account No.")
        {
        }
    }
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
