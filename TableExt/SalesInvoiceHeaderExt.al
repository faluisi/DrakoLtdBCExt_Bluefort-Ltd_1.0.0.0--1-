tableextension 50003 SalesInvoiceHederExt extends "Sales Invoice Header"
{
    fields
    {
        field(50000; Site; Code[20])
        {
            Caption = 'Site';
            TableRelation = "Cust-Op-Site"."Site Code";
        }
        //DevOps #619 -- begin
        field(50001; "Contract Code"; Code[4])
        {
            TableRelation = "Customer-Site"."Contract Code" WHERE("Customer No." = field("Sell-to Customer No."));

            trigger OnValidate()
            begin
            end;
        }
        //DevOps #619 -- end
        //DEVOPS #622 -- begin
        field(50002; "Period Start"; Date)
        {
        }
        field(50003; "Period End"; Date)
        {
        }
        field(50004; "Customer Payment Bank Code"; Code[100])
        {

            FieldClass = "Flowfield";
            CalcFormula = lookup(Customer."Payment Bank Code" where("No." = field("Sell-to Customer No.")));
        }

        field(50005; "Customer Payment Bank Name"; Code[100])
        {

            FieldClass = "Flowfield";
            CalcFormula = lookup(Customer."Payment Bank Code" where("No." = field("Sell-to Customer No.")));
        }
        field(50006; "Billing Statement"; Boolean)
        {


        }
        field(50007; "LocalCurrAmt"; Text[100])
        {
            caption = 'Local Currency Amount';

        }
        field(50008; "Customer Payment Bank Code2"; Code[100])
        {

            FieldClass = "Flowfield";
            CalcFormula = lookup(Customer."Payment Bank Code2" where("No." = field("Sell-to Customer No.")));
        }

        field(50009; "Customer Payment Bank Name2"; Code[100])
        {

            FieldClass = "Flowfield";
            CalcFormula = lookup(Customer."Payment Bank Code2" where("No." = field("Sell-to Customer No.")));
        }
    }
    var
}
