pageextension 71103 "Purchase Order Page Extension" extends "Purchase Order"
{
    layout
    {
        addlast("Invoice Details")
        {
            group("Additional Information")
            {
                field("LC No."; Rec."LC No.")
                {
                    ApplicationArea = All;
                    Caption = 'LC No.';
                }

                field("BG No."; Rec."BG No.")
                {
                    ApplicationArea = All;
                    Caption = 'BG No.';
                }
            }
        }
    }
}
