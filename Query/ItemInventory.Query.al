query 50007 "Item Inventory by Location"
{

    elements
    {
        dataitem(Item; Item)
        {
            column(No; "No.")
            {
            }
            column(Vendor_No; "Vendor No.")
            {
            }
            dataitem(QueryElement4; "Item Ledger Entry")
            {
                DataItemLink = "Item No." = Item."No.";
                column(Location_Code; "Location Code")
                {
                }
                column(Inventory; Quantity)
                {
                    Method = Sum;
                }
            }
        }
    }
}

