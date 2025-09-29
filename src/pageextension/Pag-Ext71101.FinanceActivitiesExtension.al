pageextension 71101 "Finance Activities Extension" extends "Accountant Activities"
{
    layout
    {
        addafter(Payments)
        {
            cuegroup("Bank Guarantee")
            {

                // Adding Bank Guarantee fields to the Finance Activities section
                field("Bank Guarantee Released"; Rec."Bank Guarantee Released")
                {
                    ApplicationArea = All;
                    Caption = 'Released';

                    ToolTip = 'Number of Released Bank Guarantees';
                }

                field("Bank Guarantee Closed"; Rec."Bank Guarantee Closed")
                {
                    ApplicationArea = All;
                    Caption = 'Closed';

                    ToolTip = 'Number of Closed Bank Guarantees';
                }

                field("Bank Guarantee Fully Utilized"; Rec."Bank Guarantee Fully Utilized")
                {
                    ApplicationArea = All;
                    Caption = 'Fully Utilized';

                    ToolTip = 'Number of Fully Utilized Bank Guarantees';
                }
            }

            // Adding Letter of Credit fields to the Finance Activities section
            cuegroup("Letter of Credit")
            {
                field("Letter of Credit Released"; Rec."Letter of Credit Released")
                {
                    ApplicationArea = All;
                    Caption = 'Released';

                    ToolTip = 'Number of Released Letters of Credit';
                }

                field("Letter of Credit Closed"; Rec."Letter of Credit Closed")
                {
                    ApplicationArea = All;
                    Caption = 'Closed';

                    ToolTip = 'Number of Closed Letters of Credit';
                }

                field("Letter of Credit Fully Utilized"; Rec."LC Fully Utilized")
                {
                    ApplicationArea = All;
                    Caption = 'Fully Utilized';

                    ToolTip = 'Number of Fully Utilized Letters of Credit';
                }
            }
        }
    }

    actions
    {

    }
}
