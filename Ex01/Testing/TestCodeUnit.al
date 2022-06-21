codeunit 50110 MyTestCodeunit
{
    SubType = Test;

    trigger OnRun()
    var
        CustomerCard: Record Customer;
    begin
        if CustomerCard."No." <> CustomerCard."Salesperson Code" then
            error('Page part data is not updated.');
    end;

    var
        myInt: Integer;
}