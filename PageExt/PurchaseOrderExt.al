pageextension 50060 "Purchase Order Ext" extends "Purchase Order"
{

    actions
    {
        addfirst(processing)
        {
            action("Approval Request Entries")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Approval Request Entries';
                Image = Document;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Open Approval Request Entries page';
                RunObject = Page "Approval Request Entries New";
                RunPageLink = "Document No." = field("No.");
            }
            // action("Check Approvals")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Check Approvals';
            //     Image = Check;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     PromotedIsBig = true;
            //     ToolTip = 'Check Approval Entries';
            //     trigger
            //     OnAction()
            //     var
            //         apprentry: record "Approval Entry";
            //     begin
            //         apprentry.SetRange("Document No.", rec."No.");
            //         apprentry.SetRange("Document Type", rec."Document Type");
            //         if apprentry.Count > 0 then begin
            //             apprentry.Setfilter(Status, '<>%1', apprentry.Status::Approved);
            //             if apprentry.Count = 0 then begin
            //                 pl.SETRANGE("Document Type", rec."Document Type");
            //                 pl.SETRANGE("Document No.", rec."No.");
            //                 IF pl.FINDFIRST THEN
            //                     DocumentTotals.CalculatePurchaseTotals(TotalPurchLine, VATAmount, pl);
            //                 PrepaymentAmount := TotalPurchLine."Line Amount" * rec."Prepayment %" / 100;

            //                 if (rec."Prepayment %" <> 0) and (PrepaymentAmount <> rec."Amount Including VAT" * rec."Prepayment %") then
            //                     rec.Status := rec.Status::"Pending Prepayment"
            //                 else
            //                     rec.Status := rec.Status::Released;
            //             end;
            //         end;
            //     end;
            // }
            action("Edit Posting Date")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Edit Posting Date';
                Image = Check;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger
                OnAction()
                var
                    statori: Enum "Purchase Document Status";
                    ph: record "Purchase Header";
                begin


                    statori := rec.Status;
                    rec.Status := rec.Status::Open;
                    rec.Modify();
                    commit;

                    page.RunModal(Page::editpostingdate, rec);

                    Commit();

                    ph.get(rec."Document Type", rec."No.");
                    ph.Status := statori;
                    ph.Modify();

                end;
            }
            action("EditPrepayment")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Edit Prepayment';
                Image = Check;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger
                OnAction()
                var
                    statori: Enum "Purchase Document Status";
                    ph: record "Purchase Header";
                begin


                    statori := rec.Status;
                    rec.Status := rec.Status::Open;
                    rec.Modify();
                    commit;

                    page.RunModal(Page::editprepmt, rec);

                    Commit();

                    ph.get(rec."Document Type", rec."No.");
                    ph.Status := statori;
                    ph.Modify();

                end;
            }
        }
    }
    var
        PrepaymentAmount: Decimal;
        DocumentTotals: Codeunit "Document Totals";
        TotalPurchLine: record "Purchase Line";
        pl: record "Purchase Line";
        VATAmount: Decimal;

}

pageextension 50070 "Purchase Inv Ext" extends "Purchase Invoice"
{
    layout
    {
        addlast(General)
        {
            field("Posting No."; rec."Posting No.")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        addfirst(processing)
        {
            action("Approval Request Entries")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Approval Request Entries';
                Image = Document;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Open Approval Request Entries page';
                RunObject = Page "Approval Request Entries New";
                RunPageLink = "Document No." = field("No.");
            }
        }
    }
}