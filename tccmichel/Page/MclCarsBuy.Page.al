page 50204 CarsBuy
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BuyCarsTable;
    Caption = 'Buy car', Comment = 'PTB=Comprar carro';

    layout
    {
        area(Content)
        {
            group("Choose a car")
            {
                field("CodeCar"; Rec.CodeCar)
                {
                    ApplicationArea = All;
                    Caption = 'Car Code', Comment = 'PTB: Código do carro';
                    ToolTip = 'If you don''t know the car code, click on action and search for car.';

                }
                field("CodeBrand"; Rec.CodeBrand)
                {
                    ApplicationArea = All;
                    Caption = 'Brand Code', Comment = 'PTB: Código da marca';
                    ToolTip = 'If you don''t know the brand code, click on action and search for brand.';

                }
                field("CodeModel"; Rec.CodeModel)
                {
                    ApplicationArea = All;
                    Caption = 'Model Code', Comment = 'PTB: Código do modelo';
                    ToolTip = 'If you don''t know the model code, click on action and search for model.';

                }
                field("Year"; Rec.Year)
                {
                    ApplicationArea = All;
                    Caption = 'Year', Comment = 'PTB: Ano';
                    ToolTip = 'If you don''t know the year, click on action and search for year.';

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("search for car")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Page.RunModal(50203)
                end;
            }
        }
    }
}