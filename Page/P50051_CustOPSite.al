page 50051 FBM_CustOpSite
{
    Caption = 'CustOpSite';
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
                field("Customer No."; rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field(CName; cust.Name)
                {
                    ApplicationArea = All;
                }
                field(CAddress; cust.Address)
                {
                    ApplicationArea = All;
                }
                field(CCity; cust.City)
                {
                    ApplicationArea = All;
                }
                field(CVAT; cust."VAT Registration No.")
                {
                    ApplicationArea = All;
                }
                field(CGrCode; cust."No. 2")
                {
                    ApplicationArea = All;
                }
                field(Operator; cos."Operator No.")
                {
                    ApplicationArea = All;
                }
                field("Site Code"; rec."Site Code")
                {
                    ApplicationArea = All;
                }
                field(SName; rec."Site Name")
                {
                    ApplicationArea = All;
                }
                field(SAddress; rec.Address)
                {
                    ApplicationArea = All;
                }
                field(SCity; rec.City)
                {
                    ApplicationArea = All;
                }
                field(SVAT; cos."Vat Number")
                {
                    ApplicationArea = All;
                }
                field(SGrCode; cos."Site Code 2")
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
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
    trigger
    OnAfterGetRecord()
    begin
        cust.get(rec."Customer No.");
        cos.setrange("Customer No.", rec."Customer No.");
        cos.SetRange("Site Code", rec."Site Code");
        if cos.FindFirst() then begin end;


    end;

    var

        cust: record Customer;
        cos: record "Cust-Op-Site";
}