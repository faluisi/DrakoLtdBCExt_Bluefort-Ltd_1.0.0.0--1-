pageextension 50017 FixedAssetSetupExt extends "Fixed Asset Setup"
{
  layout
  {
    addafter(Numbering)
    {
      group(CustomerSiteTracking)
      {
        Caption = 'Customer - Site Tracking';

        group(CSTrackingDimensions)
        {
          Caption = 'Dimensions';

          field("Customer Dimension";"Customer Dimension")
          {
            ApplicationArea = all;
          }
          field("Site Dimension";"Site Dimension")
          {
            ApplicationArea = all;
          }
          field("Operator Dimension";"Operator Dimension")
          {
            ApplicationArea = all;
          }
          //DevOps #619 -- begin
          field("Contract Dimension";"Contract Dimension")
          {
            ApplicationArea = all;
          }
        //DevOps #619 -- end
        }
        field("Enable FA Site Tracking";"Enable FA Site Tracking")
        {
          ApplicationArea = All;
        }
        field("FA Company";"FA Company")
        {
          ApplicationArea = All;
          Caption = 'Fixed Asset Company';
        }
      }
    }
  }
  actions
  {
  }
  var
}
