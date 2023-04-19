tableextension 50006 SalesHaderExt extends "Sales Header"
{
    fields
    {
        modify("Sell-to Customer No.")
        {
            trigger OnAfterValidate()
            var
                Notif: Notification;
            begin
                if Cust.Get("Sell-to Customer No.") then begin
                    if Cust."Separate Halls Inv." then
                        Notif.Message := Text000
                    //Message(Text000)
                    else
                        Notif.Message := Text001;
                    //Message(Text001);
                    Notif.Send();
                end;
            end;
        }
        field(50000; Site; Code[20])
        {
            TableRelation = "Cust-Op-Site"."Site Code";

            //DevOps #619 -- begin
            trigger OnValidate()
            begin
                CustSite.Reset();
                if CustSite.Get("Sell-to Customer No.", Site) then begin
                    if CustSite."Contract Code" <> '' then begin
                        Rec.Validate("Contract Code", CustSite."Contract Code");
                        Rec.Modify();
                    end;
                end;

                SalesLineRec.Reset();
                SalesLineRec.SetRange("Document No.", Rec."No.");
                SalesLineRec.SetRange("Document Type", Rec."Document Type");
                // SalesLineRec.SetRange(Type, SalesLineRec.Type::Item);
                IF SalesLineRec.FindSet() THEN
                    repeat
                        SalesLineRec.Site := Rec.Site;
                        SalesLineRec.Modify();
                    until SalesLineRec.Next() = 0;
            end;
            //DevOps #619 -- end
        }
        //DevOps #619 -- begin
        field(50001; "Contract Code"; Code[4])
        {
            TableRelation = "Customer-Site"."Contract Code" WHERE("Customer No." = field("Sell-to Customer No."));

            trigger OnValidate()
            begin
            end;
        }
        //DevOps #619 -- end
        //DEVOPS #622 -- begin
        field(50002; "Period Start"; Date)
        {
            trigger OnValidate()
            begin
                UpdateDateLines(Rec);
            end;
        }
        field(50003; "Period End"; Date)
        {
            trigger OnValidate()
            begin
                UpdateDateLines(Rec);
            end;
        }

        field(50004; "Customer Payment Bank Code"; Code[100])
        {

            FieldClass = "Flowfield";
            CalcFormula = lookup(Customer."Payment Bank Code" where("No." = field("Sell-to Customer No.")));
        }

        field(50005; "Customer Payment Bank Name"; Code[100])
        {

            FieldClass = "Flowfield";
            CalcFormula = lookup(Customer."Payment Bank Code" where("No." = field("Sell-to Customer No.")));
        }

        field(50006; "Billing Statement"; Boolean)
        {


        }
        field(50007; "LocalCurrAmt"; Decimal)
        {
            caption = 'Local Currency Amount';

        }
        field(50008; "Customer Payment Bank Code2"; Code[100])
        {

            FieldClass = "Flowfield";
            CalcFormula = lookup(Customer."Payment Bank Code2" where("No." = field("Sell-to Customer No.")));
        }

        field(50009; "Customer Payment Bank Name2"; Code[100])
        {

            FieldClass = "Flowfield";
            CalcFormula = lookup(Customer."Payment Bank Code2" where("No." = field("Sell-to Customer No.")));
        }
        field(50010; "Currency2"; code[10])
        {
            caption = 'Local Currency ';
            TableRelation = Currency;

        }


    }
    var
        Cust: Record Customer;
        SalesLineRec: Record "Sales Line";
        Text000: Label 'This customer requires Separate Halls Invoicing.';
        Text001: Label 'This customer requires one invoice for all Halls.';
        CustSite: Record "Customer-Site";
    //procedure no longer required
    /*procedure UpdateLineDims(SH: Record "Sales Header"; SiteCode: Code[20])
      var
          DimSetEntry: Record "Dimension Set Entry";

          SalesHeader: Record "Sales Header";
          FASetup: Record "FA Setup";
          DimMgmt: Codeunit DimensionManagement;
          DimVal: Record "Dimension Value";
      begin
          Message('Here');
          FASetup.Get();
          if FASetup."Enable FA Site Tracking" then begin
              if SalesHeader.Get(SH."Document Type", SH."No.") then begin
                  DimSetEntry.SetRange(DimSetEntry."Dimension Set ID", SalesHeader."Dimension Set ID");
                  DimSetEntry.SetFilter(DimSetEntry."Dimension Code", FASetup."Site Dimension");
                  if DimSetEntry.FindFirst() then begin
                      //already exists - update                    
                      //DimSetEntry."Dimension Value Code" := SiteCode;
                      Delete2(DimSetEntry."Dimension Set ID", FASetup."Site Dimension");
                      CLEAR(TempDimSetEntry);
                      TempDimSetEntry.VALIDATE("Dimension Set ID", -1);
                      TempDimSetEntry.VALIDATE("Dimension Code", FASetup."Site Dimension");
                      TempDimSetEntry.VALIDATE("Dimension Value Code", SiteCode);
                      TempDimSetEntry.INSERT(TRUE);

                      SalesHeader."Dimension Set ID" := DimMgmt.GetDimensionSetID(TempDimSetEntry);

                      SalesHeader.Modify();
                  end
                  else begin
                      //does not exist yet - insert                   

                      DimMgmt.GetDimensionSet(TempDimSetEntry, SalesHeader."Dimension Set ID");
                      DimVal.Reset();
                      if DimVal.get(FASetup."Site Dimension", SiteCode) then begin

                          TempDimSetEntry.Init();
                          //TempDimSetEntry."Dimension Set ID" := DimMgmt.GetDimensionSetID(TempDimSetEntry);
                          TempDimSetEntry."Dimension Code" := FASetup."Site Dimension";
                          TempDimSetEntry."Dimension Value Code" := SiteCode;
                          TempDimSetEntry."Dimension Value ID" := DimVal."Dimension Value ID";
                          TempDimSetEntry.Insert();
                          SalesHeader."Dimension Set ID" := DimMgmt.GetDimensionSetID(TempDimSetEntry);

                          SalesHeader.Modify();
                      end;

                      CLEAR(TempDimSetEntry);
                  end;
              end;
          end;
      end; */
    //DEVOPS #622 -- begin
    local procedure UpdateDateLines(SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
        GLAccount: Record "G/L Account";
    begin
        SalesLine.Reset();
        SalesLine.SetFilter("Document Type", '%1', SalesHeader."Document Type");
        SalesLine.SetFilter("Document No.", SalesHeader."No.");
        //SalesLine.SetFilter(Type, '%1', SalesLine.Type::"G/L Account");
        SalesLine.SetFilter("No.", '<>%1', '');
        if SalesLine.FindSet() then begin
            repeat begin
                //if GLAccount.Get(SalesLine."No.") then begin
                // if GLAccount."Periods Required" then begin
                SalesLine.Validate("Period Start", SalesHeader."Period Start");
                SalesLine.Validate("Period End", SalesHeader."Period End");
                SalesLine.Modify();
                /// end;
                // end;
            end;
            until (SalesLine.Next = 0);
        end;
    end;
    //DEVOPS #622 -- end
}
