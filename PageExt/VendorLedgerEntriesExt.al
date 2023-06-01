pageextension 50048 VendorLedgerEntriesExt extends "Vendor Ledger Entries"
{
    layout
    {
        addafter("Posting Date")
        {
            //DEVOPS #742 -- begin
            // field("Document Date"; "Document Date")
            // {
            //     ApplicationArea = All;
            // }
            //DEVOPS #742 -- end
        }
    }
    actions
    {
    }
    var
}
