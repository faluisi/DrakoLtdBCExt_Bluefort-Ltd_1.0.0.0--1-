page 50053 Factbox_SIH
{
    Caption = 'Media';
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Sales Invoice Header";
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