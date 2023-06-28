report 50202 CarSalesReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = CarsSalesReportRDLC;
    Caption = 'Cars Sales Report', Comment = 'PTB=Relatório da venda de carros';

    dataset
    {
        dataitem(CarBuyTable; CarSalesTable)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = Salesperson, Customer;
            column(COMPANYNAME; COMPANYPROPERTY.DisplayName())
            {
            }
            column(Salesperson; Salesperson)
            {
                IncludeCaption = true;
            }
            column(Customer; Customer)
            {
                IncludeCaption = true;
            }
            column(Brand; Brand)
            {
                IncludeCaption = true;
            }
            column(Model; Model)
            {
                IncludeCaption = true;
            }
            column(Year; Year)
            {
                IncludeCaption = true;
            }
            column("Value"; "Value")
            {
                IncludeCaption = true;
            }
            column("GeneralObs"; GeneralObs)
            {
                IncludeCaption = true;
            }
            dataitem(CustomerLedgers; Customer)
            {
                DataItemLinkReference = CarBuyTable;
                DataItemLink = "No." = field("Customer");
                DataItemTableView = sorting("No.");
                column(CustomerCars; "No.")
                {
                    IncludeCaption = true;
                }
            }
            trigger OnPreDataItem()
            begin
                if HideBlockedCustomers then
                    CarBuyTable.SetRange(Brand);
            end;
        }
    }
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    field(FldHideBlockedCustomers; HideBlockedCustomers)
                    {
                        ApplicationArea = All;
                        Caption = 'Hide Blocked Customers?';
                        ToolTip = 'Hide Blocked Customers?';
                    }
                }
            }
        }
    }

    rendering
    {
        layout(CarsSalesReportRDLC)
        {
            Type = RDLC;
            LayoutFile = './ReportLayout/CarsSalesReport.rdl';
            Caption = 'Cars Sales Report', Comment = 'PTB=Relatório de venda de carros';
        }
    }
    labels
    {
        PageLbl = 'Page', Comment = 'PTB=Página';
        ReportTitleLbl = 'Cars Sales Report', Comment = 'PTB=Relatório de venda de carros';
        TotalLbl = 'Total', Comment = 'PTB=Total';
    }

    var
        HideBlockedCustomers: Boolean;
}