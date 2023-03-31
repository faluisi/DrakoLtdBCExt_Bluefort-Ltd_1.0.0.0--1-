report 50039 EPS_SalesInvoiceBook
{
    DefaultLayout = RDLC;
    RDLCLayout = './RDLC/R50039_EPS_SalesInvoiceBook.rdl';
    Caption = 'Libro Ventas';
    UsageCategory = Administration;
    ApplicationArea = All;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = sorting("No.");
            column(datefrom; datefrom)
            {

            }
            column(dateto; dateto)
            {

            }
            column(classinvoice; format(classinvoice))
            {

            }
            column(Order_No_; ordenno)
            {

            }
            column(No_; "No.")
            {

            }

            column(Posting_Date; "Posting Date")
            {

            }
            column(Document_Date; "Document Date")
            {

            }
            column(Posting_Description; "Posting Description")
            {

            }
            column(VAT_Registration_No_; "VAT Registration No.")
            {

            }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            {

            }





            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemTableView = sorting("Document No.", "Line No.");
                DataItemLink = "Document No." = field("No.");
                column(Line_Amount; "Line Amount")
                {

                }
                column(VAT__; "VAT %")
                {

                }
                column(cuota; "Line Amount" * "VAT %" / 100)
                {

                }
                column(Retencion; Retencion)
                {

                }
                column(Amount_Including_VAT; "Amount Including VAT")
                {

                }


                trigger
                OnPreDataItem()
                begin
                    Retencion := 0;
                end;

                trigger
                OnAfterGetRecord()
                begin

                    if classinvoice <> oldclass then
                        ordenno := 1
                    else
                        ordenno += 1;
                    oldclass := classinvoice;
                end;
            }
            trigger
            OnPreDataItem()
            begin
                "Sales Invoice Header".SetRange("Posting Date", datefrom, dateto);
            end;

            trigger
            OnAfterGetRecord()
            var
                country: record "Country/Region";
            begin
                classinvoice := classinvoice::" ";
                if ("Sell-to Country/Region Code" = 'ES') or ("Sell-to Country/Region Code" = '') then
                    classinvoice := classinvoice::FACN
                else
                    if country.get("Sales Invoice Header"."Sell-to Country/Region Code") then
                        if country."EU Country/Region Code" = '' then
                            classinvoice := classinvoice::EXUE
                        else
                            classinvoice := classinvoice::INUE;



            end;

        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Filtros)
                {
                    field(datefrom; datefrom)
                    {
                        Caption = 'Fecha Inicio';
                        ApplicationArea = All;

                    }
                    field(dateto; dateto)
                    {
                        Caption = 'Fecha Fin';
                        ApplicationArea = All;

                    }
                }
            }
        }
    }
    var
        Retencion: Decimal;
        classinvoice: option " ",FACN,EXUE,INUE;
        datefrom: Date;
        dateto: Date;
        OrdenNo: integer;
        oldclass: option " ",FACN,EXUE,INUE;
}