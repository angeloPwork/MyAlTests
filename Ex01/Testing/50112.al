codeunit 50112 "ERM Vendor Discount"
{
    // Specifies the codeunit to be a test codeunit
    Subtype = Test;

    trigger OnRun()
    begin

    end;

    // Makes the method a test method
    [Test]

    // Adds the test logic to the test method
    procedure PurchInvDiscCalculationPInvAbove()

    var
        PurchLine: Record "Purchase Line";
        MinAmount: Decimal;
        DocAmount: Decimal;
        DiscountPct: Decimal;
        PurchCalcDisc: Codeunit "Purch.-Calc.Discount";

    begin
        // [SCENARIO] "Inv. Discount Amount" should be calculated on Purchase Invoice (in LCY), where Invoice amount is
        // above the minimal amount required for invoice discount calculation.
        // [GIVEN] Vendor with invoice discount percentage "D" for minimal amount "A" in LCY
        // [GIVEN] Create purchase invoice with one line and amount >"A"
        DiscountPct := RandomNumberGenerator.RandDec(100, 5);
        MinAmount := RandomNumberGenerator.RandDec(1000, 2);
        DocAmount := MinAmount + RandomNumberGenerator.RandDec(100, 2);
        CreatePurchDocument(PurchLine, PurchLine."Document Type"::Invoice, DocAmount, MinAmount, DiscountPct);
        // [WHEN] Calculate invoice discount for purchase document (line)
        PurchCalcDisc.RUN(PurchLine);
        // [THEN] "Inv. Discount Amount" = Amount "A" * discount "D" / 100
        PurchLine.Find;
        Assert.AreEqual(Round(PurchLine."Line Amount" * DiscountPct / 100), PurchLine."Inv. Discount Amount", PurchInvDiscErr);
    end;

    // Creates the test helper method
    local procedure CreatePurchDocument(var PurchLine: Record "Purchase Line"; DocumentType: Option; DocAmount: Decimal; MinAmount: Decimal; DiscountPct: Decimal)

    var
        VendorInvoiceDisc: Record "Vendor Invoice Disc.";
        PurchaseHeader: Record "Purchase Header";
        VendorNo: Code[30];

    begin
        // Create vendor
        VendorNo := LibraryPurchase.CreateVendorNo;
        // Create vendor invoice discount
        VendorInvoiceDisc.Init;
        VendorInvoiceDisc.Code := VendorNo;
        VendorInvoiceDisc.Validate("Currency Code", '');
        VendorInvoiceDisc.Validate("Minimum Amount", MinAmount);
        VendorInvoiceDisc.Validate("Discount %", DiscountPct);
        VendorInvoiceDisc.Insert(TRUE);
        // Create purchase line
        LibraryPurchase.CreatePurchaseDocumentWithItem(PurchaseHeader, Purchline, DocumentType, VendorNo, '', 1, '', 0D);
        PurchLine.Validate("Direct Unit Cost", DocAmount);
        PurchLine.Modify(TRUE);
    end;

    var
        RandomNumberGenerator: Codeunit "Library - Random";
        LibraryPurchase: Codeunit "Library - Purchase";
        Assert: Codeunit Assert;
        myInt: Integer;
        PurchInvDiscErr: Label 'The Purchase Invoice Discount Amount was not calculated correctly.';

}