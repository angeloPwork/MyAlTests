page 50102 "Proof-A Employee Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Proof-A Employee";

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
    trigger OnNewRecord(BelowxRec: Boolean)
    var
        lastEmployee_ProofAEmployee: Record "Proof-A Employee";
    begin
        if lastEmployee_ProofAEmployee.FindLast() then
            Rec.Id := (lastEmployee_ProofAEmployee.Id + 1)
        else
            Rec.Id := 1;
    end;
}