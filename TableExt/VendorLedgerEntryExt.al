tableextension 50027 VendorLedgerEntryExt extends "Vendor Ledger Entry"
{
    fields
    {
        field(50000; approved; Boolean)
        {
            Caption = 'Finance Approved';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if approved = true then begin
                    "approved date" := System.CurrentDateTime();
                    "approved user" := UserId;
                end
                else begin
                    Clear("approved date");
                    Clear("approved user");
                end;

            end;
        }
        field(50001; "approved date"; DateTime)
        {
            Caption = 'Finance Approved Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50002; "approved user"; Text[50])
        {
            Caption = 'Finance Approved User';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(50003; "Approver Comment"; Text[50])
        {
            Caption = 'Finance Approver Comment';
            DataClassification = ToBeClassified;
            Editable = true;
        }
    }
}
