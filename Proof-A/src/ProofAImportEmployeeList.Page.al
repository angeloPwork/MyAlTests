page 50104 "Proof-A Import Employee List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Proof-A Import Employee";
    Caption = 'Proof-A Import Employee List';
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(FirstName; rec.FirstName)
                {
                    ApplicationArea = All;
                    Caption = 'First name';
                    ToolTip = 'First name';
                }
                field(LastName; rec.LastName)
                {
                    ApplicationArea = All;
                    Caption = 'Last name';
                    ToolTip = 'Last name';
                }
                field(ContactNo; rec.ContactNo)
                {
                    ApplicationArea = All;
                    Caption = 'Contact No.';
                    ToolTip = 'Contact No.';
                }
                field(Email; rec.Email)
                {
                    ApplicationArea = All;
                    Caption = 'e-mail';
                    ToolTip = 'e-mail';
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
            action(ImportEmployees)
            {
                ApplicationArea = All;
                Caption = 'Import Employees';
                ToolTip = 'Import Employees';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    //Xmlport.Run(50100, false, true);
                    Xmlport.Run(Xmlport::"Proof-A Import Employees", false, true);
                end;
            }
            action(ProcessEmployees)
            {
                ApplicationArea = All;
                Caption = 'Process Employees';
                ToolTip = 'Process Employees';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    importCu: Codeunit "Proof-a Import Employees";
                begin
                    importCu.ProcessImportedEmployees();
                end;
            }
            action(MyRDLReport)
            {
                ApplicationArea = All;
                Caption = 'MyRdlReport';
                ToolTip = 'MyRdlReport';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    report.Run(Report::"Proof-A MyRdlReport");
                end;
            }
        }
    }
}