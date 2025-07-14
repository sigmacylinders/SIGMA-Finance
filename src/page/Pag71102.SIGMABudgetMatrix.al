page 71102 "SIGMA Budget Matrix"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "Budget Entry";
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {


                field("Budget Name"; Rec."Budget Name")
                {
                    ToolTip = 'Specifies the value of the Budget Name field.', Comment = '%';
                    StyleExpr = StyleExprTxt;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                    StyleExpr = StyleExprTxt;
                }
                field("G/L Account No."; Rec."G/L Account No.")
                {
                    ToolTip = 'Specifies the value of the G/L Account No. field.', Comment = '%';
                    StyleExpr = StyleExprTxt;
                }
                field("G/L Account Type"; Rec."G/L Account Type")
                {
                    ToolTip = 'Specifies the value of the G/L Account Type field.', Comment = '%';
                    StyleExpr = StyleExprTxt;
                    Editable = false;
                }
                field(Totaling; Rec.Totaling)
                {
                    ToolTip = 'Specifies the value of the Totaling field.', Comment = '%';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.', Comment = '%';
                    StyleExpr = StyleExprTxt;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ToolTip = 'Specifies the value of the Starting Date field.', Comment = '%';
                    StyleExpr = StyleExprTxt;
                    Editable = false;
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ToolTip = 'Specifies the value of the Ending Date field.', Comment = '%';
                    StyleExpr = StyleExprTxt;
                    Editable = false;
                }
                field("Budgeted Amount"; Rec."Budgeted Amount")
                {
                    ToolTip = 'Specifies the value of the Budgeted Amount field.', Comment = '%';
                    StyleExpr = StyleExprTxt;
                }
                field("Posted Entries Amount"; Rec."Posted Entries Amount")
                {
                    ToolTip = 'Specifies the value of the Posted Entries Amount field.', Comment = '%';
                    StyleExpr = StyleExprTxt;
                    // Editable = false;
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        BudgetControl: Codeunit "Budget Control";
                    begin
                        BudgetControl.LookupPostedEntries(Rec);
                    end;
                }
                field("Remaining Budget Amount"; Rec."Remaining Budget Amount")
                {
                    ToolTip = 'Specifies the value of the Remaining Budget Amount field.', Comment = '%';
                    StyleExpr = StyleExprTxt;
                    Editable = false;
                }
                field("Project Number"; Rec."Project Number")
                {
                    ToolTip = 'Specifies the value of the Project Number field.', Comment = '%';
                    StyleExpr = StyleExprTxt;
                }
                field("Job Number"; Rec."Job Number")
                {
                    ToolTip = 'Specifies the value of the Job Number field.', Comment = '%';
                    StyleExpr = StyleExprTxt;
                }

                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.', Comment = '%';
                    StyleExpr = StyleExprTxt;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.', Comment = '%';
                    StyleExpr = StyleExprTxt;
                }
                field("Global Dimension 3 Code"; Rec."Global Dimension 3 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 3 Code field.', Comment = '%';
                    StyleExpr = StyleExprTxt;
                }
                field("Global Dimension 4 Code"; Rec."Global Dimension 4 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 4 Code field.', Comment = '%';
                    StyleExpr = StyleExprTxt;
                }
                field("Global Dimension 5 Code"; Rec."Global Dimension 5 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 5 Code field.', Comment = '%';
                    StyleExpr = StyleExprTxt;
                }
                field("Global Dimension 6 Code"; Rec."Global Dimension 6 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 6 Code field.', Comment = '%';
                    StyleExpr = StyleExprTxt;
                }
                field("Global Dimension 7 Code"; Rec."Global Dimension 7 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 7 Code field.', Comment = '%';
                    StyleExpr = StyleExprTxt;
                }
                field("Global Dimension 8 Code"; Rec."Global Dimension 8 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 8 Code field.', Comment = '%';
                    StyleExpr = StyleExprTxt;
                }
            }
        }
    }

    actions
    {
        // Add actions here if needed
    }

    procedure ApplytheFilters(ProjectFilter: text; JobFilter: text; GLAccountFilter: Text; Dim1: Code[20]
    ; Dim2: Code[20]; Dim3: Code[20]; Dim4: Code[20]; Dim5: Code[20]; Dim6: Code[20]; Dim7: Code[20]; Dim8: Code[20]; AccTypeFilter: Enum "SIGMA G/L Account Type")
    var
    begin
        Rec.SetFilter("Project Number", ProjectFilter);
        Rec.SetFilter("Job Number", JobFilter);
        Rec.SetFilter("G/L Account No.", GLAccountFilter);
        Rec.SetFilter("Global Dimension 1 Code", Dim1);
        Rec.SetFilter("Global Dimension 2 Code", Dim2);
        Rec.SetFilter("Global Dimension 3 Code", Dim3);
        Rec.SetFilter("Global Dimension 4 Code", Dim4);
        Rec.SetFilter("Global Dimension 5 Code", Dim5);
        Rec.SetFilter("Global Dimension 6 Code", Dim6);
        Rec.SetFilter("Global Dimension 7 Code", Dim7);
        Rec.SetFilter("Global Dimension 8 Code", Dim8);
        IF AccTypeFilter <> AccTypeFilter::" " then
            Rec.SetFilter("G/L Account Type", '%1', AccTypeFilter) else
            Rec.SetRange("G/L Account Type");

        CurrPage.Update(true);
        //  rec.SetFilter("Project Number", ProjectFilter);
    end;

    trigger OnAfterGetRecord()
    var

    begin

        GetStyle();
        BudgetControl.UpdateRemainingAmountonBudget(Rec);
    end;

    Local procedure GetStyle()
    var
    begin
        IF rec."G/L Account Type" <> Rec."G/L Account Type"::Posting then
            StyleExprTxt := 'Strong'
        else
            StyleExprTxt := 'None'
    end;



    var
        StyleExprTxt: text;
        BudgetControl: Codeunit "Budget Control";
}