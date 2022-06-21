page 50103 "Proof-A Employee List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Proof-A Employee";
    CardPageId = "Proof-A Employee Card";
    Caption = 'Proof-A Employee List';

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
                field(AddressId; rec.AddressId)
                {
                    ApplicationArea = All;
                    Caption = 'Address';
                    ToolTip = 'Address';
                    // Lookup = true;
                    // LookupPageId = 50101;
                    DrillDown = true;
                    DrillDownPageId = 50101;
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