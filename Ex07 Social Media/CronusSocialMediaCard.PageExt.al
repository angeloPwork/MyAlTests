pageextension 50100 "Cronus Social Media Card" extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            group("Social Media")
            {
                field(Facebook; Facebook)
                {
                    ApplicationArea = All;
                    Caption = 'Facebook';
                    ToolTip = 'Facebook';
                }
                field(Twitter; Twitter)
                {
                    ApplicationArea = All;
                    Caption = 'Twitter';
                    ToolTip = 'Twitter';
                }
                field(Instagram; Instagram)
                {
                    ApplicationArea = All;
                    Caption = 'Instagram';
                    ToolTip = 'Instagram';
                }
                field(LinkedIn; LinkedIn)
                {
                    ApplicationArea = All;
                    Caption = 'LinkedIn';
                    ToolTip = 'LinkedIn';
                }
            }
        }
    }

    // actions
    // {
    //     // Add changes to page actions here
    // }
}