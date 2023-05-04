page 50033 FBM_SiteAdjustCode
{
    Caption = 'Site Adjust - code';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Cust-Op-Site";


    layout
    {
        area(Content)
        {
            group(header)
            {
                field(maxcode; maxcode)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            repeater(Group)
            {
                field(MyField; rec."Site Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Site Code 2"; rec."Site Code 2")
                {
                    ApplicationArea = All;
                    trigger
                    OnValidate()
                    begin
                        getmaxsite();

                    end;

                    trigger
                    OnLookup(var Text: Text): Boolean
                    var
                        tsite: record "Customer-Site" temporary;
                        tcos: Record "Cust-Op-Site" temporary;
                    begin
                        companies.FindFirst();
                        repeat
                            site.Reset();
                            site.ChangeCompany(companies.Name);
                            site.SetRange("Site Name", rec."Site Name");
                            if site.FindFirst() then begin
                                tsite.TransferFields(site, true);
                                tsite.Insert();
                            end;
                            cos.Reset();
                            cos.ChangeCompany(companies.Name);
                            cos.setrange("Customer No.", site."Customer No.");
                            cos.SetRange("Site Code", site."Site Code");
                            cos.SetFilter("Site Code 2", '<>%1', '');
                            if cos.FindFirst() then begin
                                tcos.TransferFields(cos, true);
                                tcos.Insert();
                            end;
                        until companies.Next() = 0;
                        IF PAGE.RUNMODAL(50034, tsite) = ACTION::LookupOK THEN BEGIN
                            tcos.Reset();
                            tcos.SetRange("Customer No.", tsite."Customer No.");
                            tcos.SetRange("Site Code", tsite."Site Code");
                            tcos.SetFilter("Site Code 2", '<>%1', '');
                            if tcos.FindFirst() then
                                Text := tcos."Site Code 2";
                            EXIT(TRUE);
                        end;
                        clear(tsite);
                        Clear(tcos);
                    end;

                }
                field("Site Name"; rec."Site Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Site Address"; rec."Site Address")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }

    }


    trigger
    OnOpenPage()
    begin
        rec.SetRange("Site Code 2", '');
        getmaxsite();
    end;

    trigger
    OnAfterGetRecord()
    var

    begin

        rec.CalcFields("Site Name");
        rec.CalcFields("Site Address");

    end;

    var
        sitename: Text;
        siteaddress: Text;
        maxcode: Text;
        cos: record "Cust-Op-Site";
        site: record "Customer-Site";
        companies: record Company;
        compinfo: record "Company Information";

    procedure getmaxsite()


    begin
        companies.FindFirst();
        repeat
            compinfo.ChangeCompany(companies.Name);
            cos.ChangeCompany(companies.Name);
            compinfo.get;
            if compinfo.FBM_EnableSiteWS then begin
                cos.SetCurrentKey("Site Code 2");
                if cos.FindLast() then
                    if maxcode < cos."Site Code 2" then
                        maxcode := cos."Site Code 2";



            end;

        until companies.Next() = 0;
        CurrPage.Update();


    end;
}