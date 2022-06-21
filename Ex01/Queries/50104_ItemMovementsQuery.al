query 50104 "Item Movements"
{
    QueryType = Normal;

    elements
    {
        // This dataitem corresponds to the `Item` record variable in the record variable example. 
        dataitem(Item; Item)
        {
            column(No_; "No.")
            {
            }
            column(Description; Description)
            {
            }

            // This dataitem corresponds to the `ItemLedgerEntry` record variable in the record variable example. 
            dataitem(Item_Ledger_Entry; "Item Ledger Entry")
            {
                // The DataItemLink and  SqlJoinType settings correspond to the `ItemLedgerEntry.SETRANGE("Item No.",Item."No.");` statement in the record variable example.
                DataItemLink = "Item No." = Item."No.";
                SqlJoinType = InnerJoin;

                filter(Entry_Type; "Entry Type")
                {
                }

                column(Item_No_; "Item No.")
                {
                }

                column(Posting_Date; "Posting Date")
                {
                }

                // The SUM corresponds to the `TotalQty := TotalQty + ItemLedgerEntry.Quantity;` statement in the record variable example.
                column(Sum_Quantity; Quantity)
                {
                    Method = Sum;
                }
            }
        }
    }
}

codeunit 50104 "Item Movements"
{
    trigger OnRun()
    begin

    end;

    // Create and insert a reward level in the "Reward" table.
    procedure DoSomething(); //(ID: Code[30]; Description: Text[250]; Discount: Decimal);
    var
        // Reward: Record Reward;
        ItemMovements: Query "Item Movements";
    begin
        /*
        ItemMovements.TopNumberOfRows(5);
        ItemMovements.SetRange(Entry_Type, ItemMovements.Entry_Type::Sale);
        ItemMovements.Open;
        while ItemMovements.Read do
            OutputData(2, ItemMovements.Item_No, ItemMovements.Description, ItemMovements.Posting_Date, ItemMovements.Sum_Quantity);
        */

        // Reward."Reward ID" := ID;
        // Reward.Description := Description;
        // Reward."Discount Percentage" := Discount;
        // Reward.Insert();
    end;

    var
        myInt: Integer;
}