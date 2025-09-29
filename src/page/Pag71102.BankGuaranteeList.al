page 71102 "Bank Guarantee List"
{
    PageType = List;
    SourceTable = "Bank Guarantee Header";
    ApplicationArea = All;
    SourceTableView = sorting("BG No.");

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("BG No."; Rec."BG No.")
                {
                    ApplicationArea = All;
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = All;
                }
                field("Date of Issue"; Rec."Date of Issue")
                {
                    ApplicationArea = All;
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = All;
                }
                field("BG Value"; Rec."BG Value")
                {
                    ApplicationArea = All;
                }
                field("Released"; Rec."Released")
                {
                    ApplicationArea = All;
                }
                field("Closed"; Rec."Closed")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Create)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    // Code for creating a new record or handling new entries
                end;
            }
        }
    }
}
