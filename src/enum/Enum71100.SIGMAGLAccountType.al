
enum 71100 "SIGMA G/L Account Type"
{
    AssignmentCompatibility = true;
    Extensible = false;

    value(0; " ")
    { }

    value(1; Posting)
    {
        Caption = 'Posting';
    }
    value(2; Heading)
    {
        Caption = 'Heading';
    }
    value(3; Total)
    {
        Caption = 'Total';
    }
    value(4; "Begin-Total")
    {
        Caption = 'Begin-Total';
    }
    value(5; "End-Total")
    {
        Caption = 'End-Total';
    }
}