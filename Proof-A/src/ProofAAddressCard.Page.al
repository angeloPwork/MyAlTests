page 50100 "Proof-A Address Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Proof-A Address";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Id; rec.Id)
                {
                    ApplicationArea = All;
                    Caption = 'Id';
                    ToolTip = 'Id';
                    ColumnSpan = 2;
                }
                field(City; rec.City)
                {
                    ApplicationArea = All;
                    Caption = 'City';
                    ToolTip = 'City';
                }
                field(State; rec.State)
                {
                    ApplicationArea = All;
                    Caption = 'State';
                    ToolTip = 'State';
                }
                field(Zip; rec.Zip)
                {
                    ApplicationArea = All;
                    Caption = 'Zip';
                    ToolTip = 'Zip';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            // action(ActionName)
            // {
            //     ApplicationArea = All;

            //     trigger OnAction()
            //     begin

            //     end;
            // }
        }
    }

    // var
    //     myInt: Integer;
}