pageextension 50110 CustomerCardExtension extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            // control with underlying datasource
            field("Shoe Size"; ShoeSize)
            {
                ApplicationArea = All;

                trigger OnValidate();
                begin
                    if (ShoeSize < 10) then
                        Error('Feet too small');
                end;
            }
            // display-only control (without underlying datasource)
            field(ShoesInStock; 10)
            {
                ApplicationArea = All;
                Caption = 'Shoes in stock';

            }
        }

        modify("Address 2")
        {
            Caption = 'New Address 2';
        }
    }

    actions
    {
        addlast(Creation)
        {
            group(MyActionGroup)
            {
                Action(MyAction1)
                {
                    ApplicationArea = All;
                    Caption = 'Hello!';

                    trigger OnAction();
                    begin
                        Message('My message');
                    end;
                }

                Action(MyAction2)
                {
                    ApplicationArea = All;

                    // Run page to test how actions work
                    RunObject = page "Absence Registration";
                }
            }
        }
    }
}