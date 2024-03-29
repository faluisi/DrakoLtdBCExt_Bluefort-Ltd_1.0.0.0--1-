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
                field(Country; rec.Country)
                {
                    ApplicationArea = All;
                    Caption = 'Country';
                }
                field(DocType; rec.DocType)
                {
                    ApplicationArea = All;
                    Caption = 'Doc. Type';
                }

                field("Line No."; rec."Line No.")
                {
                    ApplicationArea = All;
                    Caption = 'Line No.';
                }
                field("Terms Conditions"; rec."Terms Conditions")
                {
                    ApplicationArea = All;
                    Caption = 'Terms & conditions';
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
