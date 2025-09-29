tableextension 71102 "Sales Header Extension" extends "Sales Header"
{
    fields
    {
        field(71100; "LC No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(71101; "BG No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
}
