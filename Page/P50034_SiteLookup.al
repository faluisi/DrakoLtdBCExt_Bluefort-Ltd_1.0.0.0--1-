page 50034 FBM_SiteLookup
{
    Caption = 'Site Lookup';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Cust-Op-Site";


    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Site Code 2"; rec."Site Code 2")
                {
                    ApplicationArea = All;
                }
                field(sitename; sitename)
                {
                    ApplicationArea = All;
                }
                field(siteaddress; siteaddress)
                {
                    ApplicationArea = All;
                }
            }
        }

    }
    trigger
    OnAfterGetRecord()
    var
        site: record "Customer-Site";
    begin
        if site.get(Rec."Customer No.", rec."Site Code") then begin
            sitename := site."Site Name";
            siteaddress := site.Address;

        end;

    end;

    var
        sitename: Text;
        siteaddress: Text;
}