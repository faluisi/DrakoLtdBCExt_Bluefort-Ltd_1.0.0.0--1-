pageextension 50060 "Purchase Order Ext" extends "Purchase Order"
{
    layout
    {
        modify("Buy-from Vendor No.")
        {
            trigger
                    OnAfterValidate()

            begin
                compinfo.get();
                begin
                    rec."Consignee Address" := compinfo.Address;
                    rec."Consignee Address 2" := compinfo."Address 2";
                    rec."Consignee Name" := compinfo.Name;
                    rec."Consignee City" := compinfo.City;
                    rec."Consignee Contact" := compinfo."Name 2";
                    rec."Consignee Post Code" := compinfo."Post Code";
                    rec."Consignee Country" := compinfo."Country/Region Code";
                    rec."Consignee County" := compinfo.County;
                    rec."Ship-to Address" := compinfo.Address;
                    rec."Ship-to Address 2" := compinfo."Address 2";
                    rec."Ship-to Name" := compinfo."Name";
                    rec."Ship-to City" := compinfo.City;
                    rec."Ship-to Contact" := compinfo."Name 2";
                    rec."Ship-to Post Code" := compinfo."Post Code";
                    rec."Ship-to Country/Region Code" := compinfo."Country/Region Code";
                    rec."Ship-to County" := compinfo.County;
                end;


            end;
        }
        addafter(ShippingOptionWithLocation)
        {
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
                        compinfo.get();
                        cs.SetRange("Site Code", rec.Site);
                        if cs.FindFirst() then begin
                            rec."Ship-to Address" := cs.Address;
                            rec."Ship-to Address 2" := cs."Address 2";
                            rec."Ship-to Name" := cs."Site Name";
                            rec."Ship-to City" := cs.City;
                            rec."Ship-to Contact" := cs.Contact;
                            rec."Ship-to Post Code" := cs."Post Code";
                            rec."Ship-to Country/Region Code" := cs."Country/Region Code";
                            rec."Ship-to County" := cs.County;
                            rec."Ship-to Contact" := cs.Contact;
                            rec.Modify();
                        end
                        else begin
                            rec."Ship-to Address" := compinfo.Address;
                            rec."Ship-to Address 2" := compinfo."Address 2";
                            rec."Ship-to Name" := compinfo."Name";
                            rec."Ship-to City" := compinfo.City;
                            rec."Ship-to Contact" := compinfo."Name 2";
                            rec."Ship-to Post Code" := compinfo."Post Code";
                            rec."Ship-to Country/Region Code" := compinfo."Country/Region Code";
                            rec."Ship-to County" := compinfo.County;
                            rec."Ship-to Contact" := compinfo."Name 2";
                            rec.Modify();
                        end;

                    end;
                }

                // field("Site Name"; rec."Ship-to Name")
                // {
                //     ApplicationArea = all;
                //     Importance = Promoted;

                // }
                // field("Site Address"; rec."Ship-to Address")
                // {
                //     ApplicationArea = all;
                //     Importance = Promoted;

                // }
                // field("Site Address 2"; rec."Ship-to Address 2")
                // {
                //     ApplicationArea = all;
                //     Importance = Promoted;

                // }
                // field("Site City"; rec."Ship-to City")
                // {
                //     ApplicationArea = all;
                //     Importance = Promoted;

                // }
                // field("Site Post Code"; rec."Ship-to Post Code")
                // {
                //     ApplicationArea = all;
                //     Importance = Promoted;

                // }
                // field("Site County"; rec."Ship-to County")
                // {
                //     ApplicationArea = all;
                //     Importance = Promoted;

                // }
                // field("Site Country"; rec."Ship-to Country/Region Code")
                // {
                //     ApplicationArea = all;
                //     Importance = Promoted;

                // }
                // field("Site Contact"; rec."Ship-to Contact")
                // {
                //     ApplicationArea = all;
                //     Importance = Promoted;

                // }
            }
        }
        modify("Ship-to Name")
        {
            Caption = 'Ship-to Name';

        }
        modify("Ship-to Address")
        {
            Caption = 'Ship-to Address';

        }
        modify("Ship-to Address 2")
        {
            Caption = 'Ship-to Address 2';

        }
        modify("Ship-to City")
        {
            Caption = 'Ship-to City';

        }
        modify("Ship-to Post Code")
        {
            Caption = 'Ship-to Post Code';

        }
        modify("Ship-to County")
        {
            Caption = 'Ship-to County';

        }
        modify("Ship-to Country/Region Code")
        {
            Caption = 'Ship-to Country';

        }
        modify("Ship-to Contact")
        {
            Caption = 'Ship-to Contact';

        }
        addlast(Control99)
        {
            field(Consignee; rec.consignee)
            {
                ApplicationArea = all;
                trigger
                    OnValidate()
                var
                    cust: record Customer;
                begin
                    compinfo.get();
                    if cust.get(rec.Consignee) then begin
                        rec."Consignee Address" := cust.Address;
                        rec."Consignee Address 2" := cust."Address 2";
                        rec."Consignee Name" := cust.Name;
                        rec."Consignee City" := cust.City;
                        rec."Consignee Contact" := cust."Name 2";
                        rec."Consignee Post Code" := cust."Post Code";
                        rec."Consignee Country" := cust."Country/Region Code";
                        rec."Consignee County" := cust.County;
                    end
                    else begin
                        rec."Consignee Address" := compinfo.Address;
                        rec."Consignee Address 2" := compinfo."Address 2";
                        rec."Consignee Name" := compinfo.Name;
                        rec."Consignee City" := compinfo.City;
                        rec."Consignee Contact" := compinfo."Name 2";
                        rec."Consignee Post Code" := compinfo."Post Code";
                        rec."Consignee Country" := compinfo."Country/Region Code";
                        rec."Consignee County" := compinfo.County;
                    end;


                end;
            }
            field("consignee Name"; rec."consignee Name")
            {
                ApplicationArea = all;
                Importance = Promoted;

            }
            field("consignee Address"; rec."consignee Address")
            {
                ApplicationArea = all;
                Importance = Promoted;

            }
            field("consignee Address 2"; rec."consignee Address 2")
            {
                ApplicationArea = all;
                Importance = Promoted;

            }
            field("consignee City"; rec."consignee City")
            {
                ApplicationArea = all;
                Importance = Promoted;

            }
            field("consignee Post Code"; rec."Consignee Post Code")
            {
                ApplicationArea = all;
                Importance = Promoted;

            }
            field("consignee Country"; rec."Consignee Country")
            {
                ApplicationArea = all;
                Importance = Promoted;

            }
            field("consignee County"; rec."Consignee County")
            {
                ApplicationArea = all;
                Importance = Promoted;

            }
            field("consignee Contact"; rec."consignee Contact")
            {
                ApplicationArea = all;
                Importance = Promoted;

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
    trigger
    OnOpenPage()
    begin
        compinfo.get;
        if rec."Consignee Name" = '' then begin
            rec."Consignee Address" := compinfo.Address;
            rec."Consignee Address 2" := compinfo."Address 2";
            rec."Consignee Name" := compinfo.Name;
            rec."Consignee City" := compinfo.City;
            rec."Consignee Contact" := compinfo."Name 2";
            rec."Consignee Post Code" := compinfo."Post Code";
            rec."Consignee Country" := compinfo."Country/Region Code";
            rec."Consignee County" := compinfo.County;
            //rec.Modify();
        end;
        if rec."Ship-to Name" = '' then begin
            rec."Ship-to Address" := compinfo.Address;
            rec."Ship-to Address 2" := compinfo."Address 2";
            rec."Ship-to Name" := compinfo."Name";
            rec."Ship-to City" := compinfo.City;
            rec."Ship-to Contact" := compinfo."Name 2";
            rec."Ship-to Post Code" := compinfo."Post Code";
            rec."Ship-to Country/Region Code" := compinfo."Country/Region Code";
            rec."Ship-to County" := compinfo.County;
            //rec.Modify();
        end;



    end;

    var
        PrepaymentAmount: Decimal;
        DocumentTotals: Codeunit "Document Totals";
        TotalPurchLine: record "Purchase Line";
        pl: record "Purchase Line";
        VATAmount: Decimal;
        ShipToOptions2: Option "Default (Company Address)",Location,"Customer Address","Custom Address",Site;
        compinfo: record "Company Information";

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