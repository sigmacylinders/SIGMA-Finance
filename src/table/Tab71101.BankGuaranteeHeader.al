table 71101 "Bank Guarantee Header"
{
    DataClassification = ToBeClassified;
    DrillDownPageId = "Bank Guarantee List";
    LookupPageId = "Bank Guarantee List";

    fields
    {
        field(1; "BG No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(2; "Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(3; "Transaction Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Purchase,Sale;
        }

        field(4; "Issued To/Received From"; Code[20])
        {
            // IF Rec."Transaction Type" = CONST(Purchase) THEN BEGIN
            //     Caption = 'Issued To';
            // END ELSE BEGIN
            //     Caption = 'Received From';
            // END

            TableRelation = if ("Transaction Type" = const(Purchase)) "Purchase Header"
            else
            if ("Transaction Type" = const(Sale)) "Sales Header";
        }
        field(5; "Issuing Bank"; Code[20])
        {
            TableRelation = "Bank Account";
        }
        field(6; "Receiving Bank"; Code[20])
        {
            TableRelation = "Bank Account";
        }

        field(7; "Date of Issue"; Date)
        {
            DataClassification = ToBeClassified;
        }

        field(8; "Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }

        field(9; "Type of BG"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Inland,Foreign;
        }
        field(10; "Type of Credit Limit"; Option)
        {
            OptionMembers = Revolving,NonRevolving;
        }

        field(11; "BG Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(12; "Released"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(13; "Closed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "BG No.")
        {
            Clustered = true;
        }
    }
}
