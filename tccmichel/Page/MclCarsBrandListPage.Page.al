page 50205 CarsBrandListPage
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = CarsBrandTable;
    SourceTableView = sorting("nome") order(ascending);
    Caption = 'Cars brand list', Comment = 'PTB=Lista de marcas de carros';

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
            action("Sync brands")
            {
                trigger OnAction()
                var
                    ApiControllerRequest: Codeunit CarsApiControllerRequest;
                    response: Text;
                    errorMsg: Text;
                    apiResponse: Codeunit CarsApiControllerResponse;
                begin
                    response := ApiControllerRequest.GET('https://parallelum.com.br/fipe/api/v1/carros/marcas/1/modelos', errorMsg);
                    if errorMsg <> '' then
                        Error(errorMsg)
                    else
                        Message('Your API Call Response: \' + response);

                    if response <> '' then begin
                        if apiResponse.UsersInfoFromResponse(response) then
                            Message('Records inserted Successfully!');
                    end;
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
        SelectedCodeCodeunit: Codeunit JSON_Methods;
        ErrorFieldCodeEmpty: Label 'The field code cannot be empty.', Comment = 'PTB=O campo código precisa ser preenchido.';
        ErrorFieldNameEmpty: Label 'The field brand cannot be empty.', Comment = 'PTB=O campo marca precisa ser preenchido.';
}