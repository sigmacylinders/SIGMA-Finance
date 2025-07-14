tableextension 71101 "Customer Extension1" extends customer
{
    fields
    {
        // Add changes to table fields here
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    trigger OnInsert()
    var
    begin
        Clear(UserSetup);
        UserSetup.Get(UserId);
        IF (NOT UserSetup."Customers Full access") then
            Error('No Permission');

    end;

    trigger OnModify()
    var
    begin
        Clear(UserSetup);
        UserSetup.Get(UserId);
        IF (NOT UserSetup."Customers Full access") then
            Error('No Permission');

    end;

    var
        myInt: Integer;
        UserSetup: Record "User Setup";
        CustomerFullAccess: Boolean;
}