



pageextension 50147 CustomerListExt2 extends "Customer List"
{
    layout
    {
        addafter("Phone No.")
        {
            field("Payment Bank Code"; "Payment Bank Code")
            {
            }
        }
        addafter("Name")
        {
            field("No. 2"; "No. 2")
            { }
            field("VAT Registration No."; "VAT Registration No.")
            { }
            field("Group Customer"; "Group")
            {
            }
            field("SubGroup Customer"; "SubGroup")
            {
            }
        }

    }
    actions
    {
        addlast(reporting)
        {
            group("Aged Account Monthly")
            {

                Caption = 'Aged Account Monthly';
                Image = "Report";
                action(AgedAccountMonthly)
                {
                    ApplicationArea = Advanced;
                    Caption = 'Aged Account Monthly';
                    Image = CustomerLedger;
                    RunObject = Page "Aged Accounts by Months";


                }
            }
        }
    }
    var
        myInt: Integer;
}


page 50012 "Groups"
{
    Caption = 'Groups';
    PageType = List;
    //ApplicationArea = All;
    //UsageCategor y = Lists;
    SourceTable = "Groups Cust";
    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Group Customer"; "Group")
                {
                    Caption = 'Group Customer';
                    ApplicationArea = All;
                }

                field("Group Name"; "Group Name")
                {
                    ApplicationArea = All;
                }


            }
        }
    }
}

page 50013 "SubGroups"
{
    Caption = 'SubGroups';
    PageType = List;
    //ApplicationArea = All;
    //UsageCategor y = Lists;
    SourceTable = "SubGroups";
    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Group Customer"; "Group")
                {
                    Caption = 'Group Customer';
                    ApplicationArea = All;
                }

                field("Group Name"; "Group Name")
                {
                    ApplicationArea = All;
                }
                field("SubGroup Customer"; "SubGroup")
                {
                    Caption = 'SubGroup Customer';
                    ApplicationArea = All;
                }
                field("SubGroup Name"; "SubGroup Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}