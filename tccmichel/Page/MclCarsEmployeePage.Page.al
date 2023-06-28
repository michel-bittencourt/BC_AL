pageextension 50201 CarsEmployeePage extends "Employee Card"
{
    layout
    {
        addafter("Company E-Mail")
        {
            field(Car; Rec.Car)
            {
                Caption = 'Car', Comment = 'PTB=Carro';
                ApplicationArea = All;
                ToolTip = '';
            }
        }
    }
}