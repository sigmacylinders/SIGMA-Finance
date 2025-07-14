pageextension 71101 "User Setups Extension" extends "User Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter(Email)
        {
            field("Vendors Full access"; Rec."Vendors Full access")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Vendors Full access field.', Comment = '%';
            }
            field("Items Full access"; Rec."Items Full access")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Items Full access field.', Comment = '%';
            }
            field("Customers Full access"; Rec."Customers Full access")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Customers Full access field.', Comment = '%';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}