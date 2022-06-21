// The following code creates an event subscriber codeunit.
// It declares the `CheckAddressLine` event subscriber that listens for OnAddressLineChanged event.
// The event subscriber displays a message in the client when '+' is used in the **Address** field.

codeunit 50101 MySubscribers
{
    //Set the event subscribers to bind automatically to the event
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"MyPublishers", 'OnAddressLineChanged', '', true, true)]
    procedure CheckAddressLine(line: Text[100]);
    begin
        if (STRPOS(line, '+') > 0) then
            MESSAGE('Can''t use a plus sign (+) in the address [' + line + ']');
    end;
}
