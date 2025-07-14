tableextension 71104 "User Setup Extension1" extends "User Setup"
{
    fields
    {
        // Add changes to table fields here
        field(71100; "Customers Full access"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(71101; "Vendors Full access"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(71102; "Items Full access"; Boolean)
        {
            DataClassification = ToBeClassified;
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