codeunit 50008 "Change Periode Date Sales"
{
    Permissions = TableData "Sales Invoice Header" = rm,
                  TableData "Sales Cr.Memo Header" = rm,
                  tabledata "Sales Cr.Memo Line" = rm,
                  tabledata "Sales Invoice Line" = rm;

    trigger OnRun();
    begin
    end;

    var
        sales: Integer;

    procedure ChangeSalesInvoiceDate(PeriodeStart: Date; PeriodeEnd: Date; sales: Record "Sales Invoice Header");
    var
        salesline: Record "Sales Invoice Line";
    begin
        sales."Period Start" := PeriodeStart;
        sales."Period End" := PeriodeEnd;
        sales.MODIFY;
        salesline.SETRANGE("Document No.", sales."No.");
        IF salesline.FINDFIRST THEN
            REPEAT
                salesline."Period Start" := PeriodeStart;
                salesline."Period End" := PeriodeEnd;
                salesline.MODIFY;
            UNTIL salesline.NEXT = 0;
    end;

    procedure ChangeSalesCrMemoDate(PeriodeStart: Date; PeriodeEnd: Date; sales: Record "Sales Cr.Memo Header");
    var
        salesline: Record "Sales Cr.Memo Line";
    begin
        sales."Period Start" := PeriodeStart;
        sales."Period End" := PeriodeEnd;
        sales.MODIFY;
        salesline.SETRANGE("Document No.", sales."No.");
        IF salesline.FINDFIRST THEN
            REPEAT
                salesline."Period Start" := PeriodeStart;
                salesline."Period End" := PeriodeEnd;
                salesline.MODIFY;
            UNTIL salesline.NEXT = 0;
    end;

    procedure ChangeSalesInvoicePostGroup(GenBusGroup: Code[20]; GenItemGroup: Code[20]; sales: Record "Sales Invoice Line");
    var
    begin
        IF GenBusGroup <> '' THEN
            sales."Gen. Bus. Posting Group" := GenBusGroup;
        IF GenItemGroup <> '' THEN
            sales."Gen. Prod. Posting Group" := GenItemGroup;
        sales.MODIFY;

    end;
}