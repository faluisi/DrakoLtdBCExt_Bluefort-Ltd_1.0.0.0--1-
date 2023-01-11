pageextension 50043 ApprovalRequestEntries extends "Approval Request Entries"
{
    layout
    {
        addafter("Currency Code")
        {
            field(PostingDescription; PostingDescription)
            {
                Caption = 'Posting Description';
            }
            field(BudgetAccount; BudgetAccount)
            {
                Caption = 'Budget Account';
            }
            field(BudgetProject; BudgetProject)
            {
                Caption = 'BudgetProject';
            }
            field(BudgetGroupDimensions; BudgetGroupDimensions)
            {
                Caption = 'Budget Group Dimensions';
            }
        }
    }
    var
        PostingDescription: Text[100];
        BudgetAccount: Code[20];
        BudgetProject: Code[20];
        BudgetGroupDimensions: Code[20];
        getshortdimensions: Codeunit "Get Shortcut Dimension Values";
        ShortcutDimCodeList: array[8] of Code[20];



    trigger OnAfterGetRecord()
    var
        PurchHeader: Record "Purchase Header";
        PurchLine: Record "Purchase Line";
    begin
        PurchHeader.SetRange("No.", Rec."Document No.");
        PurchHeader.SetRange("Document Type", PurchHeader."Document Type"::Order);
        if PurchHeader.FindFirst() then begin
            PostingDescription := PurchHeader."Posting Description";
            PurchLine.SetRange("Document No.", Rec."Document No.");
            PurchLine.SetRange("Document Type", PurchLine."Document Type"::Order);
            if PurchLine.FindFirst() then begin
                BudgetAccount := PurchLine."Shortcut Dimension 1 Code";
                BudgetGroupDimensions := PurchLine."Shortcut Dimension 2 Code";
                getshortdimensions.GetShortcutDimensions(PurchLine."Dimension Set ID", ShortcutDimCodeList);
                BudgetProject := ShortcutDimCodeList[7];
            end;
        end;
    end;
}


pageextension 50071 RequestToApproveExt extends "Requests to approve"
{
    layout
    {
        addafter("Currency Code")
        {
            field(PostingDescription; PostingDescription)
            {
                Caption = 'Posting Description';
            }
            field(BudgetAccount; BudgetAccount)
            {
                Caption = 'Budget Account';
            }
            field(BudgetProject; BudgetProject)
            {
                Caption = 'BudgetProject';
            }
            field(BudgetGroupDimensions; BudgetGroupDimensions)
            {
                Caption = 'Budget Group Dimensions';
            }
        }
    }
    var
        PostingDescription: Text[100];
        BudgetAccount: Code[20];
        BudgetProject: Code[20];
        BudgetGroupDimensions: Code[20];
        getshortdimensions: Codeunit "Get Shortcut Dimension Values";
        ShortcutDimCodeList: array[8] of Code[20];



    trigger OnAfterGetRecord()
    var
        PurchHeader: Record "Purchase Header";
        PurchLine: Record "Purchase Line";
    begin
        PurchHeader.SetRange("No.", Rec."Document No.");
        PurchHeader.SetRange("Document Type", PurchHeader."Document Type"::Order);
        if PurchHeader.FindFirst() then begin
            PostingDescription := PurchHeader."Posting Description";
            PurchLine.SetRange("Document No.", Rec."Document No.");
            PurchLine.SetRange("Document Type", PurchLine."Document Type"::Order);
            if PurchLine.FindFirst() then begin
                BudgetAccount := PurchLine."Shortcut Dimension 1 Code";
                BudgetGroupDimensions := PurchLine."Shortcut Dimension 2 Code";
                getshortdimensions.GetShortcutDimensions(PurchLine."Dimension Set ID", ShortcutDimCodeList);
                BudgetProject := ShortcutDimCodeList[7];
            end;
        end;
    end;
}

