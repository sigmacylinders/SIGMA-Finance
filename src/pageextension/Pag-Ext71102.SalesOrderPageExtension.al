pageextension 71102 "Sales Order Page Extension" extends "Sales Order"
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
