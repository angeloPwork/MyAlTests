table 50101 "Proof-A Employee"
{
    DataClassification = CustomerContent;
    Caption = 'Proof-A Employee';

    fields
    {
        field(1; Id; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Id';
        }
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
        field(6; AddressId; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Proof-A Address".Id;
        }
    }

    keys
    {
        key(PK; Id)
        {
            Clustered = true;
        }
        key(FirstName; FirstName, LastName)
        { }
        key(LastName; LastName, FirstName)
        { }
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