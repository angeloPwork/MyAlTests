// The following code creates codeunit that publishes the `OnAddressLineChanged` event.

codeunit 50100 MyPublishers
{
    [IntegrationEvent(false, false)]
    procedure OnAddressLineChanged(line: Text[100])
    begin
    end;
}
