codeunit 50203 JSON_Methods
{
    trigger OnRun()
    begin
    end;

    // GetJsonValue is use to get the value format and helpful to convert in text
    procedure GetJsonValue(var json_Object: JsonObject; Property: Text; var json_Value: JsonValue): Boolean
    var
        json_Token: JsonToken;
    begin
        if not json_Object.Get(Property, json_Token) then begin
            Message(ErrorQuery);
            exit;
        end;

        json_Value := json_Token.AsValue();
        exit(true);
    end;

    // Work for Text Response
    procedure GetJsonValueAsText(var json_Object: JsonObject; Property: Text) Value: Text
    var
        json_Value: JsonValue;
    begin
        if not GetJsonValue(json_Object, Property, json_Value) then begin
            Message(ErrorQuery);
            exit;
        end;

        Value := json_Value.AsText;
    end;

    procedure RecebeCodeCar(SelectedCar: Code[20]) value: code[20]
    begin
        value := SelectedCar;
    end;

    var
        SelectCode: code[20];
        ErrorQuery: Label 'Error in the query. If the issue persists, please contact the developers.', Comment = 'Erro na consulta. Caso persista, entre em contato com os desenvolvedores.';
}