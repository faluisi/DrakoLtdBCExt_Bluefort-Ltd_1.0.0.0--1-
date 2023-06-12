page 60123 "FBM_PayJnl Bank List Part_CO"
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
                field("Code"; rec."No.")
                {
                    ApplicationArea = Basic, Suite;


                }

                field("Balance"; rec."Balance")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDown = true;

                }
                field("Approval Batch Amount"; rec."Approval Batch Amount")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDown = true;
                    Visible = false;

                }

                field("Projected Balance"; rec."Balance" + rec."Approval Batch Amount")
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

