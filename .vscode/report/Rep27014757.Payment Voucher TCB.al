report 27014757 "TACO Payment Voucher TCB"
{
    // version NWV-TACO

    RDLCLayout = './.vscode/rdlc/TACO-Payment Voucher TCB.rdl';
    WordLayout = './.vscode/rdlc/TACO-Payment Voucher TCB.docx';
    DefaultLayout = Word;
    UseRequestPage = true;

    dataset
    {
        dataitem(GenJournalLine; "Gen. Journal Line")
        {
            DataItemTableView = SORTING("Document No.");
            RequestFilterFields = "Journal Template Name", "Journal Batch Name", "Document No.";
        }
        dataitem(MainData; "NWV Temporary Data Buffer")
        {
            DataItemTableView = SORTING("Key", "No.");
            column(Account_No; gCu_CoreEventMgt.FormatValue(Code_1))
            {
            }
            column(GL_Account_No; gCu_CoreEventMgt.FormatValue(Code_2))
            {
            }
            column(Document_No; gCu_CoreEventMgt.FormatValue(Code_3))
            {
            }
            column(External_Document_No; gCu_CoreEventMgt.FormatValue(Code_4))
            {
            }
            column(Currenry_Code; gCu_CoreEventMgt.FormatValue(Code_5))
            {
            }
            column(GL_Account_Name; gCu_CoreEventMgt.FormatValue(Text_1))
            {
            }
            column(GL_Account_Vietnamese_Name; gCu_CoreEventMgt.FormatValue(Text_2))
            {
            }
            column(Bank_Account_No; gCu_CoreEventMgt.FormatValue(Text_3))
            {
            }
            column(Bank_Account_Name; gCu_CoreEventMgt.FormatValue(Text_4))
            {
            }
            column(Bank_Account_Vietnamese_Name; gCu_CoreEventMgt.FormatValue(Text_5))
            {
            }
            column(Bank_Account_Fax_No; gCu_CoreEventMgt.FormatValue(Text_6))
            {
            }
            column(Bank_Account_Phone_No; gCu_CoreEventMgt.FormatValue(Text_7))
            {
            }
            column(Bank_Account_Address; gCu_CoreEventMgt.FormatValue(Text_8))
            {
            }
            column(Bank_Account_Branch_No; gCu_CoreEventMgt.FormatValue(Text_9))
            {
            }
            column(Bank_Account_Branch_Name; gCu_CoreEventMgt.FormatValue(Text_10))
            {
            }
            column(Source_Account_No; gCu_CoreEventMgt.FormatValue(Text_11))
            {
            }
            column(Source_Account_Name; gCu_CoreEventMgt.FormatValue(Text_12))
            {
            }
            column(Source_Account_Vietnamese_Name; gCu_CoreEventMgt.FormatValue(Text_13))
            {
            }
            column(Source_Account_Fax_No; gCu_CoreEventMgt.FormatValue(Text_14))
            {
            }
            column(Source_Account_Phone_No; gCu_CoreEventMgt.FormatValue(Text_15))
            {
            }
            column(Source_Account_Address; gCu_CoreEventMgt.FormatValue(Text_16))
            {
            }
            column(Source_Account_Branch_No; gCu_CoreEventMgt.FormatValue(Text_17))
            {
            }
            column(Source_Account_Branch_Name; gCu_CoreEventMgt.FormatValue(Text_18))
            {
            }
            column(Vietnamese_Description; gCu_CoreEventMgt.FormatValue(Text_19))
            {
            }
            column(Document_Date; gCu_CoreEventMgt.FormatValue(Date_1))
            {
            }
            column(Posting_Date; gCu_CoreEventMgt.FormatValue(Date_2))
            {
            }
            column(Credit_Amount; gCu_CoreEventMgt.FormatValue(Decimal_1))
            {
            }
            column(Debit_Amount; gCu_CoreEventMgt.FormatValue(Decimal_2))
            {
            }
            column(Credit_Amount_FCY; gCu_CoreEventMgt.FormatValue(Decimal_3))
            {
            }
            column(Debit_Amount_FCY; gCu_CoreEventMgt.FormatValue(Decimal_4))
            {
            }
            column(Currency_ExRate; gCu_CoreEventMgt.FormatValue(Decimal_5))
            {
            }
            column(Amount_In_Word; gCu_CoreEventMgt.FormatValue(Text_20))
            {
            }

            trigger OnAfterGetRecord();
            begin
                MainData.Text_11 := gTxt_Source_Account_No;
                MainData.Text_2 := gTxt_GL_Account_Vietnamese_Name;
                MainData.Text_16 := gTxt_Source_Account_Address;
                MainData.Text_13 := gText_Source_Account_Vietnamese_Name;
                MainData.MODIFY;
            end;
        }
        dataitem("Company Information"; "Company Information")
        {
            CalcFields = Picture;
            DataItemTableView = SORTING("Primary Key");
            column(L_Picture; Picture)
            {
            }
            column(L_CompName; gTxt_ExtLabel[1])
            {
            }
            column(L_CompName1; gCu_VASMgt.ReturnCompanyName)
            {
            }
            column(L_CompAddress; gTxt_ExtLabel[2])
            {
            }
            column(L_CompAddress1; gCu_VASMgt.ReturnCompanyAddress)
            {
            }
            column(L_Registration; gTxt_ExtLabel[3])
            {
            }
            column(L_Registration1; gCu_VASMgt.ReturnVATRegistration)
            {
            }
            column(L_PhoneNo; gTxt_ExtLabel[4] + '  ' + gCu_VASMgt.ReturnCompanyPhoneNo)
            {
            }
            column(L_FaxNo; gTxt_ExtLabel[5] + '  ' + gCu_VASMgt.ReturnCompanyFaxNo)
            {
            }
            column(L_StringFormat; gCu_VASMgt.ReturnFormatDecimal)
            {
            }
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(gTxt_Source_Account_No; gTxt_Source_Account_No)
                    {
                        Caption = 'Credit A/C No';
                    }
                    field(gTxt_GL_Account_Vietnamese_Name; gTxt_GL_Account_Vietnamese_Name)
                    {
                        Caption = 'Credit A/C Name';
                    }
                    field(gTxt_Source_Account_Address; gTxt_Source_Account_Address)
                    {
                        Caption = 'Credit A/C Address';
                    }
                    field(gText_Source_Account_Vietnamese_Name; gText_Source_Account_Vietnamese_Name)
                    {
                        Caption = 'Credit With Bank';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage();
        begin
            ProcessData;
        end;
    }

    labels
    {
    }

    var
        gCu_VASMgt: Codeunit "NWV VAS Management AL";
        gCu_AmountInWord: Codeunit "NWV Amount In Words";
        gCu_CoreEventMgt: Codeunit TACOUtility;
        gTxt_IntLabel: array[200] of Text;
        gTxt_ExtLabel: array[200] of Text;
        gRec_GLSetup: Record "General Ledger Setup";
        gInt_LineNo: Integer;
        gInt_Count: Integer;
        gTxt_PreparedBy: Text;
        gTxt_DimDesc: Text[100];
        gRec_DimSetEntry: Record "Dimension Set Entry";
        gBol_ShowDim: Boolean;
        gDec_ExchangeRate: Decimal;
        gCode_Currency: Code[10];
        gDec_Debit: Decimal;
        gDec_Credit: Decimal;
        gDec_Debit_FCY: Decimal;
        gDec_Credit_FCY: Decimal;
        gDec_Total: Decimal;
        gDec_Total_FCY: Decimal;
        "----": Integer;
        gRec_GenJournalLine: Record "Gen. Journal Line";
        gTxt_Source_Account_No: Text;
        gTxt_GL_Account_Vietnamese_Name: Text;
        gTxt_Source_Account_Address: Text;
        gText_Source_Account_Vietnamese_Name: Text;

    local procedure ProcessData();
    var
        lGLAccNo: Code[20];
        lGLName: Text;
        lGLVNName: Text;
    begin
        //Request - OnOpenPage
        gRec_GLSetup.GET;
        MainData.DELETEALL;

        MainData.INIT;
        MainData."No." := 1;
        MainData.INSERT;

        WITH gRec_GenJournalLine DO BEGIN
            RESET;
            COPYFILTERS(GenJournalLine);
            IF FINDSET THEN
                REPEAT
                    gInt_LineNo += 1;

                    lGLAccNo := '';
                    lGLName := '';
                    lGLVNName := '';

                    GetCreditDebit(1, Correction, "Amount (LCY)", "VAT Amount (LCY)", gDec_Debit, gDec_Credit, Amount, "VAT Amount", gDec_Debit_FCY, gDec_Credit_FCY);
                    InsertToMainData(gInt_LineNo, 1, "Account Type", "Account No.", gDec_Debit, gDec_Credit, gDec_Debit_FCY, gDec_Credit_FCY, "Currency Code");

                    IF "VAT Amount" <> 0 THEN BEGIN
                        GetCreditDebit(2, Correction, "Amount (LCY)", "VAT Amount (LCY)", gDec_Debit, gDec_Credit, Amount, "VAT Amount", gDec_Debit_FCY, gDec_Credit_FCY);
                        GetVATAcc("Gen. Posting Type", "VAT Bus. Posting Group", "VAT Prod. Posting Group", lGLAccNo, lGLName, lGLVNName);
                        InsertToMainData(gInt_LineNo, 2, "Account Type", "Account No.", gDec_Debit, gDec_Credit, gDec_Debit_FCY, gDec_Credit_FCY, "Currency Code");
                    END;

                    GetCreditDebit(3, Correction, "Amount (LCY)", "Bal. VAT Amount (LCY)", gDec_Debit, gDec_Credit, Amount, "Bal. VAT Amount", gDec_Debit_FCY, gDec_Credit_FCY);
                    InsertToMainData(gInt_LineNo, 3, "Bal. Account Type", "Bal. Account No.", gDec_Debit, gDec_Credit, gDec_Debit_FCY, gDec_Credit_FCY, "Currency Code");

                    IF "Bal. VAT Amount (LCY)" <> 0 THEN BEGIN
                        GetCreditDebit(4, Correction, "Amount (LCY)", "Bal. VAT Amount (LCY)", gDec_Debit, gDec_Credit, Amount, "Bal. VAT Amount", gDec_Debit_FCY, gDec_Credit_FCY);
                        GetVATAcc("Bal. Gen. Posting Type", "Bal. VAT Bus. Posting Group", "Bal. VAT Prod. Posting Group", lGLAccNo, lGLName, lGLVNName);
                        InsertToMainData(gInt_LineNo, 4, "Account Type", "Account No.", gDec_Debit, gDec_Credit, gDec_Debit_FCY, gDec_Credit_FCY, "Currency Code");
                    END;
                UNTIL NEXT = 0;

            gTxt_Source_Account_No := MainData.Text_11;
            gTxt_GL_Account_Vietnamese_Name := MainData.Text_2;
            gTxt_Source_Account_Address := MainData.Text_16;
            gText_Source_Account_Vietnamese_Name := MainData.Text_13;
        END;

        COMMIT;
    end;

    procedure InsertToMainData(pLineNo: Integer; pLineType: Integer; pAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner"; pAccNo: Code[20]; pDebit: Decimal; pCredit: Decimal; pDebit_FCY: Decimal; pCredit_FCY: Decimal; pCurrencyCode: Code[20]);
    var
        lGLAccNo: Code[20];
        lGLName: Text;
        lGLVNName: Text;
        lBankAccNo: Text;
        lBankName: Text;
        lBankVNName: Text;
        lBankFaxNo: Text;
        lBankPhoneNo: Text;
        lBankAddress: Text;
        lBankBranchNo: Text;
        lBankBrandName: Text;
    begin
        IF pAccNo = '' THEN EXIT;

        GetAcc(pAccType, pAccNo, gRec_GenJournalLine."Recipient Bank Account", lGLAccNo, lGLName, lGLVNName, lBankAccNo, lBankName, lBankVNName, lBankFaxNo, lBankPhoneNo, lBankAddress, lBankBranchNo, lBankBrandName);

        MainData.Code_1 := pAccNo;
        MainData.Code_2 := lGLAccNo;

        MainData.Date_1 := gRec_GenJournalLine."Document Date";
        MainData.Date_2 := gRec_GenJournalLine."Posting Date";


        IF (lGLName <> '') OR (MainData.Text_1 = '') THEN MainData.Text_1 := lGLName;
        IF (lGLVNName <> '') OR (MainData.Text_2 = '') THEN MainData.Text_2 := lGLVNName;

        IF MainData.Code_3 = '' THEN MainData.Code_3 := gRec_GenJournalLine."Document No.";
        IF MainData.Code_5 = '' THEN MainData.Code_5 := pCurrencyCode;
        IF MainData.Code_4 = '' THEN MainData.Code_4 := gRec_GenJournalLine."External Document No.";
        IF MainData.Text_19 = '' THEN MainData.Text_19 := gRec_GenJournalLine."NWV Vietnamese Description";

        CASE pAccType OF
            pAccType::"Bank Account":
                BEGIN
                    MainData.Text_3 := lBankAccNo;
                    MainData.Text_4 := lBankName;
                    MainData.Text_5 := lBankVNName;
                    MainData.Text_6 := lBankFaxNo;
                    MainData.Text_7 := lBankPhoneNo;
                    MainData.Text_8 := lBankAddress;
                    MainData.Text_9 := lBankBranchNo;
                    MainData.Text_10 := lBankBrandName;
                END;
            pAccType::Customer:
                BEGIN
                    MainData.Text_11 := lBankAccNo;
                    MainData.Text_12 := lBankName;
                    MainData.Text_13 := lBankVNName;
                    MainData.Text_14 := lBankFaxNo;
                    MainData.Text_15 := lBankPhoneNo;
                    MainData.Text_16 := lBankAddress;
                    MainData.Text_17 := lBankBranchNo;
                    MainData.Text_18 := lBankBrandName;
                END;
            pAccType::Vendor:
                BEGIN
                    MainData.Text_11 := lBankAccNo;
                    MainData.Text_12 := lBankName;
                    MainData.Text_13 := lBankVNName;
                    MainData.Text_14 := lBankFaxNo;
                    MainData.Text_15 := lBankPhoneNo;
                    MainData.Text_16 := lBankAddress;
                    MainData.Text_17 := lBankBranchNo;
                    MainData.Text_18 := lBankBrandName;
                END;
        END;

        MainData.Decimal_1 += pCredit;
        MainData.Decimal_2 += pDebit;
        MainData.Decimal_3 += pCredit_FCY;
        MainData.Decimal_4 += pDebit_FCY;

        gDec_Total += MainData.Decimal_1;
        gDec_Total_FCY += MainData.Decimal_3;

        IF gDec_Total_FCY <> 0 THEN
            gDec_ExchangeRate := gDec_Total / gDec_Total_FCY
        ELSE
            gDec_ExchangeRate := 0;
        MainData.Decimal_5 := gDec_ExchangeRate;

        MainData.Text_20 := gCu_AmountInWord.Amount2VNWordWithCurrencyRTC(pCredit_FCY, pCurrencyCode);
        MainData.MODIFY;
    end;

    procedure GetAcc(pAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner"; pAccNo: Code[20]; pPrivateBankAccount: Code[20]; var pGLAccNo: Code[20]; var pGLName: Text; var pGLVNName: Text; var pBankAccNo: Text; var pBankName: Text; var pBankVNName: Text; var pBankFaxNo: Text; var pBankPhoneNo: Text; var pBankAddress: Text; var pBankBranchNo: Text; var pBankBrandName: Text);
    var
        lRec_CustPostingGroup: Record "Customer Posting Group";
        lRec_VendorPostingGroup: Record "Vendor Posting Group";
        lRec_BankAccPostingGroup: Record "Bank Account Posting Group";
        lRec_FAPostingGroup: Record "FA Posting Group";
        lRec_Customer: Record Customer;
        lRec_Vendor: Record Vendor;
        lRec_Bank: Record "Bank Account";
        lRec_GLAcc: Record "G/L Account";
        lRec_FA: Record "Fixed Asset";
        lRec_VendorBankAccount: Record "Vendor Bank Account";
        lRec_CustomerBankAccount: Record "Customer Bank Account";
    begin
        pGLAccNo := '';
        pGLName := '';
        pGLVNName := '';

        CASE pAccType OF
            pAccType::Customer:
                BEGIN
                    IF lRec_Customer.GET(pAccNo) THEN
                        IF lRec_CustPostingGroup.GET(lRec_Customer."Customer Posting Group") THEN BEGIN
                            pGLAccNo := lRec_CustPostingGroup."Receivables Account";
                            //IF lRec_GLAcc.GET(pGLAccNo) THEN BEGIN
                            //  pGLName :=lRec_GLAcc.Name;
                            //  pGLVNName := lRec_GLAcc."NWV Vietnamese Name";
                            //END;
                            pGLName := lRec_Customer.Name;
                            pGLVNName := lRec_Customer."NWV Vietnamese Name";
                            IF lRec_CustomerBankAccount.GET(lRec_Customer."No.", pPrivateBankAccount) THEN BEGIN
                                pBankAccNo := lRec_CustomerBankAccount."Bank Account No.";
                                pBankName := lRec_CustomerBankAccount.Name;
                                pBankVNName := lRec_CustomerBankAccount."NWV Vietnamese Name";
                                pBankFaxNo := lRec_CustomerBankAccount."Fax No.";
                                pBankPhoneNo := lRec_CustomerBankAccount."Phone No.";
                                pBankAddress := lRec_CustomerBankAccount.Address + lRec_CustomerBankAccount."Address 2";
                                pBankBranchNo := lRec_CustomerBankAccount."Bank Branch No.";
                                pBankBrandName := lRec_CustomerBankAccount."Name 2";
                            END;
                        END;
                END;
            pAccType::Vendor:
                BEGIN
                    IF lRec_Vendor.GET(pAccNo) THEN
                        IF lRec_VendorPostingGroup.GET(lRec_Vendor."Vendor Posting Group") THEN BEGIN
                            pGLAccNo := lRec_VendorPostingGroup."Payables Account";
                            //IF lRec_GLAcc.GET(pGLAccNo) THEN BEGIN
                            //  pGLName :=lRec_GLAcc.Name;
                            //  pGLVNName := lRec_GLAcc."NWV Vietnamese Name";
                            //END;
                            pGLName := lRec_Vendor.Name;
                            pGLVNName := lRec_Vendor."NWV Vietnamese Name";
                            IF lRec_VendorBankAccount.GET(lRec_Vendor."No.", pPrivateBankAccount) THEN BEGIN
                                pBankAccNo := lRec_VendorBankAccount."Bank Account No.";
                                pBankName := lRec_VendorBankAccount.Name;
                                pBankVNName := lRec_VendorBankAccount."NWV Vietnamese Name";
                                pBankFaxNo := lRec_VendorBankAccount."Fax No.";
                                pBankPhoneNo := lRec_VendorBankAccount."Phone No.";
                                pBankAddress := lRec_VendorBankAccount.Address + lRec_CustomerBankAccount."Address 2";
                                pBankBranchNo := lRec_VendorBankAccount."Bank Branch No.";
                                pBankBrandName := lRec_VendorBankAccount."Name 2";
                            END;
                        END;
                END;
            pAccType::"Bank Account":
                BEGIN
                    IF lRec_Bank.GET(pAccNo) THEN
                        IF lRec_BankAccPostingGroup.GET(lRec_Bank."Bank Acc. Posting Group") THEN BEGIN
                            pGLAccNo := lRec_BankAccPostingGroup."G/L Account No.";
                            //IF lRec_GLAcc.GET(pGLAccNo) THEN BEGIN
                            //  pGLName :=lRec_GLAcc.Name;
                            //  pGLVNName := lRec_GLAcc."NWV Vietnamese Name";
                            //END;
                            //pGLName :=lRec_Bank.Name;
                            //pGLVNName := lRec_Bank."NWV Vietnamese Name";

                            pBankAccNo := lRec_Bank."Bank Account No.";
                            pBankName := lRec_Bank.Name;
                            pBankVNName := lRec_Bank."NWV Vietnamese Name";
                            pBankFaxNo := lRec_Bank."Fax No.";
                            pBankPhoneNo := lRec_Bank."Phone No.";
                            pBankAddress := lRec_Bank.Address + lRec_CustomerBankAccount."Address 2";
                            pBankBranchNo := lRec_Bank."Bank Branch No.";
                            pBankBrandName := lRec_Bank."Name 2";
                        END;
                END;
            pAccType::"Fixed Asset":
                BEGIN
                    IF lRec_FA.GET(pAccNo) THEN
                        IF lRec_FAPostingGroup.GET(lRec_FA."FA Posting Group") THEN BEGIN
                            //pAccNo1:=lRec_BankAccPostingGroup."G/L Bank Account No.";
                            CASE gRec_GenJournalLine."FA Posting Type" OF
                                gRec_GenJournalLine."FA Posting Type"::"Acquisition Cost":
                                    pGLAccNo := lRec_FAPostingGroup."Acquisition Cost Account";
                                gRec_GenJournalLine."FA Posting Type"::Appreciation:
                                    pGLAccNo := lRec_FAPostingGroup."Acquisition Cost Account";
                                gRec_GenJournalLine."FA Posting Type"::Depreciation:
                                    pGLAccNo := lRec_FAPostingGroup."Accum. Depr. Acc. on Disposal";
                                gRec_GenJournalLine."FA Posting Type"::"Write-Down":
                                    pGLAccNo := lRec_FAPostingGroup."Write-Down Account";
                                gRec_GenJournalLine."FA Posting Type"::Disposal:
                                    pGLAccNo := lRec_FAPostingGroup."Sales Acc. on Disp. (Gain)";
                            END;
                            //IF lRec_GLAcc.GET(pGLAccNo) THEN BEGIN
                            //  pGLName :=lRec_GLAcc.Name;
                            //  pGLVNName := lRec_GLAcc."NWV Vietnamese Name";
                            //END;
                            pGLName := lRec_FA.Description;
                            pGLVNName := lRec_FA."NWV Vietnamese Description";
                        END;
                END;

            pAccType::"G/L Account":
                BEGIN
                    pGLAccNo := pAccNo;
                    IF lRec_GLAcc.GET(pGLAccNo) THEN BEGIN
                        //pGLName :=lRec_GLAcc.Name;
                        //pGLVNName := lRec_GLAcc."NWV Vietnamese Name";
                    END;
                END;
        END;
    end;

    procedure GetCreditDebit(pLineType: Integer; pCorrection: Boolean; pAmount: Decimal; pVATAmount: Decimal; var pDebit: Decimal; var pCredit: Decimal; pAmount_FCY: Decimal; pVATAmount_FCY: Decimal; var pDebit_FCY: Decimal; var pCredit_FCY: Decimal);
    begin

        pDebit := 0;
        pCredit := 0;
        CASE pLineType OF
            1:
                BEGIN
                    IF pCorrection THEN BEGIN
                        IF pAmount > 0 THEN BEGIN
                            pDebit := 0;
                            pCredit := -(pAmount - pVATAmount);
                            pDebit_FCY := 0;
                            pCredit_FCY := -(pAmount_FCY - pVATAmount_FCY);
                        END ELSE BEGIN
                            pCredit := 0;
                            pDebit := (pAmount - pVATAmount);
                            pCredit_FCY := 0;
                            pDebit_FCY := (pAmount_FCY - pVATAmount_FCY);
                        END;
                    END
                    ELSE BEGIN
                        IF pAmount > 0 THEN BEGIN
                            pCredit := 0;
                            pDebit := (pAmount - pVATAmount);
                            pCredit_FCY := 0;
                            pDebit_FCY := (pAmount_FCY - pVATAmount_FCY);
                        END ELSE BEGIN
                            pDebit := 0;
                            pCredit := -(pAmount - pVATAmount);
                            pDebit_FCY := 0;
                            pCredit_FCY := -(pAmount_FCY - pVATAmount_FCY);
                        END;
                    END;
                END;
            3:
                BEGIN
                    IF pCorrection THEN BEGIN
                        IF pAmount > 0 THEN BEGIN
                            pDebit := -(pAmount + pVATAmount);
                            pCredit := 0;
                            pDebit_FCY := -(pAmount_FCY + pVATAmount_FCY);
                            pCredit_FCY := 0;
                        END ELSE BEGIN
                            pCredit := (pAmount + pVATAmount);
                            pDebit := 0;
                            pCredit_FCY := (pAmount_FCY + pVATAmount_FCY);
                            pDebit_FCY := 0;
                        END;
                    END ELSE BEGIN
                        IF pAmount > 0 THEN BEGIN
                            pCredit := (pAmount + pVATAmount);
                            pDebit := 0;
                            pCredit_FCY := (pAmount_FCY + pVATAmount_FCY);
                            pDebit_FCY := 0;
                        END ELSE BEGIN
                            pDebit := -(pAmount + pVATAmount);
                            pCredit := 0;
                            pDebit_FCY := -(pAmount_FCY + pVATAmount_FCY);
                            pCredit_FCY := 0;
                        END;
                    END;
                END;
            2:
                BEGIN
                    IF pCorrection THEN BEGIN
                        IF pAmount > 0 THEN BEGIN
                            pDebit := 0;
                            pCredit := -pVATAmount;
                            pDebit_FCY := 0;
                            pCredit_FCY := -pVATAmount_FCY;
                        END ELSE BEGIN
                            pCredit := 0;
                            pDebit := pVATAmount;
                            pCredit_FCY := 0;
                            pDebit_FCY := pVATAmount_FCY;
                        END;
                    END ELSE BEGIN
                        IF pAmount > 0 THEN BEGIN
                            pCredit := 0;
                            pDebit := pVATAmount;
                            pCredit_FCY := 0;
                            pDebit_FCY := pVATAmount_FCY;
                        END ELSE BEGIN
                            pDebit := 0;
                            pCredit := -pVATAmount;
                            pDebit_FCY := 0;
                            pCredit_FCY := -pVATAmount_FCY;
                        END;
                    END;

                END;
            4:
                BEGIN
                    IF pCorrection THEN BEGIN
                        IF pAmount > 0 THEN BEGIN
                            pDebit := pVATAmount;
                            pCredit := 0;
                            pDebit_FCY := pVATAmount_FCY;
                            pCredit_FCY := 0;
                        END ELSE BEGIN
                            pDebit := 0;
                            pCredit := pVATAmount;
                            pDebit_FCY := 0;
                            pCredit_FCY := pVATAmount_FCY;
                        END;
                    END ELSE BEGIN
                        IF pAmount > 0 THEN BEGIN
                            pDebit := 0;
                            pCredit := -pVATAmount;
                            pDebit_FCY := 0;
                            pCredit_FCY := -pVATAmount_FCY;
                        END ELSE BEGIN
                            pDebit := pVATAmount;
                            pCredit := 0;
                            pDebit_FCY := pVATAmount_FCY;
                            pCredit_FCY := 0;
                        END;
                    END;
                END;
        END;
    end;

    procedure GetDesc(pDocNo: Code[20]; var pDesc: Text[200]; var pCount: Integer);
    var
        lRec_GenJnLine: Record "Gen. Journal Line";
    begin
        pDesc := '';
        pCount := 0;
        lRec_GenJnLine.RESET;

        lRec_GenJnLine.SETRANGE("Journal Template Name", gRec_GenJournalLine."Journal Template Name");
        lRec_GenJnLine.SETRANGE("Journal Batch Name", gRec_GenJournalLine."Journal Batch Name");
        lRec_GenJnLine.SETRANGE(lRec_GenJnLine."Document No.", pDocNo);
        IF lRec_GenJnLine.FINDFIRST THEN
            pDesc := lRec_GenJnLine."NWV Vietnamese Description";
        pCount := lRec_GenJnLine.COUNT;
    end;

    procedure GetVATAcc(pGenPostingType: Option " ",Purchase,Sale,Settlement; pVATBusPostingGroup: Code[20]; pVATProductPostingGroup: Code[20]; var pVATAccNo: Code[20]; var pVATName: Text; var pVATVNName: Text);
    var
        lRec_VATPostingSetup: Record "VAT Posting Setup";
        lRec_GLAcc: Record "G/L Account";
    begin
        pVATAccNo := '';
        pVATName := '';
        CASE pGenPostingType OF
            pGenPostingType::Purchase:
                BEGIN
                    IF lRec_VATPostingSetup.GET(pVATBusPostingGroup, pVATProductPostingGroup) THEN BEGIN
                        pVATAccNo := lRec_VATPostingSetup."Purchase VAT Account";
                        IF lRec_GLAcc.GET(pVATAccNo) THEN BEGIN
                            pVATName := lRec_GLAcc.Name;
                            pVATVNName := lRec_GLAcc."NWV Vietnamese Name";
                        END;

                    END;
                END;
            pGenPostingType::Sale:
                BEGIN
                    IF lRec_VATPostingSetup.GET(pVATBusPostingGroup, pVATProductPostingGroup) THEN BEGIN
                        pVATAccNo := lRec_VATPostingSetup."Sales VAT Account";
                        IF lRec_GLAcc.GET(pVATAccNo) THEN BEGIN
                            pVATName := lRec_GLAcc.Name;
                            pVATVNName := lRec_GLAcc."NWV Vietnamese Name";
                        END;
                    END;
                END;
        END;
    end;
}

