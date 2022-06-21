page 50111 "Proof-A RoleCenter"
{
    PageType = RoleCenter;
    Caption = 'Proof-A Rolecenter caption';
    Description = 'Proof-A Rolecenter tooltip';
    UsageCategory = Administration;

    layout
    {
        area(RoleCenter)
        {
            group(Group1)
            {
                part(Part1; "Proof-A RoleCenterHeadline")
                {
                    ApplicationArea = All;
                }

                part(Part2; "Proof-A SalesInvoiceCuePage")
                {
                    Caption = 'RC CUES Invoices';
                }
            }
            part(MeteoPart; Meteo)       //ADD Meteo Part
            {
                ApplicationArea = All;

            }
            part(StocksPart; Stocks)      //ADD Stock Part
            {
                ApplicationArea = All;

            }
            part(ExchangePart; Exchange)    //ADD Exchange Part
            {
                ApplicationArea = All;

            }
        }
    }

    actions
    {
        area(Sections) //Top menu
        {
            group(SectionsGroupName)
            {
                Caption = 'Top group';
                ToolTip = 'Top group';

                action("Proof-A Employee List_2")
                {
                    Caption = 'Proof-A Employee List';
                    ToolTip = 'Proof-A Employee List';
                    ApplicationArea = All;
                    RunObject = Page "Proof-A Employee List";
                }
                action("Proof-A Address Card")
                {
                    Caption = 'Proof-A Address List';
                    ToolTip = 'Proof-A Address List';
                    ApplicationArea = All;
                    RunObject = Page "Proof-A Address List";
                }
            }
            group(PostedInvoices)
            {
                Caption = 'ie Posted Invoices';
                Image = RegisteredDocs;

                action(PostedServiceInvoices)
                {
                    Caption = 'ie Posted Service Invoices';
                    ApplicationArea = All;
                    RunObject = Page "Posted Service Invoices";
                }

                action(PostedSalesInvoices)
                {
                    Caption = 'ie Posted Sales Invoices';
                    ApplicationArea = All;
                    RunObject = Page "Posted Sales Invoices";
                }

                group(SalesDocuments)
                {
                    Caption = 'Sales Documents';
                    action("Sales Document Entity")
                    {
                        ApplicationArea = All;
                        RunObject = page "Sales Document Entity";
                    }
                    action("Sales Document Line Entity")
                    {
                        ApplicationArea = All;
                        RunObject = page "Sales Document Line Entity";
                    }
                }
            }
        }
        area(Embedding) //Second line menu
        {
            action("Proof-A Address List")
            {
                Caption = 'Proof-A Address List';
                ToolTip = 'Proof-A Address List';
                ApplicationArea = All;
                RunObject = Page "Proof-A Address List";
            }
            action(EList)
            {
                Caption = 'Proof-A Employee List';
                ToolTip = 'Proof-A Employee List';
                ApplicationArea = All;
                RunObject = Page "Proof-A Employee List";
            }
            action(IEList)
            {
                Caption = 'Proof-A Import Employee List';
                ToolTip = 'Proof-A Import Employee List';
                ApplicationArea = All;
                RunObject = Page "Proof-A Import Employee List";
            }
            action(Sales)
            {
                Caption = 'Sales lists';
                RunObject = Page "Sales list";
                ApplicationArea = All;
            }

            action(Services)
            {
                Caption = 'Service lists';
                RunObject = Page "Service list";
                ApplicationArea = All;

            }
        }
        area(Creation) //Action bar menu (top dx of content) first content
        {
            action("Proof-A Import Employee List_2")
            {
                Caption = 'Proof-A Import Employee List';
                ToolTip = 'Proof-A Import Employee List';
                ApplicationArea = All;
                RunObject = Page "Proof-A Import Employee List";
            }
            action(AddSalesInvoice)
            {
                Caption = 'Add Sales Invoice';
                ToolTip = 'Add Sales Invoice';
                Image = NewInvoice;
                RunObject = Page "Sales Invoice";
                RunPageMode = Create;
            }
        }
        area(Processing) //Action bar menu (top dx of content) second content
        {
            group(Other)
            {
                Caption = 'Other Proof-A pages...';
                ToolTip = 'Other Proof-A pages...';

                action("Proof-A Address List_3")
                {
                    Caption = 'Proof-A Address List';
                    ToolTip = 'Proof-A Address List';
                    ApplicationArea = All;
                    RunObject = Page "Proof-A Address List";
                }
                action("Proof-A Employee List_3")
                {
                    Caption = 'Proof-A Employee List';
                    ToolTip = 'Proof-A Employee List';
                    ApplicationArea = All;
                    RunObject = Page "Proof-A Employee List";
                }
            }
            action(SeeSalesInvoices)
            {
                Caption = 'See Sales Invoices';
                ToolTip = 'See Sales Invoices';
                ApplicationArea = All;
                RunObject = Page "Posted Sales Invoices";
            }
        }
        area(Reporting) //Action bar menu (top dx of content) last content
        {
            action(MyRDLReport)
            {
                Caption = 'My RDL Report';
                ToolTip = 'My RDL Report';
                Image = "Report";
                RunObject = Report "Proof-A MyRdlReport";
                // trigger OnAction();
                // begin
                //     report.Run(Report::"Proof-A MyRdlReport");
                // end;
            }
            action(SalesInvoicesReport)
            {
                Caption = 'Sales Invoices Report';
                ToolTip = 'Sales Invoices Report';
                Image = "Report";
                RunObject = Report "Standard Sales - Invoice";
            }
        }
    }
}
