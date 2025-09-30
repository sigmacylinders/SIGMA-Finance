table 71100 "LC Header"
{
    DataClassification = ToBeClassified;
    LookupPageId = "LC List";
    DrillDownPageId = "LC List";

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(2; "LC No."; Code[20]) { }
        field(3; Description; Text[100]) { }
        field(4; "Transaction Type"; Option)
        {
            OptionMembers = Purchase,Sale;
        }
        field(5; "Issued To/Received From"; Code[20])
        {
            // IF Rec."Transaction Type" = CONST(Purchase) THEN BEGIN
            //     Caption = 'Issued To';
            // END ELSE BEGIN
            //     Caption = 'Received From';
            // END

            TableRelation = if ("Transaction Type" = const(Purchase)) "Purchase Header"."No." where("Document Type" = const(Order))
            else
            if ("Transaction Type" = const(Sale)) "Sales Header"."No." where("Document Type" = const(Order));

            trigger OnValidate()
            var
                PurchaseHeader: Record "Purchase Header";
                SalesHEader: Record "Sales Header";
            begin
                if "Issued To/Received From" <> '' then begin
                    if "Transaction Type" = "Transaction Type"::Purchase then begin
                        // Add logic for Purchase, e.g., validate against Purchase Header
                        Clear(PurchaseHeader);
                        IF PurchaseHeader.Get(PurchaseHeader."Document Type"::Order, Rec."Issued To/Received From") then begin
                            PurchaseHeader."LC No." := Rec."No.";
                            PurchaseHeader.Modify();
                        end;
                    end
                    else
                        if "Transaction Type" = "Transaction Type"::Sale then begin
                            // Add logic for Sale, e.g., validate against Sales Header
                            Clear(SalesHEader);
                            IF SalesHEader.Get(SalesHEader."Document Type"::Order, Rec."Issued To/Received From") then begin
                                SalesHEader."LC No." := Rec."No.";
                                SalesHEader.Modify();
                            end;
                        end;
                end;
            end;
        }
        field(6; "Issuing Bank"; Code[20])
        {
            TableRelation = "Bank Account";
        }
        field(7; "Receiving Bank"; Code[20])
        {
            TableRelation = "Bank Account";
        }
        field(8; Released; Boolean) { }
        field(9; Closed; Boolean) { }

        // Right side fields
        field(10; "Date of Issue"; Date) { }
        field(11; "Expiry Date"; Date) { }
        field(12; "Type of LC"; Option)
        {
            OptionMembers = Inland,Foreign;
        }
        field(13; "Type of Credit Limit"; Option)
        {
            OptionMembers = Revolving,NonRevolving;
        }
        field(14; "Revolving Cr. Limit Types"; Option)
        {
            OptionMembers = Automatic,Manual;
        }
        field(15; "Currency Code"; Code[10])
        {
            TableRelation = Currency;
        }
        field(16; "Exchange Rate"; Decimal) { }
        field(17; "LC Value"; Decimal) { }
        field(18; "Value Utilised"; Decimal) { }
        field(19; "Remaining Amount"; Decimal) { }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
