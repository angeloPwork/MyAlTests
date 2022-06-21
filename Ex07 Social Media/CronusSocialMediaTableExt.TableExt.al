tableextension 50110 "Cronus Social Media Table Ext" extends Customer
{
    fields
    {
        // Add changes to table fields here
        field(50100; Facebook; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Facebook';
        }
        field(50111; Twitter; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Twitter';
        }
        field(50112; Instagram; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Instagram';
        }
        field(50113; LinkedIn; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'LinkedIn';
        }
    }
}