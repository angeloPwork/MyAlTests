interface "IAddressProvider"
{
    procedure GetAddress(): Text
}

codeunit 50107 CompanyAddressProvider implements IAddressProvider
{

    procedure GetAddress(): Text;
    var
        ExampleAddressLbl: Label 'Company address \ Denmark 2800';

    begin
        exit(ExampleAddressLbl);
    end;
}

codeunit 50108 PrivateAddressProvider implements IAddressProvider
{

    procedure GetAddress(): Text;
    var
        ExampleAddressLbl: Label 'My Home address \ Denmark 2800';

    begin
        exit(ExampleAddressLbl);
    end;
}

enum 50107 SendTo implements IAddressProvider
{
    Extensible = true;

    value(0; Company)
    {
        Implementation = IAddressProvider = CompanyAddressProvider;
    }

    value(1; Private)
    {
        Implementation = IAddressProvider = PrivateAddressProvider;
    }
}

page 50107 MyAddressPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(MyGroup)
            {
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GetAddress)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    AddressProvider: Interface IAddressProvider;
                begin
                    AddressproviderFactory(AddressProvider);
                    Message(AddressProvider.GetAddress());
                end;
            }

            action(SendToHome)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    sendTo := sendTo::Private;
                end;
            }

            action(SendToWork)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    sendTo := sendTo::Company;
                end;
            }
        }
    }

    local procedure AddressproviderFactory(var iAddressProvider: Interface IAddressProvider)
    begin
        iAddressProvider := sendTo;
    end;

    var
        sendTo: enum SendTo;
}