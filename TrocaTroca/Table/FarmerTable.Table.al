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
        field(4; Active; Boolean)
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
        key(Key4; Active)
        {
        }
    }
}