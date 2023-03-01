tableextension 50002 FASetupExt extends "FA Setup"
{
    fields
    {
        field(50000; "Enable FA Site Tracking"; Boolean)//no
        {
            Caption = 'Enable FA Site Tracking';
        }
        field(50001; "Customer Dimension"; Code[20])//no
        {
            Caption = 'Customer Dimension';
            TableRelation = Dimension.Code;
        }
        field(50002; "Operator Dimension"; Code[20])//no
        {
            Caption = 'Operator Dimension';
            TableRelation = Dimension.Code;
        }
        field(50003; "Site Dimension"; Code[20])
        {
            Caption = 'Site Dimension';
            TableRelation = Dimension.Code;
        }
        field(50004; "FA Company"; Text[30])//no
        {
            //this field will hold the link to the 'mother' company where FAs are held
            Caption = 'Fixed Asset Company';
            TableRelation = Company.Name;
        }
        //DevOps #619 -- begin
        field(50005; "Contract Dimension"; Code[20])//no
        {
            Caption = 'Contract Dimension';
            TableRelation = Dimension.Code;
        }
    }
    var
}
