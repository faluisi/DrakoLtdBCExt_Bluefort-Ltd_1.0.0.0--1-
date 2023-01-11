pageextension 50060 "Purchase Order Ext" extends "Purchase Order"
{

    actions
    {
        addfirst(processing)
        {
            action("Approval Request Entries")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Approval Request Entries';
                Image = Document;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Open Approval Request Entries page';
                RunObject = Page "Approval Request Entries New";
                RunPageLink = "Document No." = field("No.");
            }
        }
    }
}

pageextension 50070 "Purchase Inv Ext" extends "Purchase Invoice"
{

    actions
    {
        addfirst(processing)
        {
            action("Approval Request Entries")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Approval Request Entries';
                Image = Document;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Open Approval Request Entries page';
                RunObject = Page "Approval Request Entries New";
                RunPageLink = "Document No." = field("No.");
            }
        }
    }
}