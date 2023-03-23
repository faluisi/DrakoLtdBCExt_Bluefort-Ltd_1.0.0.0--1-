pageextension 50024 SalesInvoiceExt extends "Sales Invoice"
{
    layout
    {
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
            field("Contract Code"; "Contract Code")
            {
                ApplicationArea = All;
            }
            //DevOps #619 -- end
            //DEVOPS #622 -- begin
            field("Period Start"; "Period Start")
            {
                ApplicationArea = all;
            }
            field("Period End"; "Period End")
            {
                ApplicationArea = all;
            }

            field("Customer Payment Bank Code"; "Customer Payment Bank Code")
            {
                ApplicationArea = all;
            }
            //DEVOPS #622 -- end

            field("Billing Statement"; "Billing Statement")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
    }
    var
}
