pageextension 71100 "Payment Terms Extension" extends "Payment Terms"
{
    layout
    {
        // Add changes to page layout here

        addafter("Calc. Pmt. Disc. on Cr. Memos")
        {

            field(Transh1; Rec.Transh1)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Transh1 field.', Comment = '%';
            }
            field("Due Date Calculation Days1"; Rec."Due Date Calculation Days1")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Due Date Calculation Days1 field.', Comment = '%';
            }
            field("Transh1 %"; Rec."Transh1 %")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Transh1 % field.', Comment = '%';
            }

            field("Due Date Calculation From 1"; Rec."Due Date Calculation From 1")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Due Date Calculation From 1 field.', Comment = '%';
            }
            field(Transh2; Rec.Transh2)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Transh2 field.', Comment = '%';
            }
            field("Due Date Calculation Days2"; Rec."Due Date Calculation Days2")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Due Date Calculation Days2 field.', Comment = '%';
            }
            field("Transh2 %"; Rec."Transh2 %")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Transh2 % field.', Comment = '%';
            }

            field("Due Date Calculation From 2"; Rec."Due Date Calculation From 2")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Due Date Calculation From 2 field.', Comment = '%';
            }
            field(Transh3; Rec.Transh3)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Transh3 field.', Comment = '%';
            }
            field("Due Date Calculation Days3"; Rec."Due Date Calculation Days3")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Due Date Calculation Days3 field.', Comment = '%';
            }
            field("Transh3 %"; Rec."Transh3 %")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Transh3 % field.', Comment = '%';
            }

            field("Due Date Calculation From 3"; Rec."Due Date Calculation From 3")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Due Date Calculation From 3 field.', Comment = '%';
            }
        }


    }

    actions
    {
        addafter("T&ranslation")
        {
            action("Fill Description")
            {
                ApplicationArea = All;
                Caption = 'Fill Description';
                Image = EditLines;
                ToolTip = 'Fills the description based on the payment terms.';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    PaymentTerms: Record "Payment Terms";
                begin
                    repeat
                        Rec.BuildDescription(Rec);
                        Rec.Modify();
                    until Rec.Next() = 0;
                end;

            }
        }
    }
    // trigger OnAfterGetRecord()
    // var
    //     myInt: Integer;
    // begin
    //     Rec.BuildDescription();
    // end;

    var
        myInt: Integer;
}