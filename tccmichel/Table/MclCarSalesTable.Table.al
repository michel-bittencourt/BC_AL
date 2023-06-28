table 50202 CarSalesTable
{
    DataClassification = ToBeClassified;
    Caption = 'Car buy', Comment = 'PTB=Comprar carro';

    fields
    {
        field(2; "Salesperson"; Text[200])
        {
            Caption = 'Cod. Salesperson', Comment = 'PTB=Cód. Vendedor';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = ToBeClassified;
        }
        field(3; "Customer"; Text[200])
        {
            Caption = 'Cod. Customer', Comment = 'PTB=Cód. Cliente';
            TableRelation = Customer;
            DataClassification = ToBeClassified;
        }
        field(4; "Brand"; Text[200])
        {
            Caption = 'Cod. Brand', Comment = 'PTB=Cód. Marca';
            TableRelation = CarsTable;
            DataClassification = ToBeClassified;
        }
        field(5; "Model"; Text[200])
        {
            Caption = 'Model', Comment = 'PTB=Modelo';
            DataClassification = ToBeClassified;
        }
        field(6; "Year"; Date)
        {
            Caption = 'Years', Comment = 'PTB=Ano';
            DataClassification = ToBeClassified;
        }
        field(7; "Value"; Decimal)
        {
            Caption = 'Value', Comment = 'PTB=Valor';
            DataClassification = ToBeClassified;
        }
        field(8; "GeneralObs"; Text[200])
        {
            Caption = 'General Obs.', Comment = 'PTB=Obs. Geral';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Salesperson", Brand)
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