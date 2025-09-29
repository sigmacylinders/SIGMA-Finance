page 71100 "LC List"
{
    PageType = List;
    SourceTable = "LC Header";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.") { }
                field("LC No."; Rec."LC No.") { }
                field(Description; Rec.Description) { }
                field("Transaction Type"; Rec."Transaction Type") { }
                field("Issuing Bank"; Rec."Issuing Bank") { }
                field("Receiving Bank"; Rec."Receiving Bank") { }
                field("Date of Issue"; Rec."Date of Issue") { }
                field("Expiry Date"; Rec."Expiry Date") { }
                field("Type of LC"; Rec."Type of LC") { }
                field("LC Value"; Rec."LC Value") { }
                field(Released; Rec.Released) { }
                field(Closed; Rec.Closed) { }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Open LC Card")
            {
                ApplicationArea = All;
                RunObject = Page "LC Card";
                RunPageLink = "No." = FIELD("No.");
            }
        }
    }
}
