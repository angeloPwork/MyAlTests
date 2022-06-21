page 50101 "Proof-A Address List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Proof-A Address";
    CardPageId = "Proof-A Address Card";
    Caption = 'Proof-A Address List';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Id; rec.Id)
                {
                    ApplicationArea = All;
                    Caption = 'Id';
                    ToolTip = 'Id';
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
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(GotoImport01)//ImportEmployees)
            {
                ApplicationArea = All;
                Caption = 'Go to Import Employees';
                ToolTip = 'Go to Import Employees';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                // var
                //     importCU: Codeunit "Proof-a Import Employees";
                begin
                    // //Xmlport.Run(50100, false, true);
                    // Xmlport.Run(Xmlport::"Proof-A Import Employees", false, true);
                    // importCU.ProcessImportedEmployees();
                    Page.Run(Page::"Proof-A Import Employee List");
                end;
            }
        }
    }
}