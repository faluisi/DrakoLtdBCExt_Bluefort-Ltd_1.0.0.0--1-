tableextension 50000 CompanyInformationExt extends "Company Information"
{
    fields
    {
        field(50000; "Bank Address"; Text[250])//no
        {
            DataClassification = ToBeClassified;
            Caption = 'Bank Address';
        }
        field(50001; "Customer Is Operator"; Boolean)//no
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Is Operator';
        }
        field(50002; "TIN Number"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'TIN Number';
        }
    }
    var
}
