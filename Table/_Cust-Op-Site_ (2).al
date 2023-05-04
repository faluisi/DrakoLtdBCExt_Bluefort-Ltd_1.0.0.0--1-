table 50006 "Cust-Op-Site"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(2; "Operator No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Site Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Site Code 2"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Vat Number"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        FIELD(100; "Site Name"; text[250])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Customer-Site"."Site Name" where("Customer No." = field("Customer No."), "Site Code" = field("Site Code")));
        }
        FIELD(101; "Site Address"; text[250])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Customer-Site".Address where("Customer No." = field("Customer No."), "Site Code" = field("Site Code")));
        }
        field(102; Subsidiary; Text[3])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Customer No.", "Operator No.", "Site Code")
        {
            Clustered = true;
        }

        key(key1; "Site Code 2")
        {


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
