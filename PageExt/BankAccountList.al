pageextension 50039 BankAccountList extends "Bank Account List"
{
    layout
    {
        addafter(Name)
        {
            field(Balance; Balance)
            {
                ApplicationArea = all;
            }
            field("Balance (LCY)"; "Balance (LCY)")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter("Trial Balance")
        {
            action(BankTrialBalance)
            {
                Caption = 'Bank Trial Balance';
                ApplicationArea = All;
                Image = BankAccountStatement;

                trigger OnAction()
                begin
                    BTB.Run();
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        if usersetup.Get(UserId) then begin
            if usersetup."Item Filter" <> '' then
                Rec.SetFilter("No.", usersetup."Bank Filter");

        end;


    end;

    var
        BTB: Report "Bank Trial Balance";
        usersetup: record "User Setup";

}
