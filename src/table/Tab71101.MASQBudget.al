table 71101 "SIGMA Budget"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Name; Code[50])
        {
            Caption = 'Name';
        }

        field(2; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(3; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Filter';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));


        }
        field(4; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Filter';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

        }
        field(5; "Global Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Global Dimension 3 Filter';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));


        }
        field(6; "Global Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Global Dimension 4 Filter';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

        }
        field(7; "Global Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Global Dimension 5 Filter';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));


        }
        field(8; "Global Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Global Dimension 6 Filter';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(6));

        }
        field(9; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Global Dimension 7 Filter';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(7));


        }
        field(10; "Global Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            Caption = 'Global Dimension 8 Filter';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(8));

        }
        field(11; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(12; StartingDate; Date)
        {
            Caption = 'Starting Date';
        }
        field(13; EndingDate; Date)
        {
            Caption = 'Ending Date';
        }
        field(15; JobNumberFilter; Code[20])
        {
            Caption = 'Job Number Filter';
            TableRelation = "Job Information";
        }
        field(16; GLAccountFilter; text[2048])
        {
            Caption = 'G/L Account Filter';
        }
        field(17; ProjectFilter; Code[20])
        {
            Caption = 'Project Filter';
            TableRelation = Job;
        }
        field(18; "DateFilter"; Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(19; "G/L Account Type Filter"; Enum "SIGMA G/L Account Type")
        {
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(Key1; Name)
        {
            Clustered = true;
        }
    }
}
