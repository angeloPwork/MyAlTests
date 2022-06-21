table 50100 "Gestione Corsi"
{
    DataClassification = CustomerContent;

    fields
    {
        field(10; Codice; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Codice';
        }
        field(20; Nome; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Nome';
        }
        field(30; Descrizione; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Descrizione';
        }
        field(40; Tipo; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = "Instructor Led","e-Learning","Remote Training";
            Caption = 'Tipo';
        }
        field(50; Durata; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Durata';
        }
        field(60; Prezzo; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Prezzo';
        }
        field(70; Attivo; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Attivo';
        }
        field(80; Difficontà; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Difficontà';
        }
        field(90; "Punteggio di superamento"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Punteggio di superamento';
        }
        field(100; "Codice istruttore"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Resource where(Type = const(Person));
            Caption = 'Codice istruttore';
        }
        field(120; "Nome istruttore"; Text[50])
        {
            Caption = 'Nome istruttore';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Resource.Name where("No." = field("Codice istruttore")));
        }
    }

    keys
    {
        key(PK; Codice)
        {
            Clustered = true;
        }
        key(Key1; "Codice istruttore")
        { }
        key(Key2; Tipo)
        { }
    }
}