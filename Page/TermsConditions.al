page 50000 TermsConditions
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = TermsConditions;
    Caption = 'Terms & Conditions';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Country; Country)
                {
                    ApplicationArea = All;
                    Caption = 'Country';
                }
                field("Line No."; "Line No.")
                {
                    ApplicationArea = All;
                    Caption = 'Line No.';
                }
                field("Terms Conditions"; "Terms Conditions")
                {
                    ApplicationArea = All;
                    Caption = 'Terms & consditions';
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
}
