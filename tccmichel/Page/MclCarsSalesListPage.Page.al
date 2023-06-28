page 50204 CarsSalesListPage
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = CarSalesTable;
    SourceTableView = sorting("Brand") order(ascending);
    Caption = 'Car sales', Comment = 'PTB=Venda de carros';

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(Salesperson; Rec.Salesperson)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = '';
                }
                field(Customer; Rec.Customer)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = '';
                }
                field(Brand; Rec.Brand)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = '';
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = '';
                }
                field(Year; Rec.Year)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = '';
                }
                field("Value"; Rec."Value")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = '';
                }
                field(GeneralObs; Rec.GeneralObs)
                {
                    ApplicationArea = All;
                    ToolTip = '';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Sales report")
            {
                trigger OnAction()
                begin
                    Report.RunModal(50202);
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        CurrPage.Editable(true);
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        MyDate: Date;
        MyDateString: Text;
        MyValue: Decimal;
        MyValueString: Text;
    begin
        MyDate := Rec.Year;
        MyDateString := FORMAT(MyDate);
        MyValue := Rec."Value";
        MyValueString := FORMAT(MyValue);

        if (Rec.Salesperson = '')
        or (Rec.Customer = '')
        or (Rec.Brand = '')
        or (Rec.Model = '')
        or (MyDateString = '')
        or (MyValueString = '') then
            Error(ErrorFieldEmpty);
    end;

    var
        ErrorFieldEmpty: Label 'You must fill in all fields before closing the page.', Comment = 'Você deve preencher todos os campos antes de fechar a pagina.';

}