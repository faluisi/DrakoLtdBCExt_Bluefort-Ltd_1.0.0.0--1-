pageextension 50024 SalesInvoiceExt extends "Sales Invoice"
{
    layout
    {
        modify("Sell-to Customer No.")
        {
            trigger
            OnAfterValidate()
            var
                mediaid: Guid;
                index: integer;
            begin
                FOR Index := 1 to usersetup."Signature PHL".COUNT DO BEGIN
                    if usersetup.get(UserId) then begin
                        mediaid := usersetup."Signature PHL".Item(1);
                        rec.signature_pic.Insert(mediaid);
                        rec.Modify();

                    end;
                end;
            end;
        }
        addafter("External Document No.")
        {
            field("Posting No."; rec."Posting No.")
            {
                ApplicationArea = All;
            }
            field(Site; rec.Site)
            {
                ApplicationArea = All;

                trigger OnLookup(var Text: Text): Boolean
                var
                    CustSite: Record "Customer-Site";
                    CustSiteFull: Record "Customer-Site";
                    FASetup: Record "FA Setup";
                    companyinfo: record "Company Information";
                    CustmoerSiteP: Page "Customer - Site";
                begin
                    CustSite.Reset();
                    FASetup.Get();
                    CustSiteFull.Reset();
                    companyinfo.Reset();
                    companyinfo.Get();
                    if companyinfo."Customer Is Operator" then begin
                        CustSite.SetFilter(CustSite."Customer No.", "Sell-to Customer No.");
                        if CustSite.FindFirst() then begin
                            if page.RunModal(50001, CustSite) = Action::LookupOK then Rec.Validate(Site, CustSite."Site Code");
                            /*CustmoerSiteP.Editable := false;
                                            if CustmoerSiteP.RunModal = Action::LookupOK then
                                                Rec.Validate(Site, CustSite."Site Code");*/
                        end
                    end
                    else begin
                        CustSite.SetFilter(CustSite."Customer No.", "Sell-to Customer No.");
                        if CustSite.FindFirst() then begin
                            if page.RunModal(50001, CustSite) = Action::LookupOK then Rec.Validate(Site, CustSite."Site Code");
                        end
                        else begin
                            if page.RunModal(50001, CustSiteFull) = Action::LookupOK then Rec.Validate(Site, CustSiteFull."Site Code");
                        end;
                    end;
                    CurrPage.Update(true);
                end;

                trigger OnValidate()
                begin
                    CurrPage.Update(true);
                end;
            }
            //DevOps #619 -- begin
            field("Contract Code"; rec."Contract Code")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field(Segment; rec.Segment)
            {
                ApplicationArea = All;
            }
            //DevOps #619 -- end
            //DEVOPS #622 -- begin
            field("Period Start"; rec."Period Start")
            {
                ApplicationArea = all;
            }
            field("Period End"; rec."Period End")
            {
                ApplicationArea = all;
            }
            field(signature_pic; rec.signature_pic)
            {
                ApplicationArea = all;
            }

            //DEVOPS #622 -- end

            field("Billing Statement"; rec."Billing Statement")
            {
                ApplicationArea = all;
            }

        }
        addlast(General)
        {
            field(LocalCurrAmt; rec.LocalCurrAmt)
            {
                ApplicationArea = all;

            }
            field(Currency2; rec.Currency2)
            {
                ApplicationArea = all;

            }

        }
        addafter("Currency Code")
        {
            field("Customer Payment Bank Code"; rec."Customer Payment Bank Code")
            {
                ApplicationArea = all;
                Editable = false;
            }

            field("Customer Payment Bank Code2"; rec."Customer Payment Bank Code2")
            {
                ApplicationArea = all;
                Editable = false;
            }

        }
        modify("Company Bank Account Code")
        {

            Visible = false;
        }
        addlast(factboxes)
        {

            part(signature; Factbox_SI)
            {

                SubPageLink = "No." = field("No.");
            }
        }

    }


    actions
    {
    }
    var
        usersetup: record "User Setup";
}
