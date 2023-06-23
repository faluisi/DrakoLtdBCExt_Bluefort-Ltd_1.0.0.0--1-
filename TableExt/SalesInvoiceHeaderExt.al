tableextension 50003 SalesInvoiceHederExt extends "Sales Invoice Header"
{
    fields
    {
        field(50000; Site; Code[20])
        {
            Caption = 'Site';
            TableRelation = "Cust-Op-Site"."Site Code";
            trigger OnValidate()
            begin
                CustSite.Reset();
                if CustSite.Get("Sell-to Customer No.", Site) then begin
                    // if CustSite."Contract Code" <> '' then begin
                    //     Rec.Validate("Contract Code", CustSite."Contract Code");
                    //     Rec.Modify();
                    // end;
                end;

                SalesLineRec.Reset();
                SalesLineRec.SetRange("Document No.", Rec."No.");
                SalesLineRec.SetRange("Document Type", SalesLineRec."Document Type"::Invoice);
                // SalesLineRec.SetRange(Type, SalesLineRec.Type::Item);
                IF SalesLineRec.FindSet() THEN
                    repeat
                        SalesLineRec.Site := Rec.Site;
                        SalesLineRec.Modify();
                    until SalesLineRec.Next() = 0;

                if (CustSite."Contract Code" <> '') and (CustSite."Contract Code2" = '') then begin
                    Segment := Segment::Bingo;
                    "Contract Code" := CustSite."Contract Code";
                end;
                if (CustSite."Contract Code" = '') and (CustSite."Contract Code2" <> '') then begin
                    Segment := Segment::Spin;
                    "Contract Code" := CustSite."Contract Code2";
                end;
            end;
            //DevOps #619 -- end
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
        field(50007; "LocalCurrAmt"; Decimal)
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
        field(50010; "Currency2"; code[10])
        {
            caption = 'Local Currency';
            TableRelation = Currency;

        }
        field(50012; signature_pic; MediaSet)
        {
            caption = 'Signature';


        }
        field(50111; "BeneficiaryBank"; text[100])
        {
            caption = 'Payment Bank Beneficiary ';

        }
        field(50112; "BeneficiaryBank2"; text[100])
        {
            caption = 'Payment Bank Beneficiary 2 ';

        }
        field(50011; Segment; Option)
        {
            caption = 'Segment ';
            OptionMembers = " ",Bingo,Spin;
            trigger

            OnValidate()
            begin
                if CustSite.Get("Sell-to Customer No.", Site) then begin
                    if (CustSite."Contract Code" <> '') and (CustSite."Contract Code2" = '') then begin
                        Segment := Segment::Bingo;
                        "Contract Code" := CustSite."Contract Code";
                    end;
                    if (CustSite."Contract Code" = '') and (CustSite."Contract Code2" <> '') then begin
                        Segment := Segment::Spin;
                        "Contract Code" := CustSite."Contract Code2";
                    end;

                    if (CustSite."Contract Code" <> '') and (CustSite."Contract Code2" <> '') then begin
                        if segment = Segment::Bingo then
                            "Contract Code" := CustSite."Contract Code";
                        if segment = Segment::Spin then
                            "Contract Code" := CustSite."Contract Code2";

                    end;
                end;
            end;

        }
    }
    var
        Cust: Record Customer;
        SalesLineRec: Record "Sales Line";
        Text000: Label 'This customer requires Separate Halls Invoicing.';
        Text001: Label 'This customer requires one invoice for all Halls.';
        CustSite: Record "Customer-Site";
}
