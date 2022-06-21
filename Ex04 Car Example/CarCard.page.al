page 50100 "Car card"
{
    PageType = Card;
    //ApplicationArea = All; No application area or usage category for card pages
    UsageCategory = Administration;
    SourceTable = Car;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; "No.")
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                    ToolTip = 'No.';
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    ToolTip = 'Description';
                }
                field(PapaCar; PapaCar)
                {
                    ApplicationArea = All;
                    Caption = 'Papa car';
                    ToolTip = 'Papa car';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Customer")
            {
                Caption = '&Customer';
                Image = Customer;
                action("Co&ments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&ments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedOnly = true; //Show only the promoted action
                    PromotedIsBig = true; //Show before the other actions
                    RunObject = page "Comment Sheet";
                    RunPageLink = "Table Name" = const(Customer), "No." = field("No.");
                    ToolTip = 'View or add comments for the record.';
                }
            }
        }
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                ToolTip = 'Test';

                trigger OnAction()
                begin
                    Message('Test');
                end;
            }
        }
    }

}