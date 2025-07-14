tableextension 71100 "Payment Term Extension" extends "Payment Terms"
{

    fields
    {
        // Add changes to table fields here
        field(71101; "Transh1"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Advance","OA","DP";
        }

        field(71102; "Due Date Calculation Days1"; DateFormula)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                BuildDescription(Rec);
            end;
        }

        field(71103; "Transh1 %"; Integer)
        {
            DataClassification = ToBeClassified;
            MinValue = 0;
            MaxValue = 100;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                BuildDescription(Rec);
            end;
        }

        field(71104; "Due Date Calculation From 1"; Text[100])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                BuildDescription(Rec);
            end;
        }

        field(71105; "Transh2"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Advance","OA","DP";
        }

        field(71106; "Due Date Calculation Days2"; DateFormula)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                BuildDescription(Rec);
            end;
        }

        field(71107; "Transh2 %"; Integer)
        {
            DataClassification = ToBeClassified;
            MinValue = 0;
            MaxValue = 100;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                BuildDescription(Rec);
            end;
        }

        field(71108; "Due Date Calculation From 2"; Text[100])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
            
                BuildDescription(Rec);
            end;
        }

        field(71109; "Transh3"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Advance","OA","DP";
        }

        field(71110; "Due Date Calculation Days3"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }

        field(71111; "Transh3 %"; Integer)
        {
            DataClassification = ToBeClassified;
            MinValue = 0;
            MaxValue = 100;
        }

        field(71112; "Due Date Calculation From 3"; Text[100])
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
    procedure BuildDescription(paymentTerm: Record "Payment Terms")
    var
        DescriptionPart1: Text;
        DescriptionPart2: Text;
    begin
        DescriptionPart1 := '';
        DescriptionPart2 := '';
        // Build first part
        if (Transh1 <> 0) or ("Transh1 %" <> 0) or
          (Format("Due Date Calculation Days1") <> '') or
          ("Due Date Calculation From 1" <> '') then begin
            DescriptionPart1 := StrSubstNo('%1 %2 %3 %4',
                Format("Transh1 %"),
                Format(Transh1),
                Format("Due Date Calculation Days1"),
                Format("Due Date Calculation From 1"));
        end;
        // Build second part only if at least one of the fields is not blank or zero
        if (Transh2 <> 0) or ("Transh2 %" <> 0) or
           (Format("Due Date Calculation Days2") <> '') or
           ("Due Date Calculation From 2" <> '') then begin

            DescriptionPart2 := StrSubstNo('%1 %2 %3 %4',
                Format("Transh2 %"),
                Format(Transh2),
                Format("Due Date Calculation Days2"),
                Format("Due Date Calculation From 2"));
        end;

        // Combine parts

        if (DescriptionPart1 = '') and (DescriptionPart2 = '') then
            Description := '';
        if (DescriptionPart1 <> '') and (DescriptionPart2 = '') then
            Description := DescriptionPart1;
        if (DescriptionPart2 <> '') and (DescriptionPart1 = '') then
            Description := DescriptionPart2;
        if (DescriptionPart1 <> '') and (DescriptionPart2 <> '') then
            Description := DescriptionPart1 + ', ' + DescriptionPart2;
        Rec.Modify();
    end;


    var
        myInt: Integer;
}