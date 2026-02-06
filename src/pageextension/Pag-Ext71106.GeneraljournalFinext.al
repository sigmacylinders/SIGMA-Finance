pageextension 71106 "General journal Fin ext" extends "General Journal"
{
    layout
    {
        // Add changes to page layout here
        addafter("Posting Date")
        {
            field("Journal Type"; Rec."Journal Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Journal Type field.', Comment = '%';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}