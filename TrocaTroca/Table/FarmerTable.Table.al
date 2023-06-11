table 50100 FarmerTable
{
    Caption = 'FarmerTable';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Name; Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(2; LastName; Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(3; Nickname; Text[30])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; Name)
        {
            Clustered = true;
        }
        key(Key2; LastName)
        {
        }
        key(Key3; Nickname)
        {
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}