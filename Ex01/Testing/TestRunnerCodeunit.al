codeunit 50111 MyTestRunnerCodeunit
{
    Subtype = TestRunner;

    trigger OnBeforeTestRun(CodeunitId: Integer; CodeunitName: Text; FunctionName: Text; Permissions: TestPermissions): Boolean
    var
        myInt: Integer;
    begin
        // Perform preprocessing
    end;

    trigger OnRun()
    begin
        Codeunit.RUN(Codeunit::"ERM Vendor Statistics");
        Codeunit.RUN(Codeunit::"ERM Sales Quotes");
        Codeunit.RUN(Codeunit::"ERM Dimension");
    end;

    trigger OnAfterTestRun(CodeunitId: Integer; CodeunitName: Text; FunctionName: Text; Permissions: TestPermissions; Success: Boolean)
    var
        myInt: Integer;
    begin
        // Perform postprocessing
    end;
}




codeunit 50112 TestRunnerCodeunit
{
    Subtype = TestRunner;

    trigger OnRun()
    var
        EnabledTestCodeunit: Record "CAL Test Enabled Codeunit";
        Object: Record "Object";
    begin
        if EnabledTestCodeunit.FINDSET then
            repeat
                if Object.GET(ObjectType::Codeunit, '', EnabledTestCodeunit."Test Codeunit ID") then
                    CODEUNIT.RUN(EnabledTestCodeunit."Test Codeunit ID");
            until EnabledTestCodeunit.NEXT = 0

    end;
}