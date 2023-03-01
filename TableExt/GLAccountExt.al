tableextension 50009 GLAccountExt extends "G/L Account"
{
    fields
    {
        field(50000; "Periods Required"; Boolean)
        {
        }
        field(60045; "Gen. Prod. Posting Group2"; Code[20])//no
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";

            trigger OnValidate()
            var
                GenProdPostingGrp: Record "Gen. Product Posting Group";
            begin

                if xRec."Gen. Prod. Posting Group2" <> "Gen. Prod. Posting Group2" then
                    if GenProdPostingGrp.ValidateVatProdPostingGroup(GenProdPostingGrp, "Gen. Prod. Posting Group2") then
                        "VAT Prod. Posting Group" := GenProdPostingGrp."Def. VAT Prod. Posting Group";
                "Gen. Prod. Posting Group" := "Gen. Prod. Posting Group2"
            end;
        }
    }
    var
        myInt: Integer;
}
