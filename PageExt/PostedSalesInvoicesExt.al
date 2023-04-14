pageextension 50046 PostedSalesInvoicesExt extends "Posted Sales Invoices"
{
    layout
    {
        addafter("No.")
        {


            field("Billing Statement"; "Billing Statement")
            {
                ApplicationArea = all;
            }
        }
        modify("Document Date")
        {
            Visible = true;
        }
        modify("Posting Date")
        {
            Visible = true;
        }

    }
    actions
    {
        addfirst(Navigation)
        {
            action("Print Billing Statement")
            {
                ApplicationArea = all;
                // RunObject = Report "NTT Sales - Billing Statement";

                Image = Print;
                trigger OnAction()
                var
                    rep: report "NTT Sales - Billing Statement";
                    currentdoc: Record "Sales Invoice Header";
                    rep1: report "NTT SALES BILLING NEW";

                begin
                    currentdoc.SetRange("No.", rec."No.");




                    if (currentdoc.FindFirst()) then begin
                        rep.SetTableView(currentdoc);
                        rep1.SetTableView(currentdoc);
                        //Message(CompanyName);
                        if (CompanyName = 'D2R Ltd Branch') then
                            rep1.Run()
                        else
                            rep.Run();

                    end;

                end;

            }
        }
    }
    var
}
