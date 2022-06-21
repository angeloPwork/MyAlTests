// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message('App published: Hello world');

        //UseInsertCustomer();
        //UseModifyCustomer1();
        //UseModifyCustomer2();
        //UseDeleteCustomer1();
    end;

    local procedure UseDeleteCustomer2()
    var
        customer: Record Customer;
    begin
        customer.SetRange("Salesperson Code", 'PS');
        customer.DeleteAll();
    end;

    local procedure UseDeleteCustomer1()
    var
        customer: Record Customer;
    begin
        customer.Get('4711');
        customer.Delete(true);
    end;

    local procedure UseModifyCustomer2()
    var
        customer: Record Customer;
    begin
        customer.SetRange("Salesperson Code", 'PS');
        customer.ModifyAll("Salesperson Code", 'JR');
    end;

    local procedure UseModifyCustomer1()
    var
        customer: Record Customer;
    begin
        customer.Get('4711');
        customer.Name := 'Richard Roe';
        customer.Modify();
    end;

    local procedure UseInsertCustomer()
    var
        customer: Record Customer;
    begin
        customer.Init();
        customer."No." := '4711';
        customer.Name := 'John Doe';
        customer.Insert(true);

        Message('App published: Hello world');
    end;
}