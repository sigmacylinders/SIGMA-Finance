tableextension 71105 "Genera journal ext FIN" extends "Gen. Journal Line"
{
    fields
    {
        // Add changes to table fields here
        field(71100; "Journal Type"; Code[50])
        {
            Caption = 'Journal Type';
            // Set up a lookup to your port master table here
            TableRelation = "SIGMA Lookup - V2".Code where(Type = const("Journal Type"));
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}