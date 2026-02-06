codeunit 71100 "SIGMA Finance Subs"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", OnBeforeInsertGlEntry, '', true, true)]
    local procedure OnBeforeInsertGlEntry(var GenJnlLine: Record "Gen. Journal Line"; var GLEntry: Record "G/L Entry"; var IsHandled: Boolean)
    begin
        GLEntry."Journal Type" := GenJnlLine."Journal Type";
    end;



    var
        myInt: Integer;
}