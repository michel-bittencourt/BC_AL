page 50201 CrnCarsCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = CrnCarsTable;
    Caption = 'Cars', Comment = 'Carros';
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field(codigo; Rec.codigo)
                {
                    ApplicationArea = All;
                    Editable = false;

                }
                field(nome; Rec.nome)
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
            action(Buy)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    if Rec.codigo = '' then begin
                        Message('Errado');
                    end;
                end;
            }
        }
    }
}