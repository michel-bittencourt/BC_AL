page 50203 CrnCarsList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = CrnCarsTable;
    Caption = 'Cars list', Comment = 'PTB=Lista de carros';

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(codigo; Rec.codigo)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Transaction Type field.', Comment = 'PTB=Tipo de Transação';
                }
                field(nome; Rec.nome)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Date field.', Comment = 'PTB=Data';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Sync cars")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    CarsSync: Codeunit CrnCarsApiControllerSync;
                begin
                    CarsSync.SyncPostCar();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        CurrPage.Editable(true);
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if (Rec.codigo = '') then
            Error(ErrorFieldCodeEmpty);
        if (Rec.nome = '') then
            Error(ErrorFieldNameEmpty);
    end;

    trigger OnClosePage()
    begin
        if (Rec.codigo = '') then
            Error(ErrorFieldCodeEmpty);

        if (Rec.nome = '') then
            Error(ErrorFieldNameEmpty);
    end;

    var
        ErrorFieldCodeEmpty: Label 'The field code cannot be empty.', Comment = 'PTB=O campo código precisa ser preenchido.';
        ErrorFieldNameEmpty: Label 'The field brand cannot be empty.', Comment = 'PTB=O campo marca precisa ser preenchido.';
}