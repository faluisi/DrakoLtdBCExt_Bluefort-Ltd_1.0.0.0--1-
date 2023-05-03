codeunit 50003 SalesPostEvents
{
    trigger OnRun()
    begin
    end;

    var
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', true, true)]
    local procedure AssignDocDimSetEntryValue(var SalesHeader: Record "Sales Header")//procedure to create Dim. Set Entries for Sales Doc. being posted
    var
        FASetup: Record "FA Setup";
        DimMgmt: Codeunit DimensionManagement;
        DimVal: Record "Dimension Value";
        TempDimSetEntry: Record "Dimension Set Entry" temporary;
    begin
        FASetup.Get();
        if FASetup."Enable FA Site Tracking" then begin
            DimMgmt.GetDimensionSet(TempDimSetEntry, SalesHeader."Dimension Set ID");
            DimVal.Reset();
            if DimVal.get(FASetup."Site Dimension", SalesHeader.Site) then begin
                TempDimSetEntry.Init();
                //TempDimSetEntry."Dimension Set ID" := DimMgmt.GetDimensionSetID(TempDimSetEntry);
                TempDimSetEntry."Dimension Code" := FASetup."Site Dimension";
                TempDimSetEntry."Dimension Value Code" := SalesHeader.Site;
                TempDimSetEntry."Dimension Value ID" := DimVal."Dimension Value ID";
                TempDimSetEntry.Insert();
                SalesHeader."Dimension Set ID" := DimMgmt.GetDimensionSetID(TempDimSetEntry);
                SalesHeader.Modify();
            end;
            CLEAR(TempDimSetEntry);
        end;
    end;
    //DevOps #619 -- begin
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', true, true)]
    local procedure AssignContractDocDimSetEntryValue(var SalesHeader: Record "Sales Header")//procedure to create Dim. Set Entries for Sales Doc. being posted
    var
        FASetup: Record "FA Setup";
        DimMgmt: Codeunit DimensionManagement;
        DimVal: Record "Dimension Value";
        TempDimSetEntry: Record "Dimension Set Entry" temporary;
        DSE_C: Record "Dimension Set Entry";
    begin
        FASetup.Get();
        DSE_C.Reset();
        if not DSE_C.Get(SalesHeader."Dimension Set ID", FASetup."Contract Dimension") then begin
            if FASetup."Enable FA Site Tracking" then begin
                DimMgmt.GetDimensionSet(TempDimSetEntry, SalesHeader."Dimension Set ID");
                DimVal.Reset();
                if DimVal.get(FASetup."Contract Dimension", SalesHeader."Contract Code") then begin
                    TempDimSetEntry.Init();
                    TempDimSetEntry."Dimension Code" := FASetup."Contract Dimension";
                    TempDimSetEntry."Dimension Value Code" := SalesHeader."Contract Code";
                    TempDimSetEntry."Dimension Value ID" := DimVal."Dimension Value ID";
                    TempDimSetEntry.Insert();
                    SalesHeader."Dimension Set ID" := DimMgmt.GetDimensionSetID(TempDimSetEntry);
                    SalesHeader.Modify();
                end;
                CLEAR(TempDimSetEntry);
            end;
        end;
    end;
    //DevOps #619 -- end
    //DevOps #622 -- begin 
    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromSalesHeader', '', true, true)]
    local procedure "Gen. Journal Line_OnAfterCopyGenJnlLineFromSalesHeader"(SalesHeader: Record "Sales Header";
    var GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine."Period Start" := SalesHeader."Period Start";
        GenJournalLine."Period End" := SalesHeader."Period End";
        GenJournalLine.Segment := SalesHeader.Segment;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitGLEntry', '', true, true)]
    local procedure "Gen. Jnl.-Post Line_OnAfterInitGLEntry"(var GLEntry: Record "G/L Entry";
    GenJournalLine: Record "Gen. Journal Line")
    begin
        GLEntry."Period Start" := GenJournalLine."Period Start";
        GLEntry."Period End" := GenJournalLine."Period End";

        GLEntry.Segment := GenJournalLine.Segment;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterHandleAddCurrResidualGLEntry', '', true, true)]
    local procedure "Gen. Jnl.-Post Line_OnAfterHandleAddCurrResidualGLEntry"(GenJournalLine: Record "Gen. Journal Line";
    GLEntry2: Record "G/L Entry")
    begin
        GLEntry2."Period Start" := GenJournalLine."Period Start";
        GLEntry2."Period End" := GenJournalLine."Period End";
        GLEntry2.Segment := GenJournalLine.Segment;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeInsertGLEntryBuffer', '', true, true)]
    local procedure "Gen. Jnl.-Post Line_OnBeforeInsertGLEntryBuffer"(var TempGLEntryBuf: Record "G/L Entry";
    var GenJournalLine: Record "Gen. Journal Line";
    var BalanceCheckAmount: Decimal;
    var BalanceCheckAmount2: Decimal;
    var BalanceCheckAddCurrAmount: Decimal;
    var BalanceCheckAddCurrAmount2: Decimal;
    var NextEntryNo: Integer)
    begin
        TempGLEntryBuf."Period Start" := GenJournalLine."Period Start";
        TempGLEntryBuf."Period End" := GenJournalLine."Period End";
        TempGLEntryBuf.Segment := GenJournalLine.Segment;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', true, true)]
    local procedure "Cust. Ledger Entry_OnAfterCopyCustLedgerEntryFromGenJnlLine"(var CustLedgerEntry: Record "Cust. Ledger Entry";
    GenJournalLine: Record "Gen. Journal Line")
    begin
        CustLedgerEntry."Period Start" := GenJournalLine."Period Start";
        CustLedgerEntry."Period End" := GenJournalLine."Period End";
        CustLedgerEntry.Segment := GenJournalLine.Segment;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitCustLedgEntry', '', true, true)]
    local procedure "Gen. Jnl.-Post Line_OnAfterInitCustLedgEntry"(var CustLedgerEntry: Record "Cust. Ledger Entry";
    GenJournalLine: Record "Gen. Journal Line")
    begin
        CustLedgerEntry."Period Start" := GenJournalLine."Period Start";
        CustLedgerEntry."Period End" := GenJournalLine."Period End";
        CustLedgerEntry.Segment := GenJournalLine.Segment;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeInsertDtldCustLedgEntry', '', true, true)]
    local procedure "Gen. Jnl.-Post Line_OnBeforeInsertDtldCustLedgEntry"(var DtldCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
    GenJournalLine: Record "Gen. Journal Line";
    DtldCVLedgEntryBuffer: Record "Detailed CV Ledg. Entry Buffer")
    begin
        DtldCustLedgEntry."Period Start" := GenJournalLine."Period Start";
        DtldCustLedgEntry."Period End" := GenJournalLine."Period End";
    end;
    //DevOps #622 -- end 
}
