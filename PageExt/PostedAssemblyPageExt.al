pageextension 50069 PostedAssemblyExt extends "Posted Assembly Order"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {

        // Add changes to page actions here
        addafter("Print")
        {
            action("Export XML")
            {
                trigger OnAction()
                var
                    xml: XmlPort 50005;
                    currentorder: Record "Posted Assembly Header";
                begin

                    SetSelectionFilter(currentorder);
                    xml.SetTableView(currentorder);
                    xml.Run();

                end;

            }

        }
    }

    var
        myInt: Integer;
}