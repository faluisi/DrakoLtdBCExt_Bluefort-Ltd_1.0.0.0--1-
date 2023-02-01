page 50031 editpostingdate
{
    Caption = 'Edit Posting Date';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Purchase Header";
    DeleteAllowed = false;
    InsertAllowed = false;

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


    trigger
    OnOpenPage()
    begin
        rec.SetRange("Document Type", rec."Document Type");
        rec.SetRange("No.", rec."No.");
    end;

}