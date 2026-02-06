pageextension 71104 "GL setup extens2" extends "General Ledger Setup"
{
    layout
    {
        // Add changes to page layout here

        addafter("Transitory No. series")
        {

            field("LC No. Series"; Rec."LC No. Series")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the LC No. Series field.', Comment = '%';
            }
            field("BG No. Series"; Rec."BG No. Series")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the BG No. Series field.', Comment = '%';
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