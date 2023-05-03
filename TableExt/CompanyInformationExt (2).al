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
        field(70000; FBM_EnableWS; Boolean)
        {
            caption = 'Enable WebServices';
        }
        field(70001; FBM_EnableSiteWS; Boolean)
        {

            caption = 'Enable Site WebServices';
        }
        field(70002; FBM_Migration; Boolean)
        {

            caption = 'Enable Migration';
        }
        field(70003; FBM_EnableSpin; Boolean)
        {

            caption = 'Enable Spin';
        }
    }
    var
}
