page 50105 "Proof-A RoleCenterHeadline"
{
    PageType = HeadLinePart;

    layout
    {
        area(Content)
        {
            field(Headline1; hdl1Txt)
            { }
            field(Headline2; hdl2Txt)
            {
                Visible = false;
            }
            field(Headline3; hdl3Txt)
            {
                trigger OnDrillDown()
                var
                    DrillDownURLTxt: Label 'https://go.microsoft.com/fwlink/?linkid=867580', Locked = True;
                begin
                    Hyperlink(DrillDownURLTxt)
                end;
            }
            field(Headline4; hdl4Txt)
            { }
        }
    }

    var
        hdl1Txt: Label '<qualifier>The first headline</qualifier><payload>This is the <emphasize>Headline 1</emphasize>.</payload>';
        hdl2Txt: Label '<qualifier>The second headline</qualifier><payload>This is the <emphasize>Headline 2</emphasize>.</payload>';
        hdl3Txt: Label '<qualifier>The third headline</qualifier><payload>This is the <emphasize>Headline 3</emphasize>.</payload>';
        hdl4Txt: Label '<qualifier>The fourth headline</qualifier><payload>This is the <emphasize>Headline 4</emphasize>.</payload>';
}