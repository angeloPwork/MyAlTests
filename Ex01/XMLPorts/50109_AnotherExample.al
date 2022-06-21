xmlport 50109 MyXmlportTest1
{
    schema
    {
        textelement(NodeName1)
        {
            tableelement(NodeName2; Customer)
            {
                fieldattribute(NodeName3; NodeName2.Name)
                {

                }
                fieldattribute(NodeName3; NodeName2."Name 2")
                {

                }
            }
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    field(Name; 'SourceExpression')
                    {

                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {

                }
            }
        }
    }

    var
        myInt: Integer;
}