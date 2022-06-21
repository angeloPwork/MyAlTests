// https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-query-filters
query 50103 "Customer_Sales_Quantity 1"
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
                    Method = Sum;
                    ColumnFilter = Qty = filter(< 50);
                }

                filter(Location_Code; "Location Code")
                {
                    ColumnFilter = Location_Code = const('White');
                }
            }
        }
    }

    trigger OnBeforeOpen()
    begin
        currQuery.SETRANGE(Qty, 10, 50);
        currQuery.SETFILTER(Location_Code, '=RED');
    end;
}