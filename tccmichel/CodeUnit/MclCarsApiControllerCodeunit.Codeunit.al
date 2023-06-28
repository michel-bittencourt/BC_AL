codeunit 50201 CarsApiControllerCodeunit
{
    trigger OnRun()
    begin
    end;

    procedure GET(requestURL: Text; erroMsg: Text) Json: Text
    var
        httpClient: HttpClient;
        httpResponseMsg: HttpResponseMessage;
        response: Text;
    begin
        erroMsg := '';

        if not httpClient.Get(requestURL, httpResponseMsg) then begin
            erroMsg := 'The call to webservice is failed';
        end;

        if not httpResponseMsg.IsSuccessStatusCode then begin
            erroMsg += '\The request call returned an error message. \Detail: \Status Code: ' +
                   Format(httpResponseMsg.HttpStatusCode) + '\Description: ' + httpResponseMsg.ReasonPhrase;
        end;

        httpResponseMsg.Content.ReadAs(response);

        exit(response);
    end;

    procedure UsersInfoFromResponse(response: Text): Boolean
    var
        responseArray: JsonArray;
        json_Token: JsonToken;
        json_Object: JsonObject;
        userInfo_JsonObject: JsonObject;
        i: Integer;
    begin
        //if json_Object.ReadFrom(response) then begin        
        if json_Token.ReadFrom(response) then begin
            if json_Token.IsArray then   // json_Token.IsArray; json_Token.IsObject; json_Token.IsValue;
                responseArray := json_Token.AsArray();
            for i := 0 to responseArray.Count() - 1 do begin
                // Get First Array Result
                responseArray.Get(i, json_Token);
                // Convert JsonToken to JsonObject
                if json_Token.IsObject then begin
                    userInfo_JsonObject := json_Token.AsObject();
                    insertData(userInfo_JsonObject);
                end;
            end;
        end;
        //end;
        exit(true);
    end;

    procedure insertData(userInfoJsonObject: JsonObject)
    var
        recCarsTable: Record CarsTable;
        json_Methods: Codeunit MethodsCodeunit;
        retJsonValue: JsonValue; // this can be used when getting value from GetJsonValue method
        addressJsonObject: JsonObject;
        addressJsonToken: JsonToken;
        geoJsonObject: JsonObject;
        geoJsonToken: JsonToken;
        companyJsonObject: JsonObject;
        companyJsonToken: JsonToken;
    begin
        recCarsTable.Reset();
        recCarsTable.Init();

        recCarsTable."Code" := json_Methods.GetJsonValueAsText(userInfoJsonObject, 'codigo');
        recCarsTable.Brand := json_Methods.GetJsonValueAsText(userInfoJsonObject, 'nome');

        recCarsTable.Insert();
    end;
}