page 50101 "Farmer List"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = FarmerTable;
    UsageCategory = Lists;
    Caption = 'Farmer List';
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Name';
                }
                field(LastName; Rec.LastName)
                {
                    ApplicationArea = All;
                    Caption = 'Last Name';
                }
                field(Nickname; Rec.Nickname)
                {
                    ApplicationArea = All;
                    Caption = 'Nickname';
                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {

        }
    }
}