query 50101 "Customer_Sales_Quantity"
{
    QueryType = Normal;

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
                DataItemTableFilter = Quantity = filter(> 10);

                column(Qty; Quantity)
                {
                    // Change the value of the property to perform a different aggregate method on grouped columns:
                    // Sum, Average, Max, Min, or Count
                    // Method = Sum|Average|Min|Max|Count;
                    Method = Sum;
                }
            }
        }
    }
}