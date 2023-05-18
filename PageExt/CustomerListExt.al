pageextension 50101 CustListExt extends "Customer List"
{
    layout
    {

        modify("Name 2")
        {

            Visible = true;
        }


    }
    actions
    {
        addlast(processing)
        {
            action("Copy Name")
            {

                ApplicationArea = all;
                Image = Copy;
                Promoted = true;
                PromotedIsBig = true;
                trigger
                OnAction()
                var
                    customer: record Customer;
                begin
                    customer.FindFirst();
                    repeat
                        customer."Name 2" := customer.name;
                        customer.Modify();
                    until customer.Next() = 0;
                end;
            }

        }


    }
}