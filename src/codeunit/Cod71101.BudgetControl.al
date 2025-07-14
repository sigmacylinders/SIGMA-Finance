codeunit 71101 "Budget Control"
{
    Subtype = Normal;

    trigger OnRun()
    begin
        // Add your code here



    end;


    procedure UpdatePostedBudgetValues(Var GenjournalLine: Record "Gen. Journal Line")
    var
        GLBudgetEntry: Record "G/L Budget Entry";
        GLBudgetName: Record "G/L Budget Name";
        GLPostedEntry: Record "Budget Entry";
        GLEntry: Record "G/L Entry";
    begin
        Clear(GLPostedEntry);
        if GLPostedEntry.FindFirst() then
            repeat
                Clear(GLEntry);
                IF GLPostedEntry."G/L Account Type" = GLPostedEntry."G/L Account Type"::Posting then
                    GLEntry.SetRange("G/L Account No.", GLPostedEntry."G/L Account No.");

                IF GLPostedEntry."G/L Account Type" <> GLPostedEntry."G/L Account Type"::Posting then
                    GLEntry.SetFilter("G/L Account No.", '6*');



                IF GLPostedEntry."Project Number" <> '' then
                    GLEntry.SetRange("Job No.", GLPostedEntry."Project Number");
                IF GLPostedEntry."Global Dimension 1 Code" <> '' then
                    GLEntry.SetRange("Global Dimension 1 Code", GLPostedEntry."Global Dimension 1 Code");
                IF GLPostedEntry."Global Dimension 2 Code" <> '' then
                    GLEntry.SetRange("Global Dimension 2 Code", GLPostedEntry."Global Dimension 2 Code");
                IF GLPostedEntry."Global Dimension 3 Code" <> '' then
                    GLEntry.SetRange("Shortcut Dimension 3 Code", GLPostedEntry."Global Dimension 3 Code");
                IF GLPostedEntry."Global Dimension 4 Code" <> '' then
                    GLEntry.SetRange("Shortcut Dimension 4 Code", GLPostedEntry."Global Dimension 4 Code");
                IF GLPostedEntry."Global Dimension 5 Code" <> '' then
                    GLEntry.SetRange("Shortcut Dimension 5 Code", GLPostedEntry."Global Dimension 5 Code");
                IF GLPostedEntry."Global Dimension 6 Code" <> '' then
                    GLEntry.SetRange("Shortcut Dimension 6 Code", GLPostedEntry."Global Dimension 6 Code");
                IF GLPostedEntry."Global Dimension 7 Code" <> '' then
                    GLEntry.SetRange("Shortcut Dimension 7 Code", GLPostedEntry."Global Dimension 7 Code");
                IF GLPostedEntry."Global Dimension 8 Code" <> '' then
                    GLEntry.SetRange("Shortcut Dimension 8 Code", GLPostedEntry."Global Dimension 8 Code");
                IF GLPostedEntry."Project Number" <> '' then
                    GLEntry.SetRange("Job No.", GLPostedEntry."Project Number");

                IF (GLPostedEntry."Starting Date" <> 0D) AND (GLPostedEntry."Ending Date" <> 0D) then
                    GLEntry.SetRange("Posting Date", GLPostedEntry."Starting Date", GLPostedEntry."Ending Date");

                GLEntry.CalcSums(amount);
                IF GLEntry."Amount" <> 0 then begin

                    GLPostedEntry."Posted Entries Amount" := GLEntry.Amount;
                    GLPostedEntry."Remaining Budget Amount" := GLPostedEntry."Budgeted Amount" - GLEntry.Amount;
                    GLBudgetEntry.Modify(true);

                end;
            until GLPostedEntry.Next() = 0;
        // GLPostedEntry.setrange("G/L Account type", GLPostedEntry."G/L Account Type"::Posting);
        Clear(GLEntry);

    end;

    procedure IsDateInRange(CheckDate: Date; StartDate: Date; EndDate: Date): Boolean
    begin
        exit((CheckDate >= StartDate) and (CheckDate <= EndDate));
    end;

    procedure ReadExcelSheet()
    var
        FileMgt: Codeunit "File Management";
        IStream: InStream;
        FromFile: Text[100];
    begin
        UploadIntoStream(UploadExcelMsg, '', '', FromFile, IStream);
        if FromFile <> '' then begin
            FileName := FileMgt.GetFileName(FromFile);
            SheetName := TempExcelBuffer.SelectSheetsNameStream(IStream);
        end else
            Error(NoFileFoundMsg);
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.OpenBookStream(IStream, SheetName);
        TempExcelBuffer.ReadSheet();
    end;

    procedure ImportExcelData()
    var
        //       POImportBuffer: Record "PO Import Buffer";
        BudgetImportBuffer: Record "Budget Import Buffer";
        RowNo: Integer;
        ColNo: Integer;
        LineNo: Integer;
        MaxRowNo: Integer;
    begin
        Clear(BudgetImportBuffer);
        BudgetImportBuffer.DeleteAll();
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        LineNo := 0;
        BudgetImportBuffer.Reset();
        TempExcelBuffer.Reset();
        if TempExcelBuffer.FindLast() then begin
            MaxRowNo := TempExcelBuffer."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            // LineNo := LineNo + 10000;
            // IF GetValueAtCell(RowNo, 34) = 'TRUE' then begin
            BudgetImportBuffer.Init();
            BudgetImportBuffer."Entry No." := RowNo;
            if GetValueAtCell(RowNo, 1) <> '' then
                BudgetImportBuffer."G/L Account No." := GetValueAtCell(RowNo, 1);
            if GetValueAtCell(RowNo, 2) <> '' then
                BudgetImportBuffer."Global Dimension 1 Code" := GetValueAtCell(RowNo, 2);
            if GetValueAtCell(RowNo, 3) <> '' then
                BudgetImportBuffer."Global Dimension 2 Code" := GetValueAtCell(RowNo, 3);
            if GetValueAtCell(RowNo, 4) <> '' then
                Evaluate(BudgetImportBuffer."Budgeted Amount", GetValueAtCell(RowNo, 4));
            if GetValueAtCell(RowNo, 5) <> '' then
                BudgetImportBuffer.Description := GetValueAtCell(RowNo, 5);
            if GetValueAtCell(RowNo, 6) <> '' then
                BudgetImportBuffer."Project Number" := GetValueAtCell(RowNo, 6);
            if GetValueAtCell(RowNo, 7) <> '' then
                BudgetImportBuffer."Global Dimension 3 Code" := GetValueAtCell(RowNo, 7);
            if GetValueAtCell(RowNo, 8) <> '' then
                BudgetImportBuffer."Global Dimension 4 Code" := GetValueAtCell(RowNo, 8);
            if GetValueAtCell(RowNo, 9) <> '' then
                BudgetImportBuffer."Global Dimension 5 Code" := GetValueAtCell(RowNo, 9);
            if GetValueAtCell(RowNo, 10) <> '' then
                BudgetImportBuffer."Global Dimension 6 Code" := GetValueAtCell(RowNo, 10);
            if GetValueAtCell(RowNo, 11) <> '' then
                BudgetImportBuffer."Global Dimension 7 Code" := GetValueAtCell(RowNo, 11);
            if GetValueAtCell(RowNo, 12) <> '' then
                BudgetImportBuffer."Global Dimension 8 Code" := GetValueAtCell(RowNo, 12);
            if GetValueAtCell(RowNo, 13) <> '' then
                BudgetImportBuffer."Job Number" := GetValueAtCell(RowNo, 13);

            BudgetImportBuffer.Insert();
        end;
        Message(ExcelImportSucess);
    end;

    procedure InsertBudgetEntries(BudgetName: Code[20])
    var
        BudgetImportBuffer: Record "Budget Import Buffer";
        BudgetEntry: Record "Budget Entry";
        GLAccount: Record "G/L Account";
        BudgetNameRec: Record "SIGMA Budget";
        Job: Record Job;

    begin
        Clear(BudgetImportBuffer);
        if BudgetImportBuffer.FindSet() then
            repeat
                Clear(BudgetEntry);
                BudgetEntry.Init();
                BudgetEntry."Budget Name" := BudgetName;
                BudgetEntry."G/L Account No." := BudgetImportBuffer."G/L Account No.";
                IF BudgetImportBuffer."G/L Account No." <> '' then begin
                    GLAccount.Get(BudgetImportBuffer."G/L Account No.");
                    BudgetEntry.Description := GLAccount.Name;
                    IF GLAccount."Account Type" = GLAccount."Account Type"::Posting then
                        BudgetEntry."G/L Account Type" := BudgetEntry."G/L Account Type"::Posting;

                    IF GLAccount."Account Type" = GLAccount."Account Type"::Total then
                        BudgetEntry."G/L Account Type" := BudgetEntry."G/L Account Type"::Total;

                    IF GLAccount."Account Type" = GLAccount."Account Type"::"End-Total" then
                        BudgetEntry."G/L Account Type" := BudgetEntry."G/L Account Type"::"End-Total";

                    IF GLAccount."Account Type" = GLAccount."Account Type"::"Begin-Total" then
                        BudgetEntry."G/L Account Type" := BudgetEntry."G/L Account Type"::"Begin-Total";

                    IF GLAccount."Account Type" = GLAccount."Account Type"::Heading then
                        BudgetEntry."G/L Account Type" := BudgetEntry."G/L Account Type"::Heading;
                end;
                //  BudgetEntry."G/L Account Type" := BudgetImportBuffer."G/L Account Type";
                BudgetEntry."Global Dimension 1 Code" := BudgetImportBuffer."Global Dimension 1 Code";
                BudgetEntry."Global Dimension 2 Code" := BudgetImportBuffer."Global Dimension 2 Code";
                BudgetEntry."Global Dimension 3 Code" := BudgetImportBuffer."Global Dimension 3 Code";

                BudgetEntry."Global Dimension 4 Code" := BudgetImportBuffer."Global Dimension 4 Code";
                BudgetEntry."Global Dimension 5 Code" := BudgetImportBuffer."Global Dimension 5 Code";
                BudgetEntry."Global Dimension 6 Code" := BudgetImportBuffer."Global Dimension 6 Code";
                BudgetEntry."Global Dimension 7 Code" := BudgetImportBuffer."Global Dimension 7 Code";
                BudgetEntry."Global Dimension 8 Code" := BudgetImportBuffer."Global Dimension 8 Code";
                BudgetEntry."Job Number" := BudgetImportBuffer."Job Number";
                BudgetEntry."Project Number" := BudgetImportBuffer."Project Number";
                if Job.Get(BudgetImportBuffer."Job Number") then
                    BudgetEntry.Description := Job.Description;
                Clear(BudgetNameRec);
                BudgetNameRec.Get(BudgetName);
                BudgetEntry."Starting Date" := BudgetNameRec."StartingDate";
                BudgetEntry."Ending Date" := BudgetNameRec."EndingDate";
                BudgetEntry."Budgeted Amount" := BudgetImportBuffer."Budgeted Amount";
                BudgetEntry.Date := Today;
                BudgetEntry."User ID" := UserId;
                BudgetEntry."Budgeted Amount" := BudgetImportBuffer."Budgeted Amount";
                BudgetEntry.insert(true);


                UpdateRemainingAmountonBudget(BudgetEntry);

            until BudgetImportBuffer.Next() = 0;
    end;

    procedure GetValueAtCell(RowNo: Integer;
        ColNo: Integer): Text
    begin

        TempExcelBuffer.Reset();
        If TempExcelBuffer.Get(RowNo, ColNo) then
            exit(TempExcelBuffer."Cell Value as Text")
        else
            exit('');
    end;

    local procedure InsertBudgetData()
    var
    begin

    end;

    procedure LookupPostedEntries(BudgetEntry: Record "Budget Entry")

    var
        GLEntry: Record "G/L Entry";
    begin
        Clear(GLEntry);
        IF BudgetEntry."G/L Account Type" = BudgetEntry."G/L Account Type"::Posting then
            GLEntry.SetRange("G/L Account No.", BudgetEntry."G/L Account No.");

        IF BudgetEntry."G/L Account Type" in ["SIGMA G/L Account Type"::Total, "SIGMA G/L Account Type"::"End-Total"] then
            GLEntry.SetFilter("G/L Account No.", BudgetEntry.totaling);

        IF (BudgetEntry."Project Number" <> '') AND (BudgetEntry."G/L Account No." = '') then
            GLEntry.SetFilter("G/L Account No.", '6*');

        IF BudgetEntry."Project Number" <> '' then
            GLEntry.SetRange("Job No.", BudgetEntry."Project Number");
        IF BudgetEntry."Global Dimension 1 Code" <> '' then
            GLEntry.SetRange("Global Dimension 1 Code", BudgetEntry."Global Dimension 1 Code");
        IF BudgetEntry."Global Dimension 2 Code" <> '' then
            GLEntry.SetRange("Global Dimension 2 Code", BudgetEntry."Global Dimension 2 Code");
        IF BudgetEntry."Global Dimension 3 Code" <> '' then
            GLEntry.SetRange("Shortcut Dimension 3 Code", BudgetEntry."Global Dimension 3 Code");
        IF BudgetEntry."Global Dimension 4 Code" <> '' then
            GLEntry.SetRange("Shortcut Dimension 4 Code", BudgetEntry."Global Dimension 4 Code");
        IF BudgetEntry."Global Dimension 5 Code" <> '' then
            GLEntry.SetRange("Shortcut Dimension 5 Code", BudgetEntry."Global Dimension 5 Code");
        IF BudgetEntry."Global Dimension 6 Code" <> '' then
            GLEntry.SetRange("Shortcut Dimension 6 Code", BudgetEntry."Global Dimension 6 Code");
        IF BudgetEntry."Global Dimension 7 Code" <> '' then
            GLEntry.SetRange("Shortcut Dimension 7 Code", BudgetEntry."Global Dimension 7 Code");
        IF BudgetEntry."Global Dimension 8 Code" <> '' then
            GLEntry.SetRange("Shortcut Dimension 8 Code", BudgetEntry."Global Dimension 8 Code");
        IF BudgetEntry."Project Number" <> '' then
            GLEntry.SetRange("Job No.", BudgetEntry."Project Number");

        IF (BudgetEntry."Starting Date" <> 0D) AND (BudgetEntry."Ending Date" <> 0D) then
            GLEntry.SetRange("Posting Date", BudgetEntry."Starting Date", BudgetEntry."Ending Date");

        Page.Run(page::"General Ledger Entries", GLEntry);
    end;

    Procedure CalcAmountsAfterValidateTotaling(Var BudgetEntry: Record "Budget Entry")
    var
        BudgetEntryPosting: Record "Budget Entry";
    begin

        Clear(BudgetEntryPosting);
        BudgetEntryPosting.SetRange("Budget Name", BudgetEntry."Budget Name");

        BudgetEntryPosting.SetRange("G/L Account Type", BudgetEntryPosting."G/L Account Type"::Posting);
        BudgetEntryPosting.SetFilter("G/L Account No.", BudgetEntry.Totaling);


        IF BudgetEntry."Project Number" <> '' then
            BudgetEntryPosting.SetRange("Project Number", BudgetEntry."Project Number");

        IF BudgetEntry."Global Dimension 1 Code" <> '' then
            BudgetEntryPosting.SetRange("Global Dimension 1 Code", BudgetEntry."Global Dimension 1 Code");

        IF BudgetEntry."Global Dimension 2 Code" <> '' then
            BudgetEntryPosting.SetRange("Global Dimension 2 Code", BudgetEntry."Global Dimension 2 Code");

        IF BudgetEntry."Global Dimension 3 Code" <> '' then
            BudgetEntryPosting.SetRange("Global Dimension 3 Code", BudgetEntry."Global Dimension 3 Code");

        IF BudgetEntry."Global Dimension 4 Code" <> '' then
            BudgetEntryPosting.SetRange("Global Dimension 4 Code", BudgetEntry."Global Dimension 4 Code");

        IF BudgetEntry."Global Dimension 5 Code" <> '' then
            BudgetEntryPosting.SetRange("Global Dimension 5 Code", BudgetEntry."Global Dimension 5 Code");

        IF BudgetEntry."Global Dimension 6 Code" <> '' then
            BudgetEntryPosting.SetRange("Global Dimension 6 Code", BudgetEntry."Global Dimension 6 Code");

        IF BudgetEntry."Global Dimension 7 Code" <> '' then
            BudgetEntryPosting.SetRange("Global Dimension 7 Code", BudgetEntry."Global Dimension 7 Code");

        IF BudgetEntry."Global Dimension 8 Code" <> '' then
            BudgetEntryPosting.SetRange("Global Dimension 8 Code", BudgetEntry."Global Dimension 8 Code");

        IF BudgetEntry."Job Number" <> '' then
            BudgetEntryPosting.SetRange("Job Number", BudgetEntry."Job Number");

        BudgetEntryPosting.CalcSums("Budgeted Amount", "Posted Entries Amount");
        BudgetEntry."Budgeted Amount" := BudgetEntryPosting."Budgeted Amount";
        BudgetEntry."Posted Entries Amount" := BudgetEntryPosting."Posted Entries Amount";
        BudgetEntry."Remaining Budget Amount" := BudgetEntry."Budgeted Amount" - BudgetEntry."Posted Entries Amount";
        BudgetEntry.Modify();
    end;

    procedure Checkbudget(GenJournal: Record "Gen. Journal Line")
    var
        BudgetEntry: Record "Budget Entry";
        GLEntry: Record "G/L Entry";
    begin
        //GL budget
        GenJournal.CalcFields("Shortcut Dimension 3 Code", "Shortcut Dimension 4 Code", "Shortcut Dimension 5 Code",
        "Shortcut Dimension 6 Code", "Shortcut Dimension 7 Code", "Shortcut Dimension 8 Code");

        Clear(BudgetEntry);

        IF GenJournal."Job No." <> '' then
            BudgetEntry.SetFilter("Project Number", GenJournal."Job No.");

        IF GenJournal."Posting Date" <> 0D then begin
            BudgetEntry.SetFilter("Starting Date", '<= %1', GenJournal."Posting Date");
            BudgetEntry.SetFilter("Ending Date", '>= %1', GenJournal."Posting Date");
        end;
        IF GenJournal."Account No." <> '' then begin
            BudgetEntry.SetRange("G/L Account Type", BudgetEntry."G/L Account Type"::Posting);
            BudgetEntry.SetRange("G/L Account No.", GenJournal."Account No.");
        end;

        // IF GenJournal."Shortcut Dimension 1 Code" <> '' then
        //     BudgetEntry.SetRange("Global Dimension 1 Code", GenJournal."Shortcut Dimension 1 Code");

        // IF GenJournal."Shortcut Dimension 2 Code" <> '' then
        //     BudgetEntry.SetRange("Global Dimension 2 Code", GenJournal."Shortcut Dimension 2 Code");

        // IF GenJournal."Shortcut Dimension 3 Code" <> '' then
        //     BudgetEntry.SetRange("Global Dimension 3 Code", GenJournal."Shortcut Dimension 3 Code");

        // IF GenJournal."Shortcut Dimension 4 Code" <> '' then
        //     BudgetEntry.SetRange("Global Dimension 4 Code", GenJournal."Shortcut Dimension 4 Code");

        IF GenJournal."Shortcut Dimension 5 Code" <> '' then
            BudgetEntry.SetRange("Global Dimension 5 Code", GenJournal."Shortcut Dimension 5 Code");

        // IF GenJournal."Shortcut Dimension 6 Code" <> '' then
        //     BudgetEntry.SetRange("Global Dimension 6 Code", GenJournal."Shortcut Dimension 6 Code");

        // IF GenJournal."Shortcut Dimension 7 Code" <> '' then
        //     BudgetEntry.SetRange("Global Dimension 7 Code", GenJournal."Shortcut Dimension 7 Code");

        // IF GenJournal."Shortcut Dimension 8 Code" <> '' then
        //     BudgetEntry.SetRange("Global Dimension 8 Code", GenJournal."Shortcut Dimension 8 Code");

        IF BudgetEntry.FindFirst() then begin
            IF BudgetEntry."Remaining Budget Amount" < GenJournal."Amount (LCY)" then begin
                Error(StrSubstNo(Text001, BudgetEntry."Remaining Budget Amount", GenJournal."Amount (LCY)"));
            end;
        end;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", OnBeforePostGLAcc, '', false, false)]
    local procedure OnBeforePostGLAcc(GenJournalLine: Record "Gen. Journal Line"; var GLEntry: Record "G/L Entry"; var GLEntryNo: Integer; var IsHandled: Boolean; var TempGLEntryBuf: Record "G/L Entry" temporary)
    begin
        Checkbudget(GenJournalLine);
    end;

    procedure UpdateRemainingAmountonBudget(var BudgetEntry: Record "Budget Entry")
    var
        GLEntry: Record "G/L Entry";
    begin
        Clear(GLEntry);
        IF BudgetEntry."G/L Account Type" = BudgetEntry."G/L Account Type"::Posting then
            GLEntry.SetRange("G/L Account No.", BudgetEntry."G/L Account No.");

        IF BudgetEntry."G/L Account Type" in ["SIGMA G/L Account Type"::Total, "SIGMA G/L Account Type"::"End-Total"] then
            GLEntry.SetFilter("G/L Account No.", BudgetEntry.totaling);

        IF (BudgetEntry."Project Number" <> '') AND (BudgetEntry."G/L Account No." = '') then
            GLEntry.SetFilter("G/L Account No.", '6*');

        IF BudgetEntry."Project Number" <> '' then
            GLEntry.SetRange("Job No.", BudgetEntry."Project Number");

        IF BudgetEntry."Global Dimension 1 Code" <> '' then
            GLEntry.SetRange("Global Dimension 1 Code", BudgetEntry."Global Dimension 1 Code");
        IF BudgetEntry."Global Dimension 2 Code" <> '' then
            GLEntry.SetRange("Global Dimension 2 Code", BudgetEntry."Global Dimension 2 Code");
        IF BudgetEntry."Global Dimension 3 Code" <> '' then
            GLEntry.SetRange("Shortcut Dimension 3 Code", BudgetEntry."Global Dimension 3 Code");
        IF BudgetEntry."Global Dimension 4 Code" <> '' then
            GLEntry.SetRange("Shortcut Dimension 4 Code", BudgetEntry."Global Dimension 4 Code");
        IF BudgetEntry."Global Dimension 5 Code" <> '' then
            GLEntry.SetRange("Shortcut Dimension 5 Code", BudgetEntry."Global Dimension 5 Code");
        IF BudgetEntry."Global Dimension 6 Code" <> '' then
            GLEntry.SetRange("Shortcut Dimension 6 Code", BudgetEntry."Global Dimension 6 Code");
        IF BudgetEntry."Global Dimension 7 Code" <> '' then
            GLEntry.SetRange("Shortcut Dimension 7 Code", BudgetEntry."Global Dimension 7 Code");
        IF BudgetEntry."Global Dimension 8 Code" <> '' then
            GLEntry.SetRange("Shortcut Dimension 8 Code", BudgetEntry."Global Dimension 8 Code");
        IF BudgetEntry."Project Number" <> '' then
            GLEntry.SetRange("Job No.", BudgetEntry."Project Number");

        IF (BudgetEntry."Starting Date" <> 0D) AND (BudgetEntry."Ending Date" <> 0D) then
            GLEntry.SetRange("Posting Date", BudgetEntry."Starting Date", BudgetEntry."Ending Date");

        GLEntry.CalcSums(amount);
        IF GLEntry."Amount" <> 0 then begin
            BudgetEntry."Posted Entries Amount" := GLEntry.Amount;
            BudgetEntry."Remaining Budget Amount" := BudgetEntry."Budgeted Amount" - GLEntry.Amount;
            BudgetEntry.Modify(true);
        end;
    end;

    var
        FileName: Text[100];
        SheetName: Text[100];

        TempExcelBuffer: Record "Excel Buffer" temporary;
        UploadExcelMsg: Label 'Please Choose the Excel file.';
        NoFileFoundMsg: Label 'No Excel file found!';
        BatchISBlankMsg: Label 'Batch name is blank';
        ExcelImportSucess: Label 'Excel is successfully imported.';
        Text001: Label 'Remaining Budget %1 does not cover the Cost %2';
    // Add your methods here
}