page 50054 Factbox_SCH
{
    Caption = 'Media';
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Sales Cr.Memo Header";
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;

    layout
    {
        area(Content)
        {
            group(Signature)
            {
                field(signature_pic; rec.signature_pic)
                {
                    ApplicationArea = All;
                }

            }
        }
    }


}