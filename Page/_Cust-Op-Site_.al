page 50007 "Cust-Op-Site"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Cust-Op-Site";

    layout
    {
        area(Content)
        {
            repeater("Cust-Op-Site")
            {
                field("Customer No."; "Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; "Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Operator No."; "Operator No.")
                {
                    ApplicationArea = All;
                }
                field("Operator Name"; "Operator Name")
                {
                    ApplicationArea = All;
                }
                field("Site Code"; "Site Code")
                {
                    ApplicationArea = All;
                }
                field("Site Name"; "Site Name")
                {
                    ApplicationArea = All;
                }
                field("Site Code 2"; "Site Code 2")
                {
                    ApplicationArea = All;
                }
                field("Vat Number"; "Vat Number")
                {
                    ApplicationArea = All;
                }
                field("Site Address"; "Site Address")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {
        }
    }
    actions
    {
    }
    var
        "Customer Name": Text[250];
        "Operator Name": Text[250];
        "Site Name": Text[250];
        Cust: Record Customer;
        Operator: Record "Dimension Value";
        Site: Record "Customer-Site";
        FASetup: Record "FA Setup";

    trigger OnAfterGetRecord()
    begin
        Cust.Reset();
        Operator.Reset();
        Site.Reset();
        FASetup.Get();
        if cust.Get(Rec."Customer No.") then
            "Customer Name" := Cust.Name
        else
            "Customer Name" := '';
        if Operator.Get(FASetup."Operator Dimension", Rec."Operator No.") then
            "Operator Name" := Operator.Name
        else
            "Operator Name" := '';
        if Site.Get(rec."Customer No.", Rec."Site Code") then
            "Site Name" := Site."Site Name"
        else
            "Site Name" := '';
    end;
}
