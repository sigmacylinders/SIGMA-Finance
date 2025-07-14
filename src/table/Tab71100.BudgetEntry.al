table 71100 "Budget Entry"
{
    Caption = 'Budget Entry';
    DrillDownPageID = "SIGMA Budget Matrix";
    LookupPageID = "SIGMA Budget Matrix";
    //  Permissions = TableData "Analysis View Budget Entry" = rd;
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            //  AutoIncrement = true;
        }
        field(2; "Budget Name"; Code[50])
        {
            Caption = 'Budget Name';
            TableRelation = "SIGMA Budget";
        }
        field(3; "G/L Account No."; Code[20])
        {
            Caption = 'G/L Account No.';
            TableRelation = "G/L Account";

            trigger OnValidate()
            begin

            end;
        }
        field(4; Date; Date)
        {
            Caption = 'Date';
            ClosingDates = true;

            trigger OnValidate()
            begin

            end;
        }
        field(5; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));


        }
        field(6; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

        }
        field(7; "Budgeted Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Budgeted Amount';

            trigger OnValidate()
            var
            begin
                Rec."Remaining Budget Amount" := Rec."Budgeted Amount" - Rec."Posted Entries Amount";
            end;

        }
        field(9; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(10; "Business Unit Code"; Code[20])
        {
            Caption = 'Business Unit Code';
            TableRelation = "Business Unit";
        }
        field(11; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = User."User Name";
        }
        field(16; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";


            trigger OnValidate()
            begin
                if not DimMgt.CheckDimIDComb("Dimension Set ID") then
                    Error(DimMgt.GetDimCombErr());
            end;
        }
        field(17; "G/L Budget Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Posted Entries Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Remaining Budget Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }

        field(21; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
        }

        field(22; "G/L Account Type"; Enum "SIGMA G/L Account Type")
        {
            Caption = 'G/L Account Type';

        }
        field(23; "Project Number"; Code[20])
        {
            Caption = 'Project Number';
            TableRelation = "Job"."No.";
            DataClassification = ToBeClassified;
        }
        field(24; "Global Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Global Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));


        }
        field(25; "Global Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Global Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

        }
        field(26; "Global Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Global Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));


        }
        field(27; "Global Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Global Dimension 6 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(6));

        }
        field(28; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Global Dimension 7 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(7));


        }
        field(29; "Global Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            Caption = 'Global Dimension 8 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(8));

        }
        field(30; "Job Number"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Information";
        }
        field(31; Totaling; Text[250])
        {
            Caption = 'Totaling';

            trigger OnValidate()
            var
                BudgetControl: codeunit "Budget Control";
            begin
                if not IsTotaling() then
                    FieldError("G/L Account Type");

                BudgetControl.CalcAmountsAfterValidateTotaling(Rec);
            end;
        }
    }

    keys
    {
        key(Key1; "Budget Name", "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Budget Name", "G/L Account No.", Date)
        {

        }
        key(Key3; "Budget Name", "G/L Account No.", "Business Unit Code", "Global Dimension 1 Code", "Global Dimension 2 Code", Date)
        {

        }
        key(Key4; "Budget Name", "G/L Account No.", Description, Date)
        {
        }
        key(Key5; "G/L Account No.", Date, "Budget Name", "Dimension Set ID")
        {

        }
        key(Key6; "Last Date Modified", "Budget Name")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        CheckIfBlocked();

    end;

    procedure IsTotaling(): Boolean
    begin
        exit(Rec."G/L Account Type" in ["G/L Account Type"::Total, "G/L Account Type"::"End-Total"]);
    end;



    var
        GLBudgetName: Record "SIGMA Budget";
        GLSetup: Record "General Ledger Setup";
        DimVal: Record "Dimension Value";
        DimMgt: Codeunit DimensionManagement;
        GLSetupRetrieved: Boolean;

#pragma warning disable AA0074
        Text001: Label '1,5,,Budget Dimension 1 Code';
        Text002: Label '1,5,,Budget Dimension 2 Code';
        Text003: Label '1,5,,Budget Dimension 3 Code';
        Text004: Label '1,5,,Budget Dimension 4 Code';
#pragma warning restore AA0074
        AnalysisViewBudgetEntryExistsErr: Label 'You cannot change the amount on this G/L budget entry because one or more related analysis view budget entries exist.\\You must make the change on the related entry in the G/L Budget window.';

    procedure GetLastEntryNo(): Integer;
    var
        FindRecordManagement: Codeunit "Find Record Management";
    begin
        exit(FindRecordManagement.GetLastEntryIntFieldValue(Rec, FieldNo("Entry No.")))
    end;

    procedure CheckIfBlocked()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;

        if IsHandled then
            exit;

        if "Budget Name" = GLBudgetName.Name then
            exit;
        if GLBudgetName.Name <> "Budget Name" then
            GLBudgetName.Get("Budget Name");
        GLBudgetName.TestField(Blocked, false);
    end;

    local procedure ValidateDimValue(DimCode: Code[20]; DimValueCode: Code[20])
    begin
        if not DimMgt.CheckDimValue(DimCode, DimValueCode) then
            Error(DimMgt.GetDimErr());
    end;

    local procedure GetGLSetup()
    begin
        if not GLSetupRetrieved then begin
            GLSetup.Get();
            GLSetupRetrieved := true;
        end;
    end;


    procedure UpdateDimSet(var TempDimSetEntry: Record "Dimension Set Entry" temporary; DimCode: Code[20]; DimValueCode: Code[20])
    begin
        if DimCode = '' then
            exit;
        if TempDimSetEntry.Get("Dimension Set ID", DimCode) then
            TempDimSetEntry.Delete();
        if DimValueCode = '' then
            DimVal.Init()
        else
            DimVal.Get(DimCode, DimValueCode);
        TempDimSetEntry.Init();
        TempDimSetEntry."Dimension Set ID" := "Dimension Set ID";
        TempDimSetEntry."Dimension Code" := DimCode;
        TempDimSetEntry."Dimension Value Code" := DimValueCode;
        TempDimSetEntry."Dimension Value ID" := DimVal."Dimension Value ID";
        TempDimSetEntry.Insert();

    end;






}

