table 50201 CarsTable
{
    DataClassification = ToBeClassified;
    Caption = 'Cars List', Comment = 'PTB=Lista de Carros';

    fields
    {

        field(2; "Code"; Text[200])
        {
            Caption = 'Code', Comment = 'PTB=Código';
            DataClassification = ToBeClassified;

        }
        field(3; "Brand"; Text[200])
        {
            Caption = 'Brand', Comment = 'PTB=Marca';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code", Brand)
        {
            Clustered = true;
        }
    }
    trigger OnDelete()
    var
        DeletedSuccess: Label 'Field deleted successfully';
    begin
        Message(DeletedSuccess);
    end;
}