page 50201 CarsCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = CarsTable;
    SourceTableView = sorting(Brand) order(ascending);
    Caption = 'Cars', Comment = 'Carros';
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    Editable = false;

                }
                field(Name; Rec.Brand)
                {
                    ApplicationArea = All;
                    Editable = false;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Generate Report")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Report.RunModal(50201);
                end;
            }
        }
    }
}