tableextension 50007 SalesCrMemoHeaderExt extends "Sales Cr.Memo Header"
{
    fields
    {
        field(50000; Site; Code[20])
        {
            TableRelation = "Cust-Op-Site"."Site Code";

            trigger OnValidate()
            begin
                // CustSite.Reset();
                // if CustSite.Get("Sell-to Customer No.", Site) then begin
                //     if CustSite."Contract Code" <> '' then begin
                //         Rec.Validate("Contract Code", CustSite."Contract Code");
                //         Rec.Modify();
                //     end;
                // end;

                // SalesLineRec.Reset();
                // SalesLineRec.SetRange("Document No.", Rec."No.");
                // SalesLineRec.SetRange(Type, Rec."Document Type");
                // SalesLineRec.SetRange(Type, SalesLineRec.Type::Item);
                // IF SalesLineRec.FindSet() THEN
                //     repeat
                //         SalesLineRec.Site := Rec.Site;
                //         SalesLineRec.Modify();
                //     until SalesLineRec.Next() = 0;
            end;
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
        field(50003; "Period Start"; Date)
        {
        }
        field(50004; "Period End"; Date)
        {
        }

        field(50007; "LocalCurrAmt"; Decimal)
        {
            caption = 'Local Currency Amount';

        }
        field(50010; "Currency2"; code[10])
        {
            caption = 'Local Currency';
            TableRelation = Currency;

        }
        field(50011; Segment; Option)
        {
            caption = 'Segment ';
            OptionMembers = " ",Bingo,Spin;

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
    }

}
