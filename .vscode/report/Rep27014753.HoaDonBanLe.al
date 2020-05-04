report 27014753 "Hoa don ban le"
{
    // version NWV-TACO1.0

    // - NWV-DEMO-01 #TaiNguyen
    DefaultLayout = RDLC;
    RDLCLayout = './.vscode/rdlc/TACO-Hoa don ban le.rdl';
    Caption = 'Hoá đơn bán lẻ';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Transaction Header"; "Transaction Header")
        {
            DataItemTableView = SORTING("Store No.", "POS Terminal No.", "Transaction No.");
            RequestFilterFields = "Receipt No.";
            column(StoreNo; "Store No.")
            {
            }
            column(ReceiptNo; gReceipNo)
            {
            }
            column(OriginalDate; "Original Date")
            {
            }
            column(Time; Time)
            {
            }
            column(ClosedTime; "Time when Trans. Closed")
            {
            }
            column(StoreName; StoreName)
            {
            }
            column(StoreAddress; StoreAddress)
            {
            }
            column(StorePhone; StorePhone)
            {
            }
            column(StoreWebsite; StoreWebsite)
            {
            }
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyAddress; CompanyInfo.Address)
            {
            }
            column(AmountInWord; AmountInWord)
            {
            }
            column(PaymentAmount; TotalPayment)
            {
            }
            column(DiscountAmount; "Discount Amount")
            {
            }
            column(LineType; LineType)
            {
            }
            column(SalesStaff; SalesStaff)
            {
            }
            column(CompanyPicture; CompanyInfo.Picture)
            {
            }
            column(StartPoint; PointCurr)
            {
            }
            column(PointsThisBill; PointsThisBill)
            {
            }
            column(MemberCardNo_TransactionHeader; "Transaction Header"."Member Card No.")
            {
            }

            column(StaffID; "Staff ID")
            {
            }

            column(OpenPoint; "Transaction Header"."Starting Point Balance")
            {
            }
            column(CusName; gCusName)
            {
            }
            column(CusAdd; gCusAddress)
            {
            }
            column(CusPhone; gMobilePhone)
            {
            }


            dataitem("Trans. Sales Entry"; "Trans. Sales Entry")
            {
                DataItemLink = "Store No." = FIELD("Store No."), "POS Terminal No." = FIELD("POS Terminal No."), "Transaction No." = FIELD("Transaction No."), "Receipt No." = FIELD("Receipt No.");
                DataItemTableView = SORTING("Store No.", "POS Terminal No.", "Transaction No.", "Line No.") ORDER(Ascending);
                column(DealName; gDealName)
                {
                }
                column(ItemName; item.Description)
                {
                }
                column(UOMQty; ROUND(Qty, 0.01))
                {
                }
                column(QtyDeal; ROUND(QtyDeal, 0.01))
                {
                }
                column(UOM; UomName)
                {
                }
                column(Price; gPriceIncludedVAT)
                {
                }
                column(LineAmount; LineAmt)
                {
                }
                column(gDealAmount; gDealAmount)
                {
                }
                column(LineDiscountAmnt; "Trans. Sales Entry"."Discount Amount")
                {
                }
                column(DiscountExPeriod; DiscountExPeriod)
                {
                }
                column(BarcodeNo; gBarcodeNo)
                {
                }
                column(PriceBfVAT; ABS("Trans. Sales Entry"."Net Amount"))
                {
                }
                column(VATAmount; "Trans. Sales Entry"."VAT Amount")
                {
                }
                column(VATPer; gVATPer)
                {
                }
                column(DealLine; "Deal Line")
                {
                }
                column(DealHeadLine; gDealHeaderNo)
                {
                }
                column(DealPrice; DealPrice)
                {
                }
                column(NetAmount_TransSalesEntry; "Trans. Sales Entry"."Net Amount")
                {
                }
                column(ShowDealLine; ShowDealLine)
                {
                }
                column(SkipZeroPrice; SkipZeroPrice)
                {
                }

                trigger OnAfterGetRecord()
                var
                    _UnitOfMeasure: Record "Unit of Measure";
                    lRec_TransDeal: Record 99001460;
                    lRec_Offer: Record 99001502;
                    lRec_VATPostingSetup: Record "VAT Posting Setup";
                begin
                    gLineAmtBeforeDiscount := 0;
                    SalesPrice := 0;
                    gPriceIncludedVAT := 0;
                    LineDiscAmt := 0;

                    SalesPrice := "Trans. Sales Entry"."Net Price";
                    gPriceIncludedVAT := "Trans. Sales Entry".Price;

                    Item.GET("Item No.");
                    IF "UOM Quantity" <> 0 THEN BEGIN
                        Qty := -"UOM Quantity";
                        //  SalesPrice := "UOM Price";
                    END ELSE BEGIN
                        Qty := -Quantity;
                    end;

                    LineType := 1;
                    Payment := "Total Rounded Amt.";

                    IF SalesPrice <> 0 THEN BEGIN
                        LineAmt := "Trans. Sales Entry"."Net Amount"; //- LineDiscAmt;
                        IF LineAmt <= 0 THEN BEGIN
                            gLineDiscountAmtPercentage := 1;
                            LineAmt := 0;
                            gLineAmountAfterVAT := 0;
                        END
                        ELSE BEGIN
                            gLineDiscountAmtPercentage := ABS(LineDiscAmt / (gPriceIncludedVAT * Qty));
                            gLineAmountAfterVAT := gPriceIncludedVAT * Qty;

                        END;
                    END ELSE
                        IF SalesPrice = 0 THEN BEGIN
                            gLineDiscountAmtPercentage := 0;
                            LineAmt := 0;
                            gLineAmountAfterVAT := 0;
                        END;
                end;

                trigger OnPostDataItem()
                begin

                end;

                trigger OnPreDataItem()
                begin
                    //"Trans. Sales Entry".SETFILTER("Item No.", '<>%1|%2|%3', 'A', 'B', 'C');
                end;
            }
            dataitem("Trans. Payment Entry"; "Trans. Payment Entry")
            {
                DataItemLink = "Store No." = FIELD("Store No."), "POS Terminal No." = FIELD("POS Terminal No."), "Transaction No." = FIELD("Transaction No."), "Receipt No." = FIELD("Receipt No.");
                DataItemLinkReference = "Transaction Header";
                DataItemTableView = SORTING("Store No.", "POS Terminal No.", "Transaction No.", "Line No.");
                column(TenderType; "Tender Type")
                {
                }
                column(TenderName; TenderName)
                {
                }
                column(TenderAmount; "Amount Tendered")
                {
                }
                column(Change; g_Change)
                {
                }
                column(CardNo_TransPaymentEntry; "Trans. Payment Entry"."Card No.")
                {
                }

                trigger OnAfterGetRecord()
                begin

                    LineType := 0;
                    IF TenderType.GET("Store No.", "Tender Type") THEN BEGIN
                        TenderName := TenderType.Description;

                    END;
                    IF "Trans. Payment Entry"."Change Line" = TRUE THEN
                        g_Change += ABS("Trans. Payment Entry"."Amount Tendered");
                    gCustomer.RESET;
                    gTenderType.RESET;
                    gTenderType.GET("Transaction Header"."Store No.", "Trans. Payment Entry"."Tender Type");
                    IF gTenderType."Function" = gTenderType."Function"::Customer THEN BEGIN

                    END;
                end;
            }
            dataitem("Trans. Infocode Entry"; "Trans. Infocode Entry")
            {
                DataItemLink = "Store No." = FIELD("Store No."), "POS Terminal No." = FIELD("POS Terminal No."), "Transaction No." = FIELD("Transaction No.");
                column(SelectedQuantity_TransInfocodeEntry; "Trans. Infocode Entry"."Selected Quantity")
                {
                }
                column(Infocode_TransInfocodeEntry; "Trans. Infocode Entry".Infocode)
                {
                }

                trigger OnPreDataItem()
                begin
                    //SETRANGE("Transaction Type", "Trans. Infocode Entry"."Transaction Type"::"Income/Expense Entry");
                end;
            }

            trigger OnAfterGetRecord()
            var
                InformationSubcode_l: Record "Information Subcode";
                TransInfocodeEntry_l: Record "Trans. Infocode Entry";
                PosFunctions: codeunit "POS Functions";
                ErrorText_l: Text;
                ProcessCode_l: Code[30];
            begin

                gReceipNo := "Transaction Header"."Receipt No.";


                Store.GET("Store No.");
                StoreName := Store.Name;
                StoreAddress := Store.Address + Store."Address 2";
                StorePhone := Store."Phone No.";
                IF Staff.GET("Staff ID") THEN
                    SalesStaff := "Staff ID" + '-' + Staff."First Name";

                AmountInWord := ConvertAmount2Word.Amount2VNWord(Payment);

                IF "Transaction Header"."Member Card No." <> '' THEN BEGIN
                    gTransPoint.RESET;
                    gTransPoint.SETRANGE("Store No.", "Store No.");
                    gTransPoint.SETRANGE("POS Terminal No.", "POS Terminal No.");
                    gTransPoint.SETRANGE("Transaction No.", "Transaction No.");
                    gTransPoint.SETRANGE("Entry Type", gTransPoint."Entry Type"::Payment);
                    gTransPoint.CALCSUMS(Points);
                    pointused := gTransPoint.Points;
                END;

                TotalPayment := ABS("Gross Amount");

                IF "Transaction Header"."Member Card No." <> '' THEN BEGIN
                    IF PosFunctions.GetMemberInfoForPos("Transaction Header"."Member Card No.", ProcessCode_l, ErrorText_l) THEN BEGIN

                        PosFunctions.GetMemberShipCardInfo(MembershipCardTemp_g);
                        PosFunctions.GetMemberAccountInfo(MemberAccountTemp_g);
                        PosFunctions.GetCurrMemberContact(MemberContactTemp_g);
                        PosFunctions.GetMemberClubInfo(MemberClubTemp_g);

                        //MembershipCardTemp_g.CALCFIELDS("Cardholder Name");
                        gCustomerNo := MembershipCardTemp_g."Account No.";
                        gCusName := MemberContactTemp_g.Name;
                        gMobilePhone := MemberContactTemp_g."Mobile Phone No.";
                        IF gMobilePhone = '' THEN
                            gMobilePhone := MemberContactTemp_g."Phone No.";
                        gCusAddress := MemberContactTemp_g.Address + MemberContactTemp_g."Address 2";

                    END;
                END;


                IF gCustomer.GET("Transaction Header"."Customer No.") THEN
                    gCusName := gCustomer.Name
                ELSE
                    gCusName := 'REGULAR CUSTOMER';

            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport();
    begin
        gCu_VASMgt.FillRptLabelCaptions(0, REPORT::"Hoa don ban le", gTxt_IntLabel);
        gCu_VASMgt.FillRptLabelCaptions(1, REPORT::"Hoa don ban le", gTxt_ExtLabel);
        CompanyInfo.GET;
        StoreWebsite := CompanyInfo."Home Page";
        CompanyInfo.CALCFIELDS(Picture);
    end;

    var
        gDealName: Text;
        gDealHeaderNo: Integer;
        gItemName: Text;
        gPointPaBTemp: Decimal;
        gIncomePaB: Decimal;
        gPointPaB: Decimal;
        gRec_PaymentEntry: Record "Trans. Payment Entry";
        TotalPayment: Decimal;
        gRec_TransIncome: Record "Trans. Income/Expense Entry";
        gIncome: Decimal;
        gCu_VASMgt: Codeunit "NWV VAS Management AL";
        gTxt_ExtLabel: array[200] of Text;
        gTxt_IntLabel: array[200] of Text;
        CompanyInfo: Record "Company Information";
        Qty: Decimal;
        QtyDeal: Decimal;
        LineAmt: Decimal;
        StoreName: Text[80];
        StoreAddress: Text[80];
        StorePhone: Text[80];
        StoreWebsite: Text[80];
        Store: Record Store;
        MemberCard: Text[30];
        PointCurr: Decimal;
        PointIssue: Decimal;
        PointBalance: Decimal;
        gSchemaName: Text[30];
        gSchemaCode: Code[20];
        TenderTypeName: Text[100];
        Index: Integer;
        LineDiscAmt: Decimal;
        InvDiscAmt: Decimal;
        TotalLineAmt: Decimal;
        TotalLineDiscAmt: Decimal;
        SKU: Integer;
        HaveOffer: Text[30];
        SalesPrice: Decimal;
        Cumulative: Text[30];
        Payment: Decimal;
        Deposit: Decimal;
        SalesStaff: Text[80];
        InfocodeEntry: Record "Trans. Infocode Entry";
        Discount: Decimal;
        TotalinWords: Codeunit "NWV Amount In Words";
        TenderType: Record "Tender Type";
        TenderName: Text[80];
        LineType: Integer;
        AmountInWord: Text[150];
        ConvertAmount2Word: Codeunit "NWV Amount In Words";
        UomName: Text[50];
        Item: Record Item;
        Staff: Record Staff;
        PrintVersion: Text[50];
        PointsThisBill: Decimal;
        DiscountExPeriod: Decimal;
        MemberAccount: Record 99009001;
        gBarcodeNo: Code[22];
        gRec_Barcode: Record 99001451;
        gTransPoint: Record 99001495;
        VIDMember: Text[100];
        MarketingMss: Text[1024];
        gVATPer: Decimal;
        gIsVATPer: Boolean;
        gTableNo: Text;
        gRec_Tip: Record 99001475;
        gDec_Tip: Decimal;
        gRec_KOTHeader: Record 10012125;
        g_Change: Decimal;
        g_room: Text;
        gTorD: Text;
        gReason: Text;
        gCustomer: Record Customer;
        gTenderType: Record "Tender Type";
        gCusName: Text;
        gCustomerNo: Text;
        gCusAddress: Text[200];
        gMobilePhone: Text[200];
        NewExpiration: Date;
        gContact: Record Contact;
        gTransDiscountEntry: Record 99001642;
        gDiscountType: Text;
        gPeriodicDiscount: Record 99001453;
        DealPrice: Decimal;


        pointearn: Integer;
        pointused: Integer;
        DiscountGoodWill: Decimal;
        DiscountRecovery: Decimal;
        DiscountBirthday: Decimal;
        gDealAmount: Decimal;
        ShowDealLine: Boolean;
        gReceipNo: Code[20];
        gInfocode: Record 99001482;
        SkipZeroPrice: Boolean;
        IncomeExpenseAccount: Record 99001476;

        MembershipCardTemp_g: Record "Membership Card" temporary;
        MemberAccountTemp_g: Record "Member Account" temporary;
        MemberContactTemp_g: Record "Member Contact" temporary;
        MemberClubTemp_g: Record "Member Club" temporary;
        gLineAmtBeforeDiscount: Decimal;
        gPriceIncludedVAT: Decimal;
        gLineDiscountAmtPercentage: Decimal;
        gLineAmountAfterVAT: Decimal;

    procedure GetCustomerPoint()
    var
        _CurrExchRate: Record "Currency Exchange Rate";
        _IssuePoint: Decimal;
        _UsedPoint: Decimal;
        _PointBalance: Decimal;
        _Factor: Decimal;
    begin


        MemberCard := "Transaction Header"."Member Card No.";
        //PointCurr := "Transaction Header"."Starting Point Balance";
        GetCustomerIssuePoint("Transaction Header", _IssuePoint, _UsedPoint);
        PointIssue := _IssuePoint;
        PointBalance := PointCurr + PointIssue;
    end;

    procedure GetCustomerIssuePoint(pRec_POSTrans: Record 99001472; var IssuedPoints: Decimal; var UsedPoints: Decimal)
    var
        _TransPointEntry: Record 99001495;
    begin

        WITH _TransPointEntry DO BEGIN
            SETRANGE("Store No.", pRec_POSTrans."Store No.");
            SETRANGE("POS Terminal No.", pRec_POSTrans."POS Terminal No.");
            SETRANGE("Transaction No.", pRec_POSTrans."Transaction No.");
            IF FINDSET THEN
                REPEAT
                    IF "Entry Type" = "Entry Type"::Sale THEN
                        IssuedPoints := IssuedPoints + Points
                    ELSE
                        UsedPoints := UsedPoints - Points;
                UNTIL NEXT = 0;
        END;
    end;


}

