page 50034 FBM_SiteLookup
{
    Caption = 'Site Lookup';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Customer-Site";


    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Site Code"; "Site Code")
                {
                    ApplicationArea = All;
                }
                field(code2; code2)
                {
                    ApplicationArea = All;
                }

            }
        }

    }
    trigger
    OnAfterGetRecord()
    var
        cos: record "Cust-Op-Site";
    begin
        cos.SetRange("Customer No.", rec."Customer No.");
        cos.SetRange("Site Code", rec."Site Code");
        if cos.FindFirst() then begin
            code2 := cos."Site Code 2";


        end;

    end;

    var
        code2: Text;

}