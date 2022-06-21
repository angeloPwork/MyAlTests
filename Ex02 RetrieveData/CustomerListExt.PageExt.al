// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        //UseGet();
        //UseFind();
        //UseFindSet();
        //UseSetCKey();
        //UseSetRange();
        UseSetFilter();

        //Message('App published: Hello world');
    end;

    local procedure UseSetFilter()
    var
        customer: Record Customer;
        SalesLine: Record "Sales Line";
        DocumentNo: Text;
    begin
        /*
        SetFilter(Field, String, [Value1], [Value2], …)

        customer.SetFilter("No.", '> 10000 & <> 20000');

        value1 := '10000';
        value2 := '20000';        
        customer.SetFilter("No.", '>%1&<>%2', value1, value2);
        */

        customer.SetRange("No.", '10000', '90000');
        customer.SetFilter(City, '@B*'); //@ = case insensitive B* = start with B
        customer.SetFilter("Country/Region Code", 'B*'); //B* = start with B
        if customer.FindSet() then
            repeat
                Message('%1', customer);
            until customer.Next() = 0
        else
            Message('Unable to find records with filter 1');


        customer.Reset(); //Reset all the filters (SetRange, SetFilter) for the record


        customer.SetFilter("No.", '10000|20000|30000');
        if customer.FindSet() then
            repeat
                Message('%1', customer);
            until customer.Next() = 0
        else
            Message('Unable to find records with filter 2');


        DocumentNo := '10000';
        SalesLine.SetRange("Document No.", DocumentNo);
        if (SalesLine.IsEmpty()) then
            Message('No sales line records found for document %1', DocumentNo)
        else
            Message('Found record %1', SalesLine);
    end;

    local procedure UseSetRange()
    var
        customer: Record Customer;
    begin
        customer.SetRange("No.", '10000', '40000');
        customer.FindSet();
        repeat
            Message('%1', customer);
        until customer.Next() = 0;


        customer.SetRange("No."); // Removing filter on "No." field
        customer.FindSet();
        repeat
            Message('%1', customer);
        until customer.Next() = 0;
    end;

    local procedure UseSetCKey()
    var
        customer: Record Customer;
    begin
        customer.SetCurrentKey(City);

        customer.FindFirst();
        Message('%1', customer);
    end;

    local procedure UseFindSet()
    var
        customer: Record Customer;
    begin
        customer.FindSet();
        // SELECT * FROM Customer
        repeat
            // process record
            Message(customer.Name);
        until customer.Next() = 0;
    end;

    local procedure UseFind()
    var
        customer: Record Customer;
    begin
        customer.Find('-');
        // SELECT * FROM Customer
        Message('%1', customer.Name);

        customer.Find('+');
        // SELECT * FROM Customer Order By No. Desc
        Message('%1', customer.Name);

        customer.FindFirst();
        // SELECT TOP 1 * FROM Customer
        Message('%1', customer.Name);

        customer.FindLast();
        // SELECT TOP 1 * FROM Customer Order By No. Desc
        Message('%1', customer.Name);
    end;

    local procedure UseGet()
    var
        customer: Record Customer;
    begin
        customer.Get('30000');

        if customer.Get('10000') then
            Message('%1', customer)
        else
            Error('Not found');
    end;
}