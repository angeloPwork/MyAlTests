table 50100 "Proof-A Address"
{
    DataClassification = CustomerContent;
    Caption = 'Proof-A Address';

    fields
    {
        field(1; Id; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Id';
        }
        field(2; City; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'City';
        }
        field(3; State; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'State';
        }
        field(4; Zip; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Zip';
        }
    }

    keys
    {
        key(PK; Id)
        {
            Clustered = true;
        }
        key(CityStateZip; City, State, Zip)
        { }
    }
    // trigger OnInsert()
    // begin

    // end;

    // trigger OnModify()
    // begin

    // end;

    // trigger OnDelete()
    // begin

    // end;

    // trigger OnRename()
    // begin

    // end;
}