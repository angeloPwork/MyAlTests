// The following code extends the Customer Card page to raise the `OnAddressLineChanged` event
// when the Address field is changed.
pageextension 50149 CustomEvent extends "Customer Card"
{
    layout
    {
        modify(Address)
        {
            trigger OnBeforeValidate();
            var
                Publisher: Codeunit MyPublishers;
            begin
                Publisher.OnAddressLineChanged(Rec.Address);
            end;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    // var
    //     myInt: Integer;

    // trigger OnOpenPage();
    // begin
    //     Message('App published: Hello world');
    // end;
}
