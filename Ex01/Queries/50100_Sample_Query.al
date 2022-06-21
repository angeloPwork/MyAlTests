query 50100 "Sample Query"
{
    QueryType = Normal;
    Caption = 'Sales Overview';

    elements
    {
        dataitem(Salesperson_Purchaser; "Salesperson/Purchaser")
        {
            column(Salesperson; Name)
            {

            }
            dataitem(Sales_Header; "Sales Header")
            {
                DataItemLink = "Salesperson Code" = Salesperson_Purchaser.Code;
                SqlJoinType = InnerJoin;
                /*
SELECT "Salesperson/Purchaser".Name, "Sales Header"."No.", "Sales Header"."Sell-to Customer Name"
FROM "Salesperson/Purchaser" INNER JOIN "Sales Header"
  ON "Salesperson/Purchaser".Code = "Sales Header"."Salesperson Code"

-- same result as

SELECT "Salesperson/Purchaser".Name, "Sales Header"."No.", "Sales Header"."Sell-to Customer Name"  
FROM "Salesperson/Purchaser", "Sales Header"  
WHERE "Salesperson/Purchaser".Code = "Sales Header"."Salesperson Code"
                */

                column(Order_Number; "No.")
                {

                }
                column(Sell_to_Customer; "Sell-to Customer Name")
                {

                }
                dataitem(Sales_Line; "Sales Line")
                {
                    DataItemLink = "Sell-to Customer No." = Sales_Header."Sell-to Customer No.";
                }
            }
        }
    }
}