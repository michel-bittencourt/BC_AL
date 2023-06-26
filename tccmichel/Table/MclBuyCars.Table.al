table 50203 BuyCarsTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "CodeCar"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "CodeBrand"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "CodeModel"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Year"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        //key(Key1; "codeCar")
        //{
        //   Clustered = true;
        //}
    }
}