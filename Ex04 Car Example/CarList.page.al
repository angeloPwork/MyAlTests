page 50101 "Car List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Car;
    CardPageId = "Car card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
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
        // area(Factboxes)
        // {

        // }
    }
}