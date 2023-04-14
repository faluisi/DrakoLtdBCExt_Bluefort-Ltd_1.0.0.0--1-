tableextension 50001 CustomerExt extends Customer
{
    fields
    {
        field(50000; "Corporate Name"; Text[150])//no
        {
            Caption = 'Corporate Name';
        }
        field(50001; "Separate Halls Inv."; Boolean)
        {
            Caption = 'Separate Halls Invoice';
        }
        field(50002; "Customer Since"; Date)
        {
            Caption = 'Customer Since';
        }
        field(50003; "No. 2"; Code[20])
        {
        }
        field(50004; "Payment Bank Code"; Code[20])//no
        {
            DataClassification = ToBeClassified;
            TableRelation = "Payment Bank Accounts"."Bank Code";
        }
        field(50005; "Payment Bank Code2"; Code[20])//no
        {
            DataClassification = ToBeClassified;
            TableRelation = "Payment Bank Accounts"."Bank Code";
        }
        modify(Name)
        {
            trigger OnAfterValidate()
            begin
                FADimMgt.AddDimensions(Rec);
            end;
        }
    }
    keys
    {
        key(Key1; "Corporate Name")
        {
        }
    }
    var
        FADimMgt: Codeunit FixedAssetDimMgt;

    trigger OnRename()
    begin
        FADimMgt.RenameCustDim(xRec, Rec);
    end;
}
