report 27014751 "NWV-TACO Purchase Order"
{

    DefaultLayout = RDLC;
    RDLCLayout = './.vscode/rdlc/TACO-Purchase Order.rdl';
    Caption = 'TACO-Purchase Order';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = SORTING("Document Type", "No.");
            RequestFilterFields = "No.";
            column(L_ReportName; Txt_IntLabel[1])
            {
            }
            column(L_DiaChiCongTy; Txt_IntLabel[2])
            {
            }
            column(L_DienThoaiCongTy; Txt_IntLabel[3])
            {
            }
            column(L_FaxCongTy; Txt_IntLabel[4])
            {
            }
            column(L_NhaCungCap; Txt_IntLabel[5])
            {
            }
            column(L_DT; Txt_IntLabel[6])
            {
            }
            column(L_Fax; Txt_IntLabel[7])
            {
            }
            column(L_DiaChiGiaoHang; Txt_IntLabel[8])
            {
            }
            column(L_BoPhanMuaHang; Txt_IntLabel[9])
            {
            }
            column(L_MaSoNhanVien; Txt_IntLabel[10])
            {
            }
            column(L_HoTen; Txt_IntLabel[11])
            {
            }
            column(L_TrungTam; Txt_IntLabel[12])
            {
            }
            column(L_SoDonHang; Txt_IntLabel[13])
            {
            }
            column(L_NgayDatHang; Txt_IntLabel[14])
            {
            }
            column(L_NgayGiaoHang; Txt_IntLabel[15])
            {
            }
            column(L_DonViTienTe; Txt_IntLabel[16])
            {
            }
            column(L_Stt; Txt_IntLabel[17])
            {
            }
            column(L_MaHang; Txt_IntLabel[18])
            {
            }
            column(L_MaVach; Txt_IntLabel[19])
            {
            }
            column(L_TenHang; Txt_IntLabel[20])
            {
            }
            column(L_Dvt; Txt_IntLabel[21])
            {
            }
            column(L_DonGia; Txt_IntLabel[22])
            {
            }
            column(L_SoLuong; Txt_IntLabel[23])
            {
            }
            column(L_TongGiaTriTruocThue; Txt_IntLabel[24])
            {
            }
            column(L_ThueGtgt; Txt_IntLabel[25])
            {
            }
            column(L_TongGiaTriDonHang; Txt_IntLabel[26])
            {
            }
            column(L_NhanVienDatHang; Txt_IntLabel[27])
            {
            }
            column(L_GiamDocNganhHang; Txt_IntLabel[28])
            {
            }
            column(L_GiamDocMuaHang; Txt_IntLabel[29])
            {
            }
            column(L_GiamDocSieuThi; Txt_IntLabel[30])
            {
            }
            column(L_KyHoTen; Txt_IntLabel[31])
            {
            }
            column(L_KyNgay; Txt_IntLabel[32])
            {
            }
            column(L_MaSoThue; Txt_IntLabel[33])
            {
            }
            column(L_Variant; Txt_IntLabel[34])
            {
            }
            column(L_ThanhTien; Txt_IntLabel[35])
            {

            }
            column(L_ThanhToan; Txt_IntLabel[36])
            {

            }
            column(L_GhiChu; Txt_IntLabel[37])
            {

            }
            column(L_GhiChu1; Txt_IntLabel[38])
            {

            }
            column(L_GhiChu2; Txt_IntLabel[39])
            {

            }
            column(L_GhiChu3; Txt_IntLabel[40])
            {

            }
            column(L_GhiChu4; Txt_IntLabel[41])
            {

            }
            column(L_GhiChu5; Txt_IntLabel[42])
            {

            }
            column(L_GhiChu6; Txt_IntLabel[43])
            {

            }
            column(L_ETA; Txt_IntLabel[44])
            {

            }

            column(Telephone; CompanyInfo."Phone No.")
            {
            }
            column(Fax; CompanyInfo."Fax No.")
            {
            }
            column(VATRegistrationNo; CompanyInfo."VAT Registration No.")
            {
            }
            column(CompanyName; Cu_VASMgt.ReturnCompanyName)
            {
            }
            column(CompanyAddress; Cu_VASMgt.ReturnCompanyAddress)
            {
            }
            column(StringFormat; Cu_VASMgt.ReturnFormatDecimal)
            {
            }
            column(VendorNo; "Buy-from Vendor No.")
            {
            }
            column(VendorName; VendorName)
            {
            }
            column(VendorAddress; VendorAddress)
            {
            }
            column(VendorTel; VendorTel)
            {
            }
            column(VendorFax; VendorFax)
            {
            }
            column(ShipToName; ShipToName)
            {
            }
            column(ShipToAddress; ShipToAddress)
            {
            }
            column(ShipToTel; ShipToTel)
            {
            }
            column(ShipToFax; ShipToFax)
            {
            }
            column(StoreNo; "Store No.")
            {
            }
            column(PONo; "No.")
            {
            }
            column(PODate; "Order Date")
            {
            }
            column(DeliveryDate; "Expected Receipt Date")
            {
            }
            column(CurrencyCode; "Currency Code")
            {
            }
            column(ETA; "Promised Receipt Date")
            {
            }
            column(HTTT; PaymentTerms.Description)
            {
            }
            column(CompanyImage; CompanyInfo.Picture)
            {
            }

            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");
                column(ItemNo; "No.")
                {
                }
                column(VariantCode; "Variant Code")
                {
                }
                column(Barcode; Barcode)
                {
                }
                column(ItemName; Description)
                {
                }
                column(ItemName2; "Description 2")
                {
                }
                column(UnitOfMeasure; "Unit of Measure")
                {
                }
                column(Quantity; Quantity)
                {
                }
                column(PriceExclVAT; "Unit Cost")
                {
                }
                column(LineAmount; Amount)
                {
                }
                column(VATAmount; VATAmount)
                {
                }
                column(AmountInclVAT; "Amount Including VAT")
                {
                }

                trigger OnAfterGetRecord();
                begin

                    VATAmount := "Amount Including VAT" - Amount;
                    Barcode := '';
                    ItemIdentifier.SETRANGE("Item No.", "No.");
                    ItemIdentifier.SETRANGE("Unit of Measure Code", "Unit of Measure Code");
                    if "Variant Code" <> '' then
                        ItemIdentifier.SETRANGE("Variant Code", "Variant Code");
                    if ItemIdentifier.FINDFIRST then
                        Barcode := ItemIdentifier.Code;
                end;
            }

            trigger OnAfterGetRecord();
            var
                _Vendor: Record Vendor;
                _Location: Record Location;
            begin

                VendorName := "Buy-from Vendor Name" + "Buy-from Vendor Name 2";
                VendorAddress := "Buy-from Address" + "Buy-from Address 2";

                if _Vendor.GET("Buy-from Vendor No.") then begin
                    VendorTel := _Vendor."Phone No.";
                    VendorFax := _Vendor."Fax No.";
                end;

                if _Location.GET("Location Code") then begin
                    ShipToTel := _Location."Phone No.";
                    ShipToFax := _Location."Fax No.";
                end;
                ShipToName := "Ship-to Name" + "Ship-to Name 2";
                ShipToAddress := "Ship-to Address" + "Ship-to Address 2";

                PaymentTerms.Reset();
                if PaymentTerms.Get("Payment Terms Code") then;

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

        Cu_VASMgt.FillRptLabelCaptions(0, REPORT::"NWV Purchase Order", Txt_IntLabel);
        Cu_VASMgt.FillRptLabelCaptions(1, REPORT::"NWV Purchase Order", Txt_ExtLabel);
        CompanyInfo.GET;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        Cu_VASMgt: Codeunit "NWV VAS Management AL";
        Txt_ExtLabel: array[200] of Text;
        Txt_IntLabel: array[200] of Text;
        CompanyInfo: Record "Company Information";
        VendorName: Text[150];
        VendorAddress: Text[150];
        VendorTel: Code[20];
        VendorFax: Code[20];
        ShipToName: Text[150];
        ShipToAddress: Text[150];
        ShipToTel: Code[20];
        ShipToFax: Code[20];
        VATAmount: Decimal;
        ItemIdentifier: Record "Item Identifier";
        Barcode: Code[20];
        PaymentTerms: Record "Payment Terms";
}

