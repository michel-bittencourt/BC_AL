tableextension 50201 CarCustomerTableext extends Employee
{
    fields
    {
        field(50200; Car; Text[200])
        {
            DataClassification = CustomerContent;
            Caption = 'Car', Comment = 'Carro';
            TableRelation = CarSalesTable;
        }
    }
}