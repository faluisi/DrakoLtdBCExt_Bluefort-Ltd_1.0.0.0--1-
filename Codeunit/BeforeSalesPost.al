codeunit 50007 OneTechSalesPostEvents
{

    EventSubscriberInstance = StaticAutomatic;

    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', false, false)]
    local procedure CheckPeriods(var SalesHeader: Record "Sales Header")
    var
        salessetup: Record "Sales & Receivables Setup";
    begin
        salessetup.Get();
        if (salessetup."Period Start End mandatory") then begin
            // SalesHeader.TestField("Period Start");
            // SalesHeader.TestField("Period End");

            if (SalesHeader."Period Start" = 0D) then
                Error('Period start is mandatory');
            if (SalesHeader."Period End" = 0D) then
                Error('Period end is mandatory');

        end;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforeTempPrepmtPurchLineInsert', '', false, false)]
    local procedure SetAmt
    (
        var TempPrepmtPurchLine: Record "Purchase Line" temporary;
    var TempPurchLine: Record "Purchase Line" temporary; PurchaseHeader: Record "Purchase Header"; CompleteFunctionality: Boolean
    )

    begin
        TempPrepmtPurchLine."Prepmt Amt to Deduct" := TempPurchLine."Prepmt Amt to Deduct";
        TempPrepmtPurchLine."Prepmt. Amt. Inv." := TempPurchLine."Prepmt. Amt. Inv.";
        TempPrepmtPurchLine."Prepmt. Amt. Incl. VAT" := TempPurchLine."Prepmt. Amt. Incl. VAT";



    end;
}