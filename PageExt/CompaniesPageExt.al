pageextension 50056 CompaniesPageExt extends Companies
{



    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        // modify("Delete)

    }

    var
        myInt: Integer;

    trigger OnDeleteRecord(): Boolean
    begin
        //Error('Delete is disabled');
    end;
}