page 71101 "LC Card"
{
    PageType = Card;
    SourceTable = "LC Header";
    ApplicationArea = All;


    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.") { }

                field(Description; REc.Description) { }
                field("Transaction Type"; Rec."Transaction Type") { }
                field("Issued To/Received From"; Rec."Issued To/Received From") { }
                field("Issuing Bank"; Rec."Issuing Bank") { }
                field("Receiving Bank"; Rec."Receiving Bank") { }
                field(Released; Rec.Released) { }
                field(Closed; Rec.Closed) { }

                field("Date of Issue"; Rec."Date of Issue") { }
                field("Expiry Date"; Rec."Expiry Date") { }
                field("Type of LC"; Rec."Type of LC") { }
                field("Type of Credit Limit"; Rec."Type of Credit Limit") { }
                field("Revolving Cr. Limit Types"; Rec."Revolving Cr. Limit Types") { }
                field("Currency Code"; Rec."Currency Code") { }
                field("Exchange Rate"; Rec."Exchange Rate") { }

            }

            group(Invoicing)
            {
                field("Value Utilised"; Rec."Value Utilised") { }
                field("Remaining Amount"; Rec."Remaining Amount") { }
                field("LC Value LCY"; Rec."LC Value") { }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Release LC")
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Rec.Released := true;
                    Rec.Modify(true);
                end;
            }
        }
    }
}
