page 50029 "Payment Approval"
{
    ApplicationArea = All;
    Caption = 'Payment Approval';
    PageType = List;
    SourceTable = "Vendor Ledger Entry";
    SourceTableView = where("Document Type" = filter(Invoice), Open = filter(true));
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the document type that the vendor entry belongs to.';
                    Editable = false;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the vendor entry''s document number.';
                    Editable = false;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the vendor entry''s posting date.';
                    Editable = false;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the due date on the entry.';
                    Editable = true;
                }
                field("Original Due Date"; GetOriginalDueDate(Rec))
                {
                    ApplicationArea = All;
                    Caption = 'Original Due Date';
                    ToolTip = 'Specifies the due date on the entry.';
                    Editable = false;
                }
                field("Vendor Name"; GetVendorNAme(Rec))
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the vendor account that the entry is linked to.';
                    Caption = 'Vendor Name';
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a description of the vendor entry.';
                    Editable = false;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                    Editable = false;
                }
                field("Default Bank Account"; "Default Bank Account")
                {

                }
                field("Approver Comment"; "Approver Comment")
                {

                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the amount field.';
                    Editable = false;
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remaining Amount field.';
                    Editable = false;
                }
                field(approved; Rec.approved)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the approved field.';
                    Editable = true;
                    trigger OnValidate()
                    var
                        usersetup: Record "User Setup";
                    begin
                        if usersetup.get(UserId) then begin
                            if usersetup."Approve Finance" = false then
                                Error('Your user is not setup for finance approval. Please contact the system administrator.');
                            CurrPage.Banks.Page.Update(false);
                        end;

                    end;



                }
                field("approved date"; Rec."approved date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the approved date field.';
                    Editable = false;
                }
                field("approved user"; Rec."approved user")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the approved user field.';
                    Editable = false;
                }
                field(ApproverID; ApproverID)
                {
                    ApplicationArea = All;
                    Caption = 'Approver ID';
                    Editable = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = All;
                    Caption = 'Status';
                    Editable = false;
                }
                field(LastDateTimeModified; LastDateTimeModified)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Last Date-Time Modified';
                }
            }


        }

        area(factboxes)
        {
            part("Banks"; "PaymentJournal Bank List Part2")
            {
                ApplicationArea = Basic, Suite;

            }
        }
    }


    var
        PostApprovalEntries: Record "Posted Approval Entry";
        ApproverID: Code[50];
        Status: enum "Approval Status";
        LastDateTimeModified: DateTime;

    local procedure GetOriginalDueDate(VLE: Record "Vendor Ledger Entry"): Date
    var
        PurchInvHeaderRec: Record "Purch. Inv. Header";
    begin
        if VLE."Document Type" = VLE."Document Type"::Invoice then
            if PurchInvHeaderRec.Get(VLE."Document No.") then
                exit(PurchInvHeaderRec."Due Date");
    end;

    local procedure GetVendorNAme(VLE: Record "Vendor Ledger Entry"): Text
    var
        PurchInvHeaderRec: Record "Purch. Inv. Header";
    begin
        if VLE."Document Type" = VLE."Document Type"::Invoice then
            if PurchInvHeaderRec.Get(VLE."Document No.") then
                exit(PurchInvHeaderRec."Buy-from Vendor Name");
    end;

    trigger OnAfterGetRecord()
    begin
        ApproverID := '';
        Status := 5;
        LastDateTimeModified := 0DT;
        PostApprovalEntries.SetRange("Document No.", Rec."Document No.");
        if PostApprovalEntries.FindLast() then begin
            ApproverID := PostApprovalEntries."Approver ID";
            Status := PostApprovalEntries.Status;
            LastDateTimeModified := PostApprovalEntries."Last Date-Time Modified";
        end;
    end;
}
