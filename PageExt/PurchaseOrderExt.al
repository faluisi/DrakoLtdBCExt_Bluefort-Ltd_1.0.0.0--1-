pageextension 50060 "Purchase Order Ext" extends "Purchase Order"
{
    layout
    {
        addfirst(Control99)
        {
            field(Consignee; rec.consignee)
            {
                ApplicationArea = all;
            }
            group(Control198)
            {
                ShowCaption = false;
                Visible = ShipToOptions2 = ShipToOptions2::Site;
                field(Site; rec.Site)
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                    ToolTip = 'Specifies a code for the Site where you want the items to be placed when they are received.';
                    trigger
                    OnValidate()
                    var
                        cs: record "Customer-Site";
                    begin
                        cs.SetRange("Site Code", rec.Site);
                        if cs.FindFirst() then begin
                            rec."Ship-to Address" := cs.Address;
                            rec."Ship-to Address 2" := cs."Address 2";
                            rec."Ship-to Name" := cs."Site Name";
                            rec."Ship-to City" := cs.City;
                        end;
                    end;
                }
                field("Site Name"; rec."Ship-to Name")
                {
                    ApplicationArea = all;
                    Importance = Promoted;

                }
                field("Site Address"; rec."Ship-to Address")
                {
                    ApplicationArea = all;
                    Importance = Promoted;

                }
                field("Site Address 2"; rec."Ship-to Address 2")
                {
                    ApplicationArea = all;
                    Importance = Promoted;

                }
                field("Site City"; rec."Ship-to City")
                {
                    ApplicationArea = all;
                    Importance = Promoted;

                }
            }
        }
        addfirst("Shipping and Payment")
        {
            field(ShippingOption; ShipToOptions2)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Ship-to';

                OptionCaption = 'Default (Company Address),Location,Customer Address,Custom Address,Site';
                ToolTip = 'Specifies the address that the products on the purchase document are shipped to. Default (Company Address): The same as the company address specified in the Company Information window. Location: One of the company''s location addresses. Customer Address: Used in connection with drop shipment. Custom Address: Any ship-to address that you specify in the fields below.';

                trigger OnValidate()
                begin
                    ValidateShippingOption2;
                end;
            }

        }

        modify(ShippingOptionWithLocation)
        {
            Visible = false;
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
        ShipToOptions2: Option "Default (Company Address)",Location,"Customer Address","Custom Address",Site;

    local procedure ValidateShippingOption2()
    begin
        case ShipToOptions of
            ShipToOptions::"Default (Company Address)",
            ShipToOptions::"Custom Address":
                begin
                    Validate("Sell-to Customer No.", '');
                    Validate("Location Code", '');
                end;
            ShipToOptions::Location:
                begin
                    Validate("Sell-to Customer No.", '');
                    Validate("Location Code");
                end;
            ShipToOptions::"Customer Address":
                begin
                    Validate("Sell-to Customer No.");
                    Validate("Location Code", '');
                end;
        end;
    end;
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
            field("Receiving No."; rec."Receiving No.")
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