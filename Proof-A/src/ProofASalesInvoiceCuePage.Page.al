page 50106 "Proof-A SalesInvoiceCuePage"
{
    PageType = CardPart;
    SourceTable = "Proof-A SalesInvoiceCueTable";

    layout
    {
        area(content)
        {
            cuegroup(SalesCueContainer)
            {
                Caption = 'CUEGROUP Sales Invoices';
                // CuegroupLayout=Wide;
                field(SalesCue; Rec.SalesInvoicesOpen)
                {
                    Caption = 'CUE Open';
                    ToolTip = 'CUE Open';
                    DrillDownPageId = "Sales Invoice List";
                }
            }
            cuegroup(SalesActionontainer2)
            {
                Caption = 'CUEGROUP New Sales Invoice';

                actions
                {

                    action(ActionName)
                    {
                        Caption = 'CUE Sales Invoice';
                        ToolTip = 'CUE Sales Invoice';
                        RunObject = page "Sales Invoice";
                        Image = TileNew;

                        trigger OnAction()
                        begin

                        end;
                    }
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
