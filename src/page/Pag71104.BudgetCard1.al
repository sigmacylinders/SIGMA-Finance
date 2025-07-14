page 71104 "Budget Card1"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "SIGMA Budget";
    Caption = 'Budget Card';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Budget Code"; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Start Date"; Rec.StartingDate)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    var
                        BudgetEntries: Record "Budget Entry";
                    begin
                        Clear(BudgetEntries);
                        BudgetEntries.SetRange("Budget Name", Rec.Name);
                        BudgetEntries.ModifyAll("Starting Date", Rec.StartingDate);
                    end;
                }
                field("End Date"; Rec.EndingDate)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        BudgetEntries: Record "Budget Entry";
                    begin
                        Clear(BudgetEntries);
                        BudgetEntries.SetRange("Budget Name", Rec.Name);
                        BudgetEntries.ModifyAll("Ending Date", Rec.EndingDate);
                    end;
                }
                field(Blocked; Rec.Blocked)
                {
                    ToolTip = 'Specifies the value of the Blocked field.', Comment = '%';
                }

            }

            part(Budgetmatrix; "SIGMA Budget Matrix")
            {
                ApplicationArea = All;
                Caption = 'Budget Matrix';
                SubPageLink = "Budget Name" = field("Name");
                UpdatePropagation = Both;

            }
            group("Filters")
            {
                field("G/L Account Type Filter"; Rec."G/L Account Type Filter")
                {
                    ToolTip = 'Specifies the value of the G/L Account Type Filter field.', Comment = '%';
                    trigger OnValidate()
                    var
                    begin
                        CurrPage.Budgetmatrix.Page.ApplytheFilters(
                            Rec.ProjectFilter,
                            Rec.JobNumberFilter,
                            Rec.GLAccountFilter,
                            Rec."Global Dimension 1 Code",
                            Rec."Global Dimension 2 Code",
                            Rec."Global Dimension 3 Code",
                            Rec."Global Dimension 4 Code",
                            Rec."Global Dimension 5 Code",
                            Rec."Global Dimension 6 Code",
                            Rec."Global Dimension 7 Code",
                            Rec."Global Dimension 8 Code",
                             Rec."G/L Account Type Filter"
                        );

                    end;
                }


                field(GLAccountFilter; Rec.GLAccountFilter)
                {
                    ToolTip = 'Specifies the value of the G/L Account Filter field.', Comment = '%';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        GLAccList: Page "G/L Account List";
                    begin
                        GLAccList.LookupMode(true);
                        if not (GLAccList.RunModal() = ACTION::LookupOK) then
                            exit(false);

                        Text := GLAccList.GetSelectionFilter();
                        exit(true);
                    end;

                    trigger OnValidate()
                    var
                    begin
                        CurrPage.Budgetmatrix.Page.ApplytheFilters(
                            Rec.ProjectFilter,
                            Rec.JobNumberFilter,
                            Rec.GLAccountFilter,
                            Rec."Global Dimension 1 Code",
                            Rec."Global Dimension 2 Code",
                            Rec."Global Dimension 3 Code",
                            Rec."Global Dimension 4 Code",
                            Rec."Global Dimension 5 Code",
                            Rec."Global Dimension 6 Code",
                            Rec."Global Dimension 7 Code",
                            Rec."Global Dimension 8 Code",
                            Rec."G/L Account Type Filter"
                        );

                    end;
                }
                field(ProjectFilter; Rec.ProjectFilter)
                {
                    ToolTip = 'Specifies the value of the Project Filter field.', Comment = '%';

                    trigger OnValidate()
                    var
                    begin
                        CurrPage.Budgetmatrix.Page.ApplytheFilters(
                            Rec.ProjectFilter,
                            Rec.JobNumberFilter,
                            Rec.GLAccountFilter,
                            Rec."Global Dimension 1 Code",
                            Rec."Global Dimension 2 Code",
                            Rec."Global Dimension 3 Code",
                            Rec."Global Dimension 4 Code",
                            Rec."Global Dimension 5 Code",
                            Rec."Global Dimension 6 Code",
                            Rec."Global Dimension 7 Code",
                            Rec."Global Dimension 8 Code",
                             Rec."G/L Account Type Filter"
                        );

                    end;
                }
                field(JobNumberFilter; Rec.JobNumberFilter)
                {
                    ToolTip = 'Specifies the value of the Job Number Filter field.', Comment = '%';
                    trigger OnValidate()
                    var
                    begin
                        CurrPage.Budgetmatrix.Page.ApplytheFilters(
                            Rec.ProjectFilter,
                            Rec.JobNumberFilter,
                            Rec.GLAccountFilter,
                            Rec."Global Dimension 1 Code",
                            Rec."Global Dimension 2 Code",
                            Rec."Global Dimension 3 Code",
                            Rec."Global Dimension 4 Code",
                            Rec."Global Dimension 5 Code",
                            Rec."Global Dimension 6 Code",
                            Rec."Global Dimension 7 Code",
                            Rec."Global Dimension 8 Code",
                             Rec."G/L Account Type Filter"
                        );

                    end;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 1 Filter field.', Comment = '%';
                    trigger OnValidate()
                    var
                    begin
                        CurrPage.Budgetmatrix.Page.ApplytheFilters(
                            Rec.ProjectFilter,
                            Rec.JobNumberFilter,
                            Rec.GLAccountFilter,
                            Rec."Global Dimension 1 Code",
                            Rec."Global Dimension 2 Code",
                            Rec."Global Dimension 3 Code",
                            Rec."Global Dimension 4 Code",
                            Rec."Global Dimension 5 Code",
                            Rec."Global Dimension 6 Code",
                            Rec."Global Dimension 7 Code",
                            Rec."Global Dimension 8 Code",
                             Rec."G/L Account Type Filter"
                        );

                    end;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 2 Filter field.', Comment = '%';
                    trigger OnValidate()
                    var
                    begin
                        CurrPage.Budgetmatrix.Page.ApplytheFilters(
                            Rec.ProjectFilter,
                            Rec.JobNumberFilter,
                            Rec.GLAccountFilter,
                            Rec."Global Dimension 1 Code",
                            Rec."Global Dimension 2 Code",
                            Rec."Global Dimension 3 Code",
                            Rec."Global Dimension 4 Code",
                            Rec."Global Dimension 5 Code",
                            Rec."Global Dimension 6 Code",
                            Rec."Global Dimension 7 Code",
                            Rec."Global Dimension 8 Code",
                             Rec."G/L Account Type Filter"
                        );

                    end;
                }
                field("Global Dimension 3 Code"; Rec."Global Dimension 3 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 3 Filter field.', Comment = '%';
                    trigger OnValidate()
                    var
                    begin
                        CurrPage.Budgetmatrix.Page.ApplytheFilters(
                            Rec.ProjectFilter,
                            Rec.JobNumberFilter,
                            Rec.GLAccountFilter,
                            Rec."Global Dimension 1 Code",
                            Rec."Global Dimension 2 Code",
                            Rec."Global Dimension 3 Code",
                            Rec."Global Dimension 4 Code",
                            Rec."Global Dimension 5 Code",
                            Rec."Global Dimension 6 Code",
                            Rec."Global Dimension 7 Code",
                            Rec."Global Dimension 8 Code",
                             Rec."G/L Account Type Filter"
                        );

                    end;
                }
                field("Global Dimension 4 Code"; Rec."Global Dimension 4 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 4 Filter field.', Comment = '%';
                    trigger OnValidate()
                    var
                    begin
                        CurrPage.Budgetmatrix.Page.ApplytheFilters(
                            Rec.ProjectFilter,
                            Rec.JobNumberFilter,
                            Rec.GLAccountFilter,
                            Rec."Global Dimension 1 Code",
                            Rec."Global Dimension 2 Code",
                            Rec."Global Dimension 3 Code",
                            Rec."Global Dimension 4 Code",
                            Rec."Global Dimension 5 Code",
                            Rec."Global Dimension 6 Code",
                            Rec."Global Dimension 7 Code",
                            Rec."Global Dimension 8 Code",
                             Rec."G/L Account Type Filter"
                        );

                    end;
                }
                field("Global Dimension 5 Code"; Rec."Global Dimension 5 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 5 Filter field.', Comment = '%';
                    trigger OnValidate()
                    var
                    begin
                        CurrPage.Budgetmatrix.Page.ApplytheFilters(
                            Rec.ProjectFilter,
                            Rec.JobNumberFilter,
                            Rec.GLAccountFilter,
                            Rec."Global Dimension 1 Code",
                            Rec."Global Dimension 2 Code",
                            Rec."Global Dimension 3 Code",
                            Rec."Global Dimension 4 Code",
                            Rec."Global Dimension 5 Code",
                            Rec."Global Dimension 6 Code",
                            Rec."Global Dimension 7 Code",
                            Rec."Global Dimension 8 Code",
                             Rec."G/L Account Type Filter"
                        );

                    end;
                }
                field("Global Dimension 6 Code"; Rec."Global Dimension 6 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 6 Filter field.', Comment = '%';
                    trigger OnValidate()
                    var
                    begin
                        CurrPage.Budgetmatrix.Page.ApplytheFilters(
                            Rec.ProjectFilter,
                            Rec.JobNumberFilter,
                            Rec.GLAccountFilter,
                            Rec."Global Dimension 1 Code",
                            Rec."Global Dimension 2 Code",
                            Rec."Global Dimension 3 Code",
                            Rec."Global Dimension 4 Code",
                            Rec."Global Dimension 5 Code",
                            Rec."Global Dimension 6 Code",
                            Rec."Global Dimension 7 Code",
                            Rec."Global Dimension 8 Code",
                             Rec."G/L Account Type Filter"
                        );

                    end;
                }
                field("Global Dimension 7 Code"; Rec."Global Dimension 7 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 7 Filter field.', Comment = '%';
                    trigger OnValidate()
                    var
                    begin
                        CurrPage.Budgetmatrix.Page.ApplytheFilters(
                            Rec.ProjectFilter,
                            Rec.JobNumberFilter,
                            Rec.GLAccountFilter,
                            Rec."Global Dimension 1 Code",
                            Rec."Global Dimension 2 Code",
                            Rec."Global Dimension 3 Code",
                            Rec."Global Dimension 4 Code",
                            Rec."Global Dimension 5 Code",
                            Rec."Global Dimension 6 Code",
                            Rec."Global Dimension 7 Code",
                            Rec."Global Dimension 8 Code",
                             Rec."G/L Account Type Filter"
                        );

                    end;
                }
                field("Global Dimension 8 Code"; Rec."Global Dimension 8 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 8 Filter field.', Comment = '%';
                    trigger OnValidate()
                    var
                    begin
                        CurrPage.Budgetmatrix.Page.ApplytheFilters(
                            Rec.ProjectFilter,
                            Rec.JobNumberFilter,
                            Rec.GLAccountFilter,
                            Rec."Global Dimension 1 Code",
                            Rec."Global Dimension 2 Code",
                            Rec."Global Dimension 3 Code",
                            Rec."Global Dimension 4 Code",
                            Rec."Global Dimension 5 Code",
                            Rec."Global Dimension 6 Code",
                            Rec."Global Dimension 7 Code",
                            Rec."Global Dimension 8 Code",
                             Rec."G/L Account Type Filter"
                        );

                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Import")
            {
                Caption = '&Import';
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'Import data from excel.';

                trigger OnAction()
                var
                    BudgetControl: Codeunit "Budget Control";
                begin
                    // if BatchName = '' then
                    //     Error(BatchISBlankMsg);
                    BudgetControl.ReadExcelSheet();
                    BudgetControl.ImportExcelData();
                    BudgetControl.InsertBudgetEntries(Rec.Name);
                end;
            }
        }
    }


    var

        FileName: Text[100];
        SheetName: Text[100];

        TempExcelBuffer: Record "Excel Buffer" temporary;
        UploadExcelMsg: Label 'Please Choose the Excel file.';
        NoFileFoundMsg: Label 'No Excel file found!';
        BatchISBlankMsg: Label 'Batch name is blank';
        ExcelImportSucess: Label 'Excel is successfully imported.';
}