table 71102 "Budget Import Buffer"
{
    DataClassification = ToBeClassified;

    fields
    {


        // Rearranged field numbers
        field(1; "G/L Account No."; Code[20])
        {
            Caption = 'G/L Account No.';
            TableRelation = "G/L Account";

            trigger OnValidate()
            begin
                // Your code here
            end;
        }
        field(2; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(3; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(4; "Budgeted Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Budgeted Amount';
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(6; "Project Number"; Code[20])
        {
            Caption = 'Project Number';
            TableRelation = "Job"."No.";
            DataClassification = ToBeClassified;
        }
        field(7; "Global Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Global Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(8; "Global Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Global Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
        }
        field(9; "Global Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Global Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));
        }
        field(10; "Global Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Global Dimension 6 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(6));
        }
        field(11; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Global Dimension 7 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(7));
        }
        field(12; "Global Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            Caption = 'Global Dimension 8 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(8));
        }
        field(13; "Job Number"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Information";
        }
        field(14; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}