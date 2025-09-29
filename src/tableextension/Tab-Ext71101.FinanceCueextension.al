tableextension 71101 "Finance Cue extension" extends "Finance Cue"
{
    fields
    {
        // Add changes to table fields here
        field(71100; "Bank Guarantee Released"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Bank Guarantee Header" where(Released = const(true)));
        }
        field(71101; "Bank Guarantee Closed"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Bank Guarantee Header" where(Closed = const(true)));
        }
        field(71102; "Bank Guarantee Fully Utilized"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Bank Guarantee Header" where(Released = const(true)));
        }
        field(71103; "Letter of Credit Released"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("LC Header" where(Released = const(true)));
        }

        // FlowFields for Lease Agreement Status
        field(71104; "Letter of Credit Closed"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("LC Header" where(Closed = const(true)));
        }
        field(71105; "LC Fully Utilized"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("LC Header" where(Released = const(true)));
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