page 50031 editpostingdate
{
    Caption = 'Edit Posting Date';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Purchase Header";

    layout
    {
        area(Content)
        {
            group(Edit)
            {
                field("Posting Date"; rec."Posting Date")
                {
                    ApplicationArea = All;
                }

            }
        }
    }


}