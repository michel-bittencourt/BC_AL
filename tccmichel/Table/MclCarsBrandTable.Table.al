table 50202 CarsBrandTable
{
    DataClassification = ToBeClassified;
    Caption = 'Cars brand list', Comment = 'PTB=Lista de marcas de Carros';

    fields
    {
        field(2; "codigo"; Code[20])
        {
            Caption = 'Code', Comment = 'PTB=Código';
            DataClassification = ToBeClassified;

        }
        field(3; "nome"; Text[200])
        {
            Caption = 'Brand', Comment = 'PTB=Marca';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "codigo")
        {
            Clustered = true;
        }
        key(Key2; "nome")
        {
        }
    }
}