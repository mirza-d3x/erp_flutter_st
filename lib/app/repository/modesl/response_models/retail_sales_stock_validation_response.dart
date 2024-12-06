class RetailSalesStockValidation {
  RetailSalesStockValidation({
    this.message = "",
    this.status = "",
    this.resultStatus,
    this.stockInfo,
    this.priceInfo,
    this.taxInfo = const [],
  });

  final String message;
  final String status;
  final ResultStatus? resultStatus;
  final StockInfo? stockInfo;
  final PriceInfo? priceInfo;
  final List<TaxInfo> taxInfo;

  factory RetailSalesStockValidation.fromJson(Map<String, dynamic> json) {
    return RetailSalesStockValidation(
      message: json["message"] ?? "",
      status: json["status"] ?? "",
      resultStatus: json["resultStatus"] == null
          ? null
          : ResultStatus.fromJson(json["resultStatus"]),
      stockInfo: json["stockInfo"] == null
          ? null
          : StockInfo.fromJson(json["stockInfo"]),
      priceInfo: json["priceInfo"] == null
          ? null
          : PriceInfo.fromJson(json["priceInfo"]),
      taxInfo: json["taxInfo"] == null
          ? []
          : List<TaxInfo>.from(json["taxInfo"].map((x) => TaxInfo.fromJson(x))),
    );
  }
}

class PriceInfo {
  PriceInfo({
    this.stockCode = "",
    this.stockDescription = "",
    this.stockCost = 0.0,
    this.sellingPrice = 0.0,
    this.minSalPrice = 0.0,
    this.stoneSalesPrice = 0.0,
    this.kundanSalesPrice = 0.0,
    this.wastageSalesPrice = 0.0,
    this.consumableSalesPrice = 0.0,
  });

  final String stockCode;
  final String stockDescription;
  final num stockCost;
  final num sellingPrice;
  final num minSalPrice;
  final num stoneSalesPrice;
  final num kundanSalesPrice;
  final num wastageSalesPrice;
  final num consumableSalesPrice;

  factory PriceInfo.fromJson(Map<String, dynamic> json) {
    return PriceInfo(
      stockCode: json["STOCK_CODE"] ?? "",
      stockDescription: json["STOCK_DESCRIPTION"] ?? "",
      stockCost: num.tryParse(json["STOCK_COST"] ?? "0") ?? 0.0,
      sellingPrice: num.tryParse(json["SELLING_PRICE"] ?? "0") ?? 0.0,
      minSalPrice: num.tryParse(json["MIN_SAL_PRICE"] ?? "0") ?? 0.0,
      stoneSalesPrice: num.tryParse(json["STONE_SALES_PRICE"] ?? "0") ?? 0.0,
      kundanSalesPrice: num.tryParse(json["KUNDAN_SALES_PRICE"] ?? "0") ?? 0.0,
      wastageSalesPrice:
          num.tryParse(json["WASTAGE_SALES_PRICE"] ?? "0") ?? 0.0,
      consumableSalesPrice:
          num.tryParse(json["CONSUMABLE_SALES_PRICE"] ?? "0") ?? 0.0,
    );
  }
}

class ResultStatus {
  ResultStatus({
    this.resultType = "",
    this.messageId = "",
    this.validStock = false,
  });

  final String resultType;
  final String messageId;
  final bool validStock;

  factory ResultStatus.fromJson(Map<String, dynamic> json) {
    return ResultStatus(
      resultType: json["RESULT_TYPE"] ?? "",
      messageId: json["MESSAGE_ID"] ?? "",
      validStock: json["VALID_STOCK"] ?? false,
    );
  }
}

class StockInfo {
  StockInfo({
    this.stockCode = "",
    this.description = "",
    this.balancePcs = "",
    this.balanceQty = "",
    this.mkgStockvalue = "",
    this.divisionms = "",
    this.division = "",
    this.stone = false,
    this.blockGrwt = "",
    this.setRef = "",
    this.allowNegative = "",
    this.tvatonmargin = "",
    this.karatCode = "",
    this.taglines = "",
    this.supplier = "",
    this.purity = "",
    this.mainStockCode = "",
    this.askWastage = "",
    this.posfixed = "",
    this.stampcharges = "",
    this.tpromotionalitem = "",
    this.itemOnhold = "",
    this.pictureName = "",
    this.unqOrderId = "",
    this.locationCode = "",
    this.rateType = "",
    this.rate = 0.0,
    this.stoneWt = 0.0,
    this.netWt = 0.0,
    this.blockNegativestock = "",
    this.blockMinimumprice = "",
    this.validatePcs = false,
    this.metalRate = 0.0,
    this.metalRatePergms24Karat = 0.0,
    this.metalRatePergmsItemkarat = 0.0,
    this.giftVoucher = false,
    this.dontShowStockbal = false,
    this.pcsToGms = 0.0,
    this.isBarcodedItem = false,
    this.makingOn = "",
    this.lessthancost = false,
    this.gstvatonmaking = false,
    this.excludegstvat = false,
    this.alloweditdescription = false,
    this.enablePcs = false,
    this.dontAllowDuplicate = false,
    this.gpcPossalesAc = "",
    this.gpcStonediff = "",
    this.gpcStonediffvalue = "",
    this.gpcKundanvaluesalesAc = "",
    this.gpcPossalessrAc = "",
    this.gpcMetalamtAc = "",
    this.gpcPhysicalstockAc = "",
    this.gpcWastageAc = "",
    this.gpcStampchargeAc = "",
    this.blockedSamedaySales = false,
    this.allowWithoutRate = false,
  });

  final String stockCode;
  final String description;
  final String balancePcs;
  final String balanceQty;
  final String mkgStockvalue;
  final String divisionms;
  final String division;
  final bool stone;
  final String blockGrwt;
  final String setRef;
  final String allowNegative;
  final String tvatonmargin;
  final String karatCode;
  final String taglines;
  final String supplier;
  final String purity;
  final String mainStockCode;
  final String askWastage;
  final String posfixed;
  final String stampcharges;
  final String tpromotionalitem;
  final String itemOnhold;
  final String pictureName;
  final String unqOrderId;
  final String locationCode;
  final String rateType;
  final num rate;
  final num stoneWt;
  final num netWt;
  final String blockNegativestock;
  final String blockMinimumprice;
  final bool validatePcs;
  final num metalRate;
  final num metalRatePergms24Karat;
  final num metalRatePergmsItemkarat;
  final bool giftVoucher;
  final bool dontShowStockbal;
  final num pcsToGms;
  final bool isBarcodedItem;
  final String makingOn;
  final bool lessthancost;
  final bool gstvatonmaking;
  final bool excludegstvat;
  final bool alloweditdescription;
  final bool enablePcs;
  final bool dontAllowDuplicate;
  final String gpcPossalesAc;
  final String gpcStonediff;
  final String gpcStonediffvalue;
  final String gpcKundanvaluesalesAc;
  final String gpcPossalessrAc;
  final String gpcMetalamtAc;
  final String gpcPhysicalstockAc;
  final String gpcWastageAc;
  final String gpcStampchargeAc;
  final bool blockedSamedaySales;
  final bool allowWithoutRate;

  factory StockInfo.fromJson(Map<String, dynamic> json) {
    return StockInfo(
      stockCode: json["STOCK_CODE"] ?? "",
      description: json["DESCRIPTION"] ?? "",
      balancePcs: json["BALANCE_PCS"] ?? "",
      balanceQty: json["BALANCE_QTY"] ?? "",
      mkgStockvalue: json["MKG_STOCKVALUE"] ?? "",
      divisionms: json["DIVISIONMS"] ?? "",
      division: json["DIVISION"] ?? "",
      stone: json["STONE"] ?? false,
      blockGrwt: json["BLOCK_GRWT"] ?? "",
      setRef: json["SET_REF"] ?? "",
      allowNegative: json["ALLOW_NEGATIVE"] ?? "",
      tvatonmargin: json["TVATONMARGIN"] ?? "",
      karatCode: json["KARAT_CODE"] ?? "",
      taglines: json["TAGLINES"] ?? "",
      supplier: json["SUPPLIER"] ?? "",
      purity: json["PURITY"] ?? "",
      mainStockCode: json["MAIN_STOCK_CODE"] ?? "",
      askWastage: json["ASK_WASTAGE"] ?? "",
      posfixed: json["POSFIXED"] ?? "",
      stampcharges: json["STAMPCHARGES"] ?? "",
      tpromotionalitem: json["TPROMOTIONALITEM"] ?? "",
      itemOnhold: json["ITEM_ONHOLD"] ?? "",
      pictureName: json["PICTURE_NAME"] ?? "",
      unqOrderId: json["UNQ_ORDER_ID"] ?? "",
      locationCode: json["LOCATION_CODE"] ?? "",
      rateType: json["RATE_TYPE"] ?? "",
      rate: json["RATE"] ?? 0.0,
      stoneWt: json["STONE_WT"] ?? 0.0,
      netWt: json["NET_WT"] ?? 0.0,
      blockNegativestock: json["BLOCK_NEGATIVESTOCK"] ?? "",
      blockMinimumprice: json["BLOCK_MINIMUMPRICE"] ?? "",
      validatePcs: json["VALIDATE_PCS"] ?? false,
      metalRate: json["METAL_RATE"] ?? 0.0,
      metalRatePergms24Karat: json["METAL_RATE_PERGMS_24KARAT"] ?? 0.0,
      metalRatePergmsItemkarat: json["METAL_RATE_PERGMS_ITEMKARAT"] ?? 0.0,
      giftVoucher: json["GIFT_VOUCHER"] ?? false,
      dontShowStockbal: json["DONT_SHOW_STOCKBAL"] ?? false,
      pcsToGms: json["PCS_TO_GMS"] ?? 0.0,
      isBarcodedItem: json["IS_BARCODED_ITEM"] ?? false,
      makingOn: json["MAKING_ON"] ?? "",
      lessthancost: json["LESSTHANCOST"] ?? false,
      gstvatonmaking: json["GSTVATONMAKING"] ?? false,
      excludegstvat: json["EXCLUDEGSTVAT"] ?? false,
      alloweditdescription: json["ALLOWEDITDESCRIPTION"] ?? false,
      enablePcs: json["ENABLE_PCS"] ?? false,
      dontAllowDuplicate: json["DONT_ALLOW_DUPLICATE"] ?? false,
      gpcPossalesAc: json["GPC_POSSALES_AC"] ?? "",
      gpcStonediff: json["GPC_STONEDIFF"] ?? "",
      gpcStonediffvalue: json["GPC_STONEDIFFVALUE"] ?? "",
      gpcKundanvaluesalesAc: json["GPC_KUNDANVALUESALES_AC"] ?? "",
      gpcPossalessrAc: json["GPC_POSSALESSR_AC"] ?? "",
      gpcMetalamtAc: json["GPC_METALAMT_AC"] ?? "",
      gpcPhysicalstockAc: json["GPC_PHYSICALSTOCK_AC"] ?? "",
      gpcWastageAc: json["GPC_WASTAGE_AC"] ?? "",
      gpcStampchargeAc: json["GPC_STAMPCHARGE_AC"] ?? "",
      blockedSamedaySales: json["BLOCKED_SAMEDAY_SALES"] ?? false,
      allowWithoutRate: json["ALLOW_WITHOUT_RATE"] ?? false,
    );
  }
}

class TaxInfo {
  TaxInfo({
    this.statecode = "",
    this.gstCode = "",
    this.hsnCode = "",
    this.cgstPer = "0.0",
    this.sgstPer = "0.0",
    this.igstPer = "0.0",
    this.cgstAccode = "",
    this.sgstAccode = "",
    this.igstAccode = "",
    this.posTaxAccode = "",
  });

  final String statecode;
  final String gstCode;
  final String hsnCode;
  final String cgstPer;
  final String sgstPer;
  final String igstPer;
  final String cgstAccode;
  final String sgstAccode;
  final String igstAccode;
  final String posTaxAccode;

  factory TaxInfo.fromJson(Map<String, dynamic> json) {
    return TaxInfo(
      statecode: json["STATECODE"] ?? "",
      gstCode: json["GST_CODE"] ?? "",
      hsnCode: json["HSN_CODE"] ?? "",
      cgstPer: json["CGST_PER"] ?? "0.0",
      sgstPer: json["SGST_PER"] ?? "0.0",
      igstPer: json["IGST_PER"] ?? "0.0",
      cgstAccode: json["CGST_ACCODE"] ?? "",
      sgstAccode: json["SGST_ACCODE"] ?? "",
      igstAccode: json["IGST_ACCODE"] ?? "",
      posTaxAccode: json["POS_TAX_ACCODE"] ?? "",
    );
  }
}
