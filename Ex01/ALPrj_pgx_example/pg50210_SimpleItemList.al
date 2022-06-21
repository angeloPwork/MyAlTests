page 50110 SimpleItemList
{
    PageType = List;
    SourceTable = Item;
    UsageCategory = Lists;
    AccessByPermission = page SimpleItemList = X;
    ApplicationArea = All;
    AdditionalSearchTerms = 'product, merchandise';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.") { }
                field(Name; Name) { }
                field(Description; Description) { }
            }
        }
    }
}