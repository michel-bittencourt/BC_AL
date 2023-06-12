page 50100 FarmerPost
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = FarmerTable;
    Caption = 'Farmer Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(name; FarmerRec.Name)
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                    Caption = 'Name: ';
                    ToolTip = 'Enter the name.';
                }
                field(lastName; FarmerRec.LastName)
                {
                    ApplicationArea = All;
                    Caption = 'Last name: ';
                    ToolTip = 'Enter the last name.';
                }
                field(nickName; FarmerRec.Nickname)
                {
                    ApplicationArea = All;
                    Caption = 'Nickname.';
                    ToolTip = 'Enter the nickname.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        FarmerRec: Record FarmerTable;
}