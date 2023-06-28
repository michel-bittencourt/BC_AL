report 50201 CarsListReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = CarsListReportRDLC;
    Caption = 'Cars List Report', Comment = 'PTB= Relatório da lista de carros';

    dataset
    {
        dataitem(CarsTable; CarsTable)
        {
            column(COMPANYNAME; COMPANYPROPERTY.DisplayName())
            {

            }
            column("Code"; "Code")
            {
                IncludeCaption = true;
            }
            column(Name; Brand)
            {
                IncludeCaption = true;
            }
        }
    }

    rendering
    {
        layout(CarsListReportRDLC)
        {
            Type = RDLC;
            LayoutFile = './ReportLayout/CarsListReport.rdl';
            Caption = 'Cars List', Comment = 'PTB=Lista de carros';
        }
    }
    labels
    {
        PageLbl = 'Page', Comment = 'PTB=Página';
        ReportTitleLbl = 'Cars List', Comment = 'PTB=Lista de carros';
        TotalLbl = 'Total', Comment = 'PTB=Total';
    }
}