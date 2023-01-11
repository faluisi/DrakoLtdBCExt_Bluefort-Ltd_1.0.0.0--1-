page 50001 "Customer - Site"
{
  PageType = List;
  //ApplicationArea = All;
  //UsageCategory = Lists;
  SourceTable = "Customer-Site";

  layout
  {
    area(Content)
    {
      repeater(GroupName)
      {
        field("Site Code";"Site Code")
        {
          ApplicationArea = All;
          Caption = 'Site Code';
        }
        field("Site Name";"Site Name")
        {
          ApplicationArea = All;
          Caption = 'Site Name';
        }
        field(Address;Address)
        {
          ApplicationArea = All;
        }
        field("Address 2";"Address 2")
        {
          ApplicationArea = All;
        }
        field(City;City)
        {
          ApplicationArea = All;
        }
        field("Post Code";"Post Code")
        {
          ApplicationArea = All;
        }
        field("Country/Region Code";"Country/Region Code")
        {
          ApplicationArea = All;
        }
        /*field(Operator; Operator)
                {
                    ApplicationArea = All;
                    Caption = 'Operator';
                    
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        DimensionValue.reset;
                        FASetup.Get();

                        DimensionValue.SetFilter(DimensionValue."Dimension Code", FASetup."Operator Dimension");
                        DimensionValue.SetFilter(DimensionValue."Parent Code", Rec."Customer No.");

                        if page.RunModal(537, DimensionValue) = Action::LookupOK then
                            Validate(rec.Operator, DimensionValue."Code");


                    end;
                }*/
        //DevOps #619 -- begin
        field("Contract Code";"Contract Code")
        {
          ApplicationArea = all;
        }
      //DevOps #619 -- end
      }
    }
    area(Factboxes)
    {
    }
  }
  actions
  {
  }
  var DimensionValue: Record "Dimension Value";
  FASetup: Record "FA Setup";
}
