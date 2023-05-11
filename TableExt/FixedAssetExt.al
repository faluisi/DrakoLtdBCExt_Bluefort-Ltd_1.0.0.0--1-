tableextension 50016 FixedAssetExt extends "Fixed Asset"
{
    fields
    {
        modify("Serial No.")
        {
            trigger OnAfterValidate()
            begin
                FA.Reset();
                FA.SetFilter("Serial No.", Rec."Serial No.");
                if FA.FindFirst() then error(Text000, FA."No.");
            end;
        }

        field(50002; "Date Prepared"; Date)
        {
            Caption = 'Date Prepared';
        }
        field(50003; Brand; Option)//no
        {
            Caption = 'Brand';
            OptionCaption = ' ,FBM,DINGO';
            OptionMembers = " ",FBM,DINGO;
        }
        field(50004; Lessee; Option)//no
        {
            Caption = 'Lessee';
            OptionCaption = ' ,NTT PH,D2R PH';
            OptionMembers = " ","NTT PH","D2R PH";
        }

        field(50005; "Fa Posting Group Depr"; Code[20])
        {
            Caption = 'Fa Posting Group Depr';
            FieldClass = FlowField;
            CalcFormula = lookup("FA Depreciation Book"."FA Posting Group" where("FA No." = field("No."), "Depreciation Book Code" = filter('COMPANY')));
        }
        field(50006; Status; Enum "FA Status")
        {
            Caption = 'FA Status';

        }
        field(50007; Is_EGM; Boolean)
        {
            Caption = 'Is EGM';
            FieldClass = FlowField;
            CalcFormula = lookup("FA Subclass".EGM where(code = field("FA Subclass Code")));

        }


    }
    var
        FA: Record "Fixed Asset";
        Text000: Label 'Fixed Asset %1 has the same Serial No.!';
}
