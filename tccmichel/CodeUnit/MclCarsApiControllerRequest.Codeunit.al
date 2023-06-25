codeunit 50201 CarsApiControllerRequest
{
    procedure GET(requestURL: Text; erroMsg: Text) Json: Text
    var
        httpClient: HttpClient;
        //httpRequestMsg: HttpRequestMessage;
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
}