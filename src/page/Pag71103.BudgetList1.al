page 71103 "Budget List1"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "SIGMA Budget";
    Caption = 'Budget List';
    UsageCategory = Lists;
    CardPageId = "Budget Card1";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Budget Code"; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Start Date"; Rec.StartingDate)
                {
                    ApplicationArea = All;
                }
                field("End Date"; Rec.EndingDate)
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
        }
    }
}