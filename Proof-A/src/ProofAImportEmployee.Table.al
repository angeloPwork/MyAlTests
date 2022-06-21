table 50102 "Proof-A Import Employee"
{
    DataClassification = CustomerContent;
    Caption = 'Proof-A Import Employee';

    fields
    {
        field(2; FirstName; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'First name';
        }
        field(3; LastName; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Last name';
        }
        field(4; ContactNo; Text[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Contact No.';
        }
        field(5; Email; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'e-mail';
        }
        field(6; City; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'City';
        }
        field(7; State; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'State';
        }
        field(8; Zip; Text[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Zip';
        }
    }

    keys
    {
        // key(PK; FirstName, LastName, ContactNo, Email, City, State, Zip)
        // {
        //     Clustered = true;
        // }
    }

    // var
    //     myInt: Integer;

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