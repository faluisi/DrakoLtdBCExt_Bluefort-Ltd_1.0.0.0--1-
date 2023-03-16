tableextension 50025 PurchheaderExt extends "Purchase Header"
{
    fields
    {
        field(50000; Site; code[20])
        {
            TableRelation = "Cust-Op-Site"."Site Code";
        }
       
        field(50020; "Consignee"; code[20])
        {
            Caption = 'Consignee';
            TableRelation=Customer;

        }
    }

}