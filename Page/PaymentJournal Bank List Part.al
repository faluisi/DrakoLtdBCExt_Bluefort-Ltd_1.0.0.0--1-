page 50066 "PaymentJournal Bank List Part"
{
    Caption = 'Banks List';
    Editable = false;
    PageType = ListPart;
    SourceTable = "Bank Account";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; "No.")
                {
                    ApplicationArea = Basic, Suite;


                }

                field("Balance"; "Balance")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDown = true;

                }
                field("Approval Batch Amount"; "Approval Batch Amount")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDown = true;
                    Visible = false;

                }

                field("Projected Balance"; "Balance" + "Approval Batch Amount")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDown = true;

                }
            }
        }
    }

    actions
    {
    }
}

page 50070 "PaymentJournal Bank List Part2"
{
    Caption = 'Banks List';
    Editable = false;
    PageType = ListPart;
    SourceTable = "Bank Account";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; "No.")
                {
                    ApplicationArea = Basic, Suite;


                }

                field("Balance"; "Balance")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDown = true;

                }
                field("Approval Batch Amount2"; "Approval Batch Amount2")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDown = true;
                    Visible = false;

                }

                field("Projected Balance"; "Balance" + "Approval Batch Amount2")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDown = true;

                }
            }
        }
    }

    actions
    {
    }
}