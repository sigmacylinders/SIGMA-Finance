tableextension 71103 "Purchase Header Fin Extension" extends "Purchase Header"
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
