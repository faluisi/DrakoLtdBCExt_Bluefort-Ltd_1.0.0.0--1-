pageextension 50061 PurchaseOrderListExt extends "Purchase Order List"
{
    layout
    {
    }
    actions
    {
        addlast(navigation)
        {

            action("Search Serial No.")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Search Serial No.';
                Image = "BarCode";
                RunObject = Page "Search Serial No.";
            }

            action("Vendor Order Detailes")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vendor  Order Detailes';
                Image = "Report";
                RunObject = Report "Vendor Order Detailes";
            }


        }
    }
    var
}