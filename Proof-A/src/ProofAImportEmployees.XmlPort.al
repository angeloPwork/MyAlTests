xmlport 50100 "Proof-A Import Employees"
{
    Format = Xml;

    schema
    {
        textelement(Company)
        {
            tableelement(empTmp; "Proof-A Import Employee")
            {
                XmlName = 'Employee';
                fieldelement(FirstName; empTmp.FirstName)
                { }
                fieldelement(LastName; empTmp.LastName)
                { }
                fieldelement(ContactNo; empTmp.ContactNo)
                { }
                fieldelement(Email; empTmp.Email)
                { }
                textelement(Address)
                {
                    fieldelement(City; empTmp.City)
                    { }
                    fieldelement(State; empTmp.State)
                    { }
                    fieldelement(Zip; empTmp.Zip)
                    { }
                }
            }
        }
    }

    // requestpage
    // {
    //     layout
    //     {
    //         area(content)
    //         {
    //             group(GroupName)
    //             {
    //                 field(Name; SourceExpression)
    //                 {
    //                 }
    //             }
    //         }
    //     }

    //     actions
    //     {
    //         area(processing)
    //         {
    //             action(ActionName)
    //             {
    //             }
    //         }
    //     }
    // }

    // var
    //     myInt: Integer;
}