// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    //https://docs.microsoft.com/it-it/learn/modules/manipulate-data-via-code/5-field-functions-
    trigger OnOpenPage();
    begin
        //UseCalcFields();
        //UseAutoCalcFields();
        //UseCalcSum();
        //UseFieldError()
        //UseTestField();
        UseValidate();
    end;

    local procedure UseValidate()
    var
        customer: Record Customer;
    begin
        Customer."Phone No." := '1234567891234';
        customer.Validate("Phone No.");

        //È possibile usare anche la funzione Validate per assegnare un valore ed eseguire il trigger OnValidate.
        customer.Validate("Phone No.", '1234567891234');
    end;

    local procedure UseTestField()
    var
        customer: Record Customer;
    begin
        //Se il campo è vuoto, la funzione TestField genererà un errore di runtime.
        customer.TestField("Salesperson Code");

        //Verifica se un campo contiene un valore specifico o meno
        customer."Salesperson Code" := 'DK';
        customer.TestField("Salesperson Code", 'ZX');
    end;

    local procedure UseFieldError()
    var
        item: Record Item;
    begin
        if item."Unit Price" < 10 then
            //Crea un messaggio di errore per un campo specifico.
            //Il campo sarà visualizzato con un bordo rosso, indicante che si è verificato un errore con il valore di questo campo
            item.FieldError("Unit Price", 'must be greater than 10');
    end;

    local procedure UseCalcSum()
    var
        salesInvoiceHeader: Record "Sales Invoice Header";
    begin
        salesInvoiceHeader.SetCurrentKey("Bill-to Customer No.");
        salesInvoiceHeader.SetRange("Bill-to Customer No.", '10000', '50000');
        salesInvoiceHeader.SetRange("Document Date", 0D, Today());
        salesInvoiceHeader.CalcSums(Amount);

        Message('The total is %1', salesInvoiceHeader.Amount);
    end;

    local procedure UseAutoCalcFields()
    var
        customer: Record Customer;
    begin
        // Using SETAUTOCALCFIELDS
        customer.SetAutoCalcFields(Balance, "Net Change");
        if customer.FindSet() then
            repeat
            // Do some additional processing
            until customer.Next() = 0;
    end;

    local procedure UseCalcFields()
    var
        customer: Record Customer;
    begin
        customer.SetRange("Date Filter", 0D, Today());

        // Using CALCFIELDS
        if customer.FindSet() then
            repeat
                customer.CalcFields(Balance, "Net Change");
            // Do some additional processing
            until customer.Next() = 0;
    end;
}