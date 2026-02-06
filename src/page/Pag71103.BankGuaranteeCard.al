page 71103 "Bank Guarantee Card"
{
    PageType = Card;
    SourceTable = "Bank Guarantee Header";
 // Assuming a table for bank guarantees exists    ApplicationArea = All;


    layout
    {
        area(content)
        {
            group(Group1)
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
                field("Issued To/Received From"; Rec."Issued To/Received From")
                {
                    ApplicationArea = All;
                }
                field("Issuing Bank"; Rec."Issuing Bank")
                {
                    ApplicationArea = All;
                }
                field("Receiving Bank"; Rec."Receiving Bank")
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
                field("Type of BG"; Rec."Type of BG")
                {
                    ApplicationArea = All;
                }
                field("BG Value"; Rec."BG Value")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(navigation)
        {
            // BG Register Action
            action(BGRegister)
            {
                ApplicationArea = All;
                Caption = 'BG Register';
                trigger OnAction()
                var
                // BGRegPage: Page "Bank Guarantee Register"; // Ensure this page exists
                begin
                    //    PAGE.RUN(PAGE::"Bank Guarantee Register");
                end;
            }

            // BG Terms Action
            action(BGTerms)
            {
                ApplicationArea = All;
                Caption = 'BG Terms';
                trigger OnAction()
                var
                //   BGTermsPage: Page "Bank Guarantee Terms"; // Ensure this page exists
                begin
                    //   PAGE.RUN(PAGE::"Bank Guarantee Terms");
                end;
            }

            // Amendments Action
            action(Amendments)
            {
                ApplicationArea = All;
                Caption = 'Amendments';
                trigger OnAction()
                var
                //   AmendmentsPage: Page "Bank Guarantee Amendments"; // Ensure this page exists
                begin
                    // PAGE.RUN(PAGE::"Bank Guarantee Amendments");
                end;
            }

            // Orders Action
            action(Orders)
            {
                ApplicationArea = All;
                Caption = 'Orders';
                trigger OnAction()
                var
                //  OrdersPage: Page "Bank Guarantee Orders"; // Ensure this page exists
                begin
                    //  PAGE.RUN(PAGE::"Bank Guarantee Orders");
                end;
            }

            // Posted Orders Action
            action(PostedOrders)
            {
                ApplicationArea = All;
                Caption = 'Posted Orders';
                trigger OnAction()
                var
                //  PostedOrdersPage: Page "Bank Guarantee Posted Orders"; // Ensure this page exists
                begin
                    //   PAGE.RUN(PAGE::"Bank Guarantee Posted Orders");
                end;
            }
        }
    }




    trigger OnOpenPage()
    var
    // Initialize any necessary variables here if needed
    begin
        // Code for initialization or data fetching can go here
    end;
}
