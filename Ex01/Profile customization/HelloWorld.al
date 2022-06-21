profile TheBoss
{
    Description = 'This is the profile for the Boss';
    RoleCenter = "Business Manager";
    Customizations = Configuration1, MyCustomization;
    Caption = 'Boss';
}

pagecustomization Configuration1 customizes "Business Manager Role Center"
{
    actions
    {
        // Hides the Customers action
        modify(Customers)
        {
            Visible = false;
        }
    }
}

pagecustomization MyCustomization customizes "Customer List"
{
    layout
    {
        // Moves the Balance (LCY) column after the Phone No. column
        moveafter("Phone No."; "Balance (LCY)")
    }
}