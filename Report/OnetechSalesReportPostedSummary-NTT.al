

report 50010 OTSalesSummaryNTTPosted

{
    DefaultLayout = RDLC;
    UsageCategory = Administration;
    RDLCLayout = './OTSalesSummaryNTTPosted.rdl';
    ApplicationArea = All;
    Caption = 'Summary of Invoices Posted NTT';

    dataset
    {

        dataitem(salesinvoiceline; "Sales Invoice Line")
        {
            RequestFilterFields = "Posting Date", "Sell-to customer no.";

            column(invpostingdate; format(invheader."Posting Date"))
            {

            }
            column(filters; filters)
            {

            }
            // column(doctype; invheader."Document Type")
            // {

            //  }

            column(invTotalAmount; invheader."Amount")
            {

            }
            column(customerno; invheader."Sell-to Customer No.")
            {

            }

            column(compname; compinfo.Name)
            {

            }
            column(invdocumentno; "Document No.")
            {

            }
            column(invNo; "No.")
            {

            }
            column(invDescr; "Description")
            {

            }
            column(invGenBUsPost; "Gen. Bus. Posting Group")
            {

            }
            column(invenProd; "Gen. Prod. Posting Group")
            {

            }
            column(invamount; "Amount")
            {

            }
            column(invperiodstart; format("Period Start"))
            {

            }
            column(invperiodend; format("Period End"))
            {

            }
            column(invglaccountname; invglaccountname)
            {

            }

            column(invContract; invContract)
            {

            }
            column(invsite; invsite)
            {

            }
            column(invsitename; invsitename)
            {

            }

            trigger OnPreDataItem()
            begin
                //  SetFilter("Document Type", 'Invoice|Credit Memo');
                filters := salesinvoiceline.GetFilters();
                if (filters <> '') then begin

                end;
                compinfo.get();
            end;

            trigger OnAfterGetRecord()


            var
                myInt: Integer;

            begin
                invsite := '';
                invsitename := '';
                invContract := '';
                invglaccountname := '';
                invheader.SetRange("No.", salesinvoiceline."Document No.");
                if invheader.FindFirst() then begin
                    invsite := invheader.Site;
                    siterec.SetRange("Site Code", invsite);
                    siterec.SetRange("Customer No.", invheader."Sell-to Customer No.");
                    if siterec.FindFirst() then
                        invsitename := siterec."Site Name";

                    invContract := invheader."Contract Code";
                end;
                if glaccount.Get("No.") then begin
                    invglaccountname := glaccount.Name;
                end;

            end;

        }
        dataitem(salescrmemoline; "Sales Cr.Memo Line")
        {
            DataItemTableView = SORTING("Document No.", "Line No.");
            column(crmemopostingdate; format("Posting Date"))
            {

            }
            //column(invdocumenttype; "Document Type")
            // {

            //  }
            column(crmemodocumentno; "Document No.")
            {

            }

            column(crmemocustomerno; "Sell-to Customer No.")
            {

            }
            column(crmemoNo; "No.")
            {

            }
            column(crmemoDescr; "Description")
            {

            }
            column(crmemoGenBUsPost; "Gen. Bus. Posting Group")
            {

            }
            column(crmemoenProd; "Gen. Prod. Posting Group")
            {

            }
            column(crmemoamount; "Amount")
            {

            }
            column(crmemoperiodstart; format("Period Start"))
            {

            }
            column(crmemoperiodend; format("Period End"))
            {

            }
            column(crmemoglaccountname; invglaccountname)
            {

            }

            column(crmemoContract; crmemoContract)
            {

            }
            column(crmemosite; crmemosite)
            {


            }

            column(crmemositename; crmemositename)
            {


            }

            trigger OnPreDataItem()
            begin
                if (filters <> '')
                 then begin
                    salescrmemoline.SetFilter("Posting Date", salesinvoiceline.GetFilter("Posting Date"));
                    salescrmemoline.SetFilter("Sell-to Customer No.", salesinvoiceline.GetFilter("Sell-to Customer No."));
                end;

            end;

            trigger OnAfterGetRecord()


            var
                myInt: Integer;

            begin
                crmemosite := '';
                crmemoContract := '';
                crmemoglaccountname := '';
                crmemositename := '';
                crmemoheader.SetRange("No.", salesinvoiceline."Document No.");
                if crmemoheader.FindFirst() then begin
                    crmemosite := invheader.Site;
                    siterec.SetRange("Site Code", crmemosite);
                    siterec.SetRange("Customer No.", invheader."Sell-to Customer No.");
                    if siterec.FindFirst() then
                        crmemositename := siterec."Site Name";
                    invContract := crmemoheader."Contract Code";
                end;
                if glaccount.Get("No.") then begin
                    invglaccountname := glaccount.Name;
                end;

            end;

        }


    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    //field(Name; SourceExpression)
                    // {
                    //    ApplicationArea = All;

                    // }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    var
        invheader: Record "Sales Invoice Header";
        crmemoheader: Record "Sales Cr.Memo Header";
        invsite: Code[50];
        invsitename: Text;

        siterec: Record "Customer-Site";
        invContract: Code[50];
        glaccount: Record "G/L Account";
        invglaccountname: Text;
        filters: Text;

        compinfo: Record "Company Information";

        crmemosite: Code[50];
        crmemositename: Text;
        crmemoContract: Code[50];
        crmemoglaccountname: Text;
}