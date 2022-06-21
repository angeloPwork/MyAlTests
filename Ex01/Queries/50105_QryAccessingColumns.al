query 50105 "Customer_Sales_Quantity_2"
{
    QueryType = Normal;
    // Sets the results to only include the top forts the results in descending order
    TopNumberOfRows = 5;
    OrderBy = descending(Qty);

    elements
    {
        dataitem(C; Customer)
        {
            column(Customer_Number; "No.")
            {
            }

            column(Customer_Name; Name)
            {
            }

            dataitem(SL; "Sales Line")
            {
                DataItemLink = "Sell-to Customer No." = c."No.";
                SqlJoinType = InnerJoin;

                column(Qty; Quantity)
                {
                }
            }
        }
    }
}

codeunit 50105 QueryColumnAccess
{
    trigger OnRun()
    begin

        // Sets a filter to display only sales quantities greater than 20.  
        MyQuery.SETFILTER(Qty, '>20');
        // Runs the query.  
        MyQuery.OPEN;
        // Reads each row in the dataset and displays a message with column values.  
        // Stops reading when there are no more rows remaining in the dataset (READ is FALSE).  
        while MyQuery.READ do begin
            MESSAGE(Text000, MyQuery.Customer_Name, MyQuery.Qty);
        end;
        // Closes the query.  
        MyQuery.CLOSE;

    end;

    var
        MyQuery: Query "Customer_Sales_Quantity_2";

        Text000: Label 'Customer name = %1, Quantity = %2.';
}