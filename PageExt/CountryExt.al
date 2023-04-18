pageextension 50029 CountryExt extends "Countries/Regions"
{
    layout
    {
        addlast(Control1)
        {
            field(Account; rec.Account)
            {
                ApplicationArea = all;

            }

        }

    }
}