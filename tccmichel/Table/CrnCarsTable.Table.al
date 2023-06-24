table 50201 CrnCarsTable
{
    DataClassification = CustomerContent;
    Caption = 'Cars List', Comment = 'PTB=Lista de Carros';
    DrillDownPageID = CrnCarsList;
    LookupPageID = CrnCarsList;

    fields
    {
        field(1; "codigo"; Code[20])
        {
            Caption = 'Code', Comment = 'PTB=Código';
            DataClassification = CustomerContent;
        }
        field(2; "nome"; Text[200])
        {
            Caption = 'Brand', Comment = 'PTB=Marca';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "codigo")
        {
            Clustered = true;
        }
    }
}