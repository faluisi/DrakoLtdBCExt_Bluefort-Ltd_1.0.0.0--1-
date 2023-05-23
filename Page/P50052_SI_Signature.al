page 50052 Factbox_SI
{
    Caption = 'Media';
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Sales Header";
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