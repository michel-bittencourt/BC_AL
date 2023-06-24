page 50202 CrnCarsListPageAPI
{
    PageType = API;
    Caption = 'Cars list API', Comment = 'PTB=API de lista de carros';
    APIPublisher = 'michel';
    APIGroup = 'tccmichel';
    APIVersion = 'v1.0';
    EntityName = 'carsList';
    EntitySetName = 'carsListSet'; //Vai na API
    SourceTable = CrnCarsTable;
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                    Editable = false;
                    ApplicationArea = All;
                }
                field(codigo; Rec.codigo)
                {
                    Caption = 'Transaction Type', Comment = 'PTB=Tipo de Transação';
                    ApplicationArea = All;
                }
                field(nome; Rec.nome)
                {
                    Caption = 'Date', Comment = 'PTB=Data';
                    ApplicationArea = All;
                }
            }
        }
    }
}