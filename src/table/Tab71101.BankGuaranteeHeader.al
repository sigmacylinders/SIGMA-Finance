table 71101 "Bank Guarantee Header"
{
    DataClassification = ToBeClassified;
    DrillDownPageId = "Bank Guarantee List";
    LookupPageId = "Bank Guarantee List";

    fields
    {
        field(1; "BG No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(2; "Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(3; "Transaction Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Purchase,Sale;
        }

        field(4; "Issued To/Received From"; Code[20])
        {
            // IF Rec."Transaction Type" = CONST(Purchase) THEN BEGIN
            //     Caption = 'Issued To';
            // END ELSE BEGIN
            //     Caption = 'Received From';
            // END

            TableRelation = if ("Transaction Type" = const(Purchase)) "Purchase Header"
            else
            if ("Transaction Type" = const(Sale)) "Sales Header";

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
                            PurchaseHeader."BG No." := Rec."BG No.";
                            PurchaseHeader.Modify();
                        end;
                    end
                    else
                        if "Transaction Type" = "Transaction Type"::Sale then begin
                            // Add logic for Sale, e.g., validate against Sales Header
                            Clear(SalesHEader);
                            IF SalesHEader.Get(SalesHEader."Document Type"::Order, Rec."Issued To/Received From") then begin
                                SalesHEader."BG No." := Rec."BG No.";
                                SalesHEader.Modify();
                            end;
                        end;
                end;
            end;
        }
        field(5; "Issuing Bank"; Code[20])
        {
            TableRelation = "Bank Account";
        }
        field(6; "Receiving Bank"; Code[20])
        {
            TableRelation = "Bank Account";
        }

        field(7; "Date of Issue"; Date)
        {
            DataClassification = ToBeClassified;
        }

        field(8; "Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }

        field(9; "Type of BG"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Inland,Foreign;
        }
        field(10; "Type of Credit Limit"; Option)
        {
            OptionMembers = Revolving,NonRevolving;
        }

        field(11; "BG Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(12; "Released"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(13; "Closed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;


        }
    }

    keys
    {
        key(PK; "BG No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var


        NoSeries: Codeunit "No. Series";
        NoSeriesCode: Code[20];
        IsHandled: Boolean;
        GLSetup: Record "General Ledger Setup";

    begin
        if "BG No." = '' then begin
            GLSetup.Get();
            GLSetup.TestField("BG No. Series");

            if NoSeries.AreRelated(GLSetup."BG No. Series", xRec."No. Series") then
                Rec."No. Series" := xRec."No. Series"
            else
                Rec."No. Series" := GLSetup."BG No. Series";

            Rec."BG No." := NoSeries.GetNextNo(Rec."No. Series");

            //   end;
        end;
    end;
}
