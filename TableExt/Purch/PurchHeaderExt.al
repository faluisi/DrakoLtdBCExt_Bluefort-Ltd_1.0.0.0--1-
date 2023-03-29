tableextension 50025 PurchheaderExt extends "Purchase Header"
{
    fields
    {
        field(50000; Site; code[20])
        {
            TableRelation = "Cust-Op-Site"."Site Code";
            ValidateTableRelation = false;
        }

        field(50020; "Consignee"; code[20])
        {
            Caption = 'Consignee';
            TableRelation = Customer;
            ValidateTableRelation = false;

        }
        field(50021; "Consignee Name"; Text[100])
        {
            Caption = 'Consignee Name';
        }
        field(50022; "Consignee Name 2"; Text[50])
        {
            Caption = 'Consignee Name 2';
        }
        field(50023; "Consignee Address"; Text[100])
        {
            Caption = 'Consignee Address';
        }
        field(50024; "Consignee Address 2"; Text[50])
        {
            Caption = 'Consignee Address 2';
        }
        field(50025; "Consignee City"; Text[30])
        {
            Caption = 'Consignee City';

        }
        field(50026; "Consignee Contact"; Text[100])
        {
            Caption = 'Consignee Contact';
        }
        field(50027; "Consignee Post Code"; Text[30])
        {
            Caption = 'Consignee Post Code';

        }
        field(50028; "Consignee Country"; Text[2])
        {
            Caption = 'Consignee Country';

        }
        field(50029; "Consignee County"; Text[30])
        {
            Caption = 'Consignee County';

        }
        field(50030; "Requisition"; Text[30])
        {
            Caption = 'Requisition Nr.';

        }
    }

}