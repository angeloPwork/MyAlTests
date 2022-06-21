codeunit 50100 "Proof-a Import Employees"
{
    // trigger OnRun()
    // begin end;
    // var
    //     myInt: Integer;

    procedure ProcessImportedEmployees()
    var
        address_ProofAAddress: Record "Proof-A Address";
        employee_ProofAEmployee: Record "Proof-A Employee";
        employee2_ProofAEmployee: Record "Proof-A Employee";
        tmp_ProofAImportEmployee: Record "Proof-A Import Employee";
        lastEmployeeId: Integer;
    begin
        //Parse each imported record splitting them into addresses and employees
        if tmp_ProofAImportEmployee.FindSet() then begin
            address_ProofAAddress.SetCurrentKey(City, State, Zip);
            repeat
                //Search for an exixting Address otherwise create it.
                address_ProofAAddress.Reset();
                address_ProofAAddress.SetFilter(City, tmp_ProofAImportEmployee.City);
                address_ProofAAddress.SetFilter(State, tmp_ProofAImportEmployee.State);
                address_ProofAAddress.SetFilter(Zip, tmp_ProofAImportEmployee.Zip);
                if not address_ProofAAddress.FindFirst() then begin
                    address_ProofAAddress.Id :=
                        CopyStr(tmp_ProofAImportEmployee.City, 1, 7)
                        + CopyStr(tmp_ProofAImportEmployee.State, 1, 7)
                        + CopyStr(tmp_ProofAImportEmployee.Zip, 1, 6);
                    address_ProofAAddress.Validate(City, tmp_ProofAImportEmployee.City);
                    address_ProofAAddress.Validate(State, tmp_ProofAImportEmployee.State);
                    address_ProofAAddress.Validate(Zip, tmp_ProofAImportEmployee.Zip);
                    if not address_ProofAAddress.Insert() then Error('Unable to insert record in table Proof-A Address');
                end;

                //Search for a existing employee otherwise create it
                employee_ProofAEmployee.Reset();
                employee_ProofAEmployee.SetFilter(FirstName, tmp_ProofAImportEmployee.FirstName);
                employee_ProofAEmployee.SetFilter(LastName, tmp_ProofAImportEmployee.LastName);
                employee_ProofAEmployee.SetFilter(ContactNo, tmp_ProofAImportEmployee.ContactNo);
                employee_ProofAEmployee.SetFilter(Email, tmp_ProofAImportEmployee.Email);
                employee_ProofAEmployee.SetFilter(AddressId, address_ProofAAddress.Id);
                if not employee_ProofAEmployee.FindFirst() then begin //Errore su table vuota
                    if employee2_ProofAEmployee.FindLast() then
                        lastEmployeeId := employee2_ProofAEmployee.Id
                    else
                        lastEmployeeId := 0;
                    employee_ProofAEmployee.Validate(Id, lastEmployeeId + 1);
                    employee_ProofAEmployee.Validate(FirstName, tmp_ProofAImportEmployee.FirstName);
                    employee_ProofAEmployee.Validate(LastName, tmp_ProofAImportEmployee.LastName);
                    employee_ProofAEmployee.Validate(ContactNo, tmp_ProofAImportEmployee.ContactNo);
                    employee_ProofAEmployee.Validate(Email, tmp_ProofAImportEmployee.Email);
                    employee_ProofAEmployee.Validate(AddressId, address_ProofAAddress.Id);
                    if not employee_ProofAEmployee.Insert() then Error('Unable to insert record in table Proof-A Employee');
                end;

                //Delete the imported record
                tmp_ProofAImportEmployee.Delete();
            until tmp_ProofAImportEmployee.Next() = 0;
        end;
    end;
}