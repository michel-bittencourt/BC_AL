codeunit 50201 CrnCarsApiController
{
    procedure GET() Json: Text
    var
        HttpContent: HttpContent;
        HttpHeadersContent: HttpHeaders;
        HttpClient: HttpClient;
        HttpResponse: HttpResponseMessage;
        Url: Text;
        LblRequestError: Label 'An error occurred while trying to execute the request: %1';
    begin
        Url := 'https://parallelum.com.br/fipe/api/v1/carros/marcas';
        HttpContent.GetHeaders(HttpHeadersContent);
        HttpHeadersContent.Remove('Content-Type');
        HttpClient.SetBaseAddress(Url);

        if Not HttpClient.Get(Url, HttpResponse) then
            error(LblRequestError, Url);

        if HttpResponse.IsSuccessStatusCode() then
            HttpResponse.Content().ReadAs(Json)
        else
            Message(getErrorDescription(HttpResponse.HttpStatusCode));
    end;

    procedure GetJsonData(JsonText: Text) Data: Dictionary of [Text, Text]
    var
        ResponseData: JsonObject;
        JsonToken: JsonToken;
        keyName: Text;
    begin
        Clear(Data);
        if ResponseData.ReadFrom(JsonText) then;

        foreach keyName in ResponseData.Keys do
            if ResponseData.Get(keyName, JsonToken) then
                Data.Add(keyName, JsonToken.AsValue().AsText());
    end;

    procedure GetJsonArrayData(JsonText: Text) Data: List of [Dictionary of [Text, Text]]
    var
        JsonArray: JsonArray;
        JsonToken: JsonToken;
    begin
        if not JsonArray.ReadFrom(JsonText) then
            Error('');

        foreach JsonToken in JsonArray do
            Data.Add(GetJsonData(Format(JsonToken)));

    end;

    procedure getErrorDescription(ErrorCode: Integer) Description: Text
    begin
        case ErrorCode of
            400:
                Description := Lbl400ErrorMessage;
            404:
                Description := Lbl404ErrorMessage;
            500:
                Description := Lbl500ErrorMessage;
            else
                Description := LblGenericErrorMessage;

        end;
    end;

    var
        Lbl400ErrorMessage: Label 'Postcode has an invalid format.', Comment = 'O CEP tem um formato inválido.';
        Lbl404ErrorMessage: Label 'The requested Resource was not found in the Web Service, check the URL registered for the API.',
                                    Comment = 'O Recurso solicitado não foi encontrado no Web Service, verifique a URL cadastrada para a API.';
        Lbl500ErrorMessage: Label 'The search could not be performed, an internal error occurred in the API.',
                                    Comment = 'Não foi possível realizar a busca, ocorreu um erro interno na API.';
        LblGenericErrorMessage: Label 'Unable to perform the search.', Comment = 'Não foi possível realizar a busca.';
}