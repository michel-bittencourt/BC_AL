page 50203 CarsListPage
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = CarsTable;
    SourceTableView = sorting(Brand) order(ascending);
    Caption = 'Cars list', Comment = 'PTB=Lista de carros';

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = '';
                }
                field(Name; Rec.Brand)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = '';
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
                trigger OnAction()
                var
                    ApiControllerRequest: Codeunit CarsApiControllerCodeunit;
                    response: Text;
                    errorMsg: Text;
                    apiResponse: Codeunit CarsApiControllerCodeunit;
                begin
                    response := ApiControllerRequest.GET('https://parallelum.com.br/fipe/api/v1/carros/marcas', errorMsg);
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
        if (Rec."Code" = '') then
            Error(ErrorFieldCodeEmpty);
        if (Rec.Brand = '') then
            Error(ErrorFieldNameEmpty);
    end;

    trigger OnClosePage()
    begin
        if (Rec."Code" = '') then
            Error(ErrorFieldCodeEmpty);

        if (Rec.Brand = '') then
            Error(ErrorFieldNameEmpty);
    end;

    var
        ErrorFieldCodeEmpty: Label 'The field code cannot be empty.', Comment = 'PTB=O campo código precisa ser preenchido.';
        ErrorFieldNameEmpty: Label 'The field brand cannot be empty.', Comment = 'PTB=O campo marca precisa ser preenchido.';
}