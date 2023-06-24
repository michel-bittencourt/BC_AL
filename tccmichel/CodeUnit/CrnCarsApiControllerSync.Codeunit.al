codeunit 50202 CrnCarsApiControllerSync
{

    procedure SyncPostCar(): Boolean
    var
        ResponseJson: Text;
    begin
        Clear(CarsData);
        ResponseJson := CarsApi.GET();
        CarsData := CarsApi.GetJsonData(ResponseJson);

        Clear(CarsCode);
        CarsCode := CarsData.Get('codigo');
        Clear(CarsName);
        CarsName := CarsData.Get('nome');

    end;

    var
        CarsApi: Codeunit CrnCarsApiController;
        CarsData: Dictionary of [Text, Text];
        CarsCode: Code[20];
        CarsName: Text;

}