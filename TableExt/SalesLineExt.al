tableextension 50008 SalesLineExt extends "Sales Line"
{
    fields
    {
        //DEVOPS #622 -- begin
        field(50000; "Period Start"; Date)
        {
            Editable = true;
        }
        field(50001; "Period End"; Date)
        {
            Editable = true;
            trigger OnValidate()
            var
                i: Integer;
            begin
                if "Period Start" = 0D then
                    "Period Start" := "Shipment Date";
                if "Period End" = 0D then
                    "Period End" := "Shipment Date";
                perioddiff := "Period End" - "Period Start";
                if perioddiff < 0 then
                    Error('Period Start is greater than Period End!');

                if perioddiff > 31 then
                    while i < 2 do begin
                        if Confirm(STRSUBSTNO('Period is longer than 31 days.\Do you want to continue?(Step %1)', i + 1), true) then
                            i := i + 1
                        else begin
                            Error('You cancel last action!');
                            break;
                        end;

                    end;
            end;
        }
        //DEVOPS #622 -- end
        field(50002; IsPeriodEnabled; Boolean) //used for enabling/disabling date fields on form
        {
        }
        field(50003; Site; Code[20])
        {
            Caption = 'Site';
            TableRelation = "Cust-Op-Site"."Site Code";
        }
        modify("No.")
        {
            trigger OnAfterValidate()
            var
                SalesHeaderRec: Record "Sales Header";
            begin
                if rec.Type = Rec.Type::"G/L Account" then begin
                    if GlAccount.Get("No.") then begin
                        if GlAccount."Periods Required" then begin
                            // get sales header
                            // Message(Format("Line No."));
                            if ("Line No." <> 0) then begin
                                if SalesHeader.get("Document Type", "Document No.") then begin
                                    if SalesHeader."Period Start" <> 0D then
                                        Rec.Validate("Period Start", SalesHeader."Period Start");
                                    if SalesHeader."Period End" <> 0D then
                                        Rec.Validate("Period End", SalesHeader."Period End");
                                    //rec.Modify(false);
                                end;
                            end;
                        end;
                    end;
                end;


                // end;
                //if SalesHeader.get("Document Type", "Document No.") then begin
                //  Rec.Validate("Period Start", SalesHeader."Period Start");
                //  Rec.Validate("Period End", SalesHeader."Period End");
                //   rec.Modify(false);
                // end;
                // end;
                //end;
                //end;
                begin
                    if SalesHeaderRec.Get(Rec."Document Type", Rec."Document No.") then
                        Validate(Rec.Site, SalesHeaderRec.Site);
                end;
            end;

        }

    }
    var
        GlAccount: Record "G/L Account";
        SalesHeader: Record "Sales Header";
        newline: record "Sales Line";
        existingline: record "Sales Line";
        SalesHeaderRec: Record "Sales Header";
        perioddiff: Integer;

    trigger OnAfterInsert()
    var
        i: Integer;
    begin
        //UpdateIsPeriodEnabled();  //DEVOPS #622
        // Message(Format("Line No."));
        if ("Line No." <> 0) then begin
            if SalesHeader.get("Document Type", "Document No.") then begin
                if SalesHeader."Period Start" <> 0D then
                    Rec.Validate("Period Start", SalesHeader."Period Start");
                if SalesHeader."Period End" <> 0D then
                    Rec.Validate("Period End", SalesHeader."Period End");
                rec.Modify(false);
            end;
        end;

        // insert line for billing statement

        if (SalesHeader."Billing Statement" = true) then begin
            if (Rec."No." = 'S0001') then begin
                newline.Init();
                newline."Document Type" := Rec."Document Type";
                newline.Type := newline.Type::Item;
                newline."Document No." := REc."Document No.";
                newline."Line No." := rec."Line No." + 1;
                newline."No." := 'S0009';
                newline.Quantity := 1;
                newline.validate(Amount, -Rec.Amount * 0.05);

                newline.Insert();
            end
            else
                if (Rec."No." = 'S0002') then begin
                    newline.Init();
                    newline."Document Type" := Rec."Document Type";
                    newline.Type := newline.Type::Item;
                    newline."Document No." := REc."Document No.";
                    newline."Line No." := rec."Line No." + 1;
                    newline."No." := 'S0008';
                    newline.Quantity := 1;
                    newline.validate(Amount, -Rec.Amount * 0.05);

                    newline.Insert();

                end;
        end;
    end;

    trigger OnAfterModify()
    var
        i: Integer;
    begin
        //UpdateIsPeriodEnabled();  //DEVOPS #622
        if SalesHeader.get("Document Type", "Document No.") then begin

            if (Rec."No." = 'S0001') or (Rec."No." = 'S0002') then begin

                existingline.SetRange("Document No.", rec."Document No.");
                existingline.SetRange("Line No.", rec."Line No." + 1);
                if (existingline.FindFirst()) then begin
                    existingline.Validate("No.");
                    existingline.Validate("Unit Price", -rec."Unit Price" * 0.05);
                    existingline.Validate(Amount, -Rec.Amount * 0.05);
                    existingline.Modify();
                end;
            end;
        end;

        //if ("Period Start" = 0D) or ("Period End" = 0D) then begin
        //    while i < 2 do begin
        //        if Confirm(STRSUBSTNO('Period Start / Period End values can’t be empty.\Do you want to continue?(Step %1)', i + 1), true) then
        //            i := i + 1
        //        else begin
        //            Error('Period Start - Period End values can’t be empty!');
        //            break;
        //        end;

        //    end;
        //    "Period Start" := "Shipment Date";
        //    "Period End" := "Shipment Date";
        //end;


    end;

    trigger OnDelete()
    begin
        if SalesHeader.get("Document Type", "Document No.") then begin

            if (Rec."No." = 'S0001') or (Rec."No." = 'S0002') then begin
                existingline.SetRange("Document No.", rec."Document No.");
                existingline.SetRange("Line No.", rec."Line No." + 1);
                if (existingline.FindFirst()) then begin
                    existingline.Delete();
                end;
            end;
        end;
    end;

    local procedure UpdateIsPeriodEnabled()
    begin
        if (Type = Type::"G/L Account") AND ("No." <> '') then begin
            GlAccount.SetFilter("No.", "No.");
            if GlAccount.FindFirst() then begin
                if GlAccount."Periods Required" then begin
                    IsPeriodEnabled := true;
                end
                else
                    ClearIsPeriod();
            end
            else
                ClearIsPeriod();
        end
        else
            ClearIsPeriod();
        Modify(false);
    end;

    local procedure ClearIsPeriod()
    begin
        IsPeriodEnabled := false;
        Clear("Period Start");
        Clear("Period End");
    end;
}
