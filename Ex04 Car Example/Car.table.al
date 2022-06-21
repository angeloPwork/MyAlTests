table 50100 Car
{
    DataClassification = CustomerContent;
    Caption = 'Car';
    DataCaptionFields = "No.", Description;
    LookupPageId = "Car List";
    DrillDownPageId = "Car List";

    fields
    {
        field(1; "No."; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[50])
        {
            DataClassification = CustomerContent;

        }
        field(3; PapaCar; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = Car;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}