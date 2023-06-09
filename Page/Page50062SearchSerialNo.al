page 50062 "Search Serial No."
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Worksheet;
    SourceTable = "Reservation Entry";
    SourceTableView = WHERE("Source Type" = CONST(39), "Serial No." = FILTER(<> ''));

    layout
    {
        area(content)
        {
            group(Search)
            {
                field("Serial Filter"; SerialFilter)
                {
                    Caption = 'Serial Filter';

                    trigger OnValidate();
                    begin
                        SETFILTER("Serial No.", SerialFilter);
                        SerialFilter := GETFILTER("Serial No.");
                        CurrPage.UPDATE;
                    end;
                }
                field(ItemNoFilter; ItemNoFilter)
                {
                    Caption = 'Item No Filter';

                    trigger OnLookup(var Text: Text): Boolean;
                    var
                        ItemList: Page "Item List";
                        item: Record Item;
                    begin
                        //ItemList.LOOKUPMODE(TRUE);
                        //ItemList.SETTABLEVIEW(item);
                        IF PAGE.RUNMODAL(31, item) = ACTION::LookupOK THEN BEGIN
                            Text := item."No.";
                            EXIT(TRUE);
                        END;
                    end;

                    trigger OnValidate();
                    begin
                        SETFILTER("Item No.", ItemNoFilter);
                        ItemNoFilter := GETFILTER("Item No.");
                        CurrPage.UPDATE;
                    end;
                }
                field(ItemNameFilter; ItemNameFilter)
                {
                    Caption = 'Item Name Filter';
                    Visible = false;

                    trigger OnValidate();
                    begin
                        SETFILTER(Description, ItemNameFilter);
                        ItemNameFilter := GETFILTER(Description);
                        CurrPage.UPDATE;
                    end;
                }
                field(DocNoFilter; DocNoFilter)
                {
                    Caption = 'Purch. Doc. No. Filter';

                    trigger OnLookup(var Text: Text): Boolean;
                    var
                        PurchList: Page "Purchase Order List";
                        purch: Record "Purchase Header";
                    begin

                        IF PAGE.RUNMODAL(9307, purch) = ACTION::LookupOK THEN BEGIN
                            Text := purch."No.";
                            EXIT(TRUE);
                        END;
                    end;

                    trigger OnValidate();
                    begin
                        SETFILTER("Source ID", DocNoFilter);
                        DocNoFilter := GETFILTER("Source ID");
                        CurrPage.UPDATE;
                    end;
                }
            }
            repeater(Group)
            {
                field(VendorName; VendorName)
                {
                    Caption = 'Vendor Name';
                    Editable = false;
                }
                field("Source ID"; "Source ID")
                {
                    Editable = false;
                }
                field("Source Ref. No."; "Source Ref. No.")
                {
                    Editable = false;
                }
                field("Item No."; "Item No.")
                {
                    Editable = false;
                }
                field(Description; ItemName)
                {
                    Editable = false;
                }
                field("Quantity (Base)"; "Quantity (Base)")
                {
                    Editable = false;
                }
                field("Serial No."; "Serial No.")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    var
        purchhead: Record "Purchase Header";
        item: Record Item;
    begin
        VendorName := '';
        purchhead.SETRANGE("No.", "Source ID");
        IF purchhead.FINDFIRST THEN
            VendorName := purchhead."Buy-from Vendor Name";

        ItemName := '';
        IF item.GET("Item No.") THEN
            ItemName := item.Description;
    end;

    var
        DocNoFilter: Text;
        ItemNoFilter: Text;
        ItemNameFilter: Text;
        SerialFilter: Text;
        VendorName: Text;
        ItemName: Text;
}

