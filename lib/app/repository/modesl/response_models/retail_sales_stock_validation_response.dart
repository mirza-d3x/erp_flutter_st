class RetailSalesStockValidation {
  RetailSalesStockValidation({
    required this.message,
    required this.status,
    required this.resultStatus,
    required this.stockInfo,
    required this.priceInfo,
    required this.taxInfo,
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
          : List<TaxInfo>.from(
              json["taxInfo"]!.map((x) => TaxInfo.fromJson(x))),
    );
  }
}

class PriceInfo {
  PriceInfo({
    required this.stockCode,
    required this.stockDescription,
    required this.stockCost,
    required this.sellingPrice,
    required this.minSalPrice,
    required this.stoneSalesPrice,
    required this.kundanSalesPrice,
    required this.wastageSalesPrice,
    required this.consumableSalesPrice,
  });

  final dynamic stockCode;
  final dynamic stockDescription;
  final dynamic stockCost;
  final dynamic sellingPrice;
  final dynamic minSalPrice;
  final dynamic stoneSalesPrice;
  final dynamic kundanSalesPrice;
  final dynamic wastageSalesPrice;
  final dynamic consumableSalesPrice;

  factory PriceInfo.fromJson(Map<String, dynamic> json) {
    return PriceInfo(
      stockCode: json["STOCK_CODE"],
      stockDescription: json["STOCK_DESCRIPTION"],
      stockCost: json["STOCK_COST"],
      sellingPrice: json["SELLING_PRICE"],
      minSalPrice: json["MIN_SAL_PRICE"],
      stoneSalesPrice: json["STONE_SALES_PRICE"],
      kundanSalesPrice: json["KUNDAN_SALES_PRICE"],
      wastageSalesPrice: json["WASTAGE_SALES_PRICE"],
      consumableSalesPrice: json["CONSUMABLE_SALES_PRICE"],
    );
  }
}

class ResultStatus {
  ResultStatus({
    required this.resultType,
    required this.messageId,
    required this.validStock,
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
    required this.stockCode,
    required this.description,
    required this.balancePcs,
    required this.balanceQty,
    required this.mkgStockvalue,
    required this.divisionms,
    required this.division,
    required this.stone,
    required this.blockGrwt,
    required this.setRef,
    required this.allowNegative,
    required this.tvatonmargin,
    required this.karatCode,
    required this.taglines,
    required this.supplier,
    required this.purity,
    required this.mainStockCode,
    required this.askWastage,
    required this.posfixed,
    required this.stampcharges,
    required this.tpromotionalitem,
    required this.itemOnhold,
    required this.pictureName,
    required this.unqOrderId,
    required this.locationCode,
    required this.rateType,
    required this.rate,
    required this.stoneWt,
    required this.netWt,
    required this.blockNegativestock,
    required this.blockMinimumprice,
    required this.validatePcs,
    required this.metalRate,
    required this.metalRatePergms24Karat,
    required this.metalRatePergmsItemkarat,
    required this.giftVoucher,
    required this.dontShowStockbal,
    required this.pcsToGms,
    required this.isBarcodedItem,
    required this.makingOn,
    required this.lessthancost,
    required this.gstvatonmaking,
    required this.excludegstvat,
    required this.alloweditdescription,
    required this.enablePcs,
    required this.dontAllowDuplicate,
    required this.gpcPossalesAc,
    required this.gpcStonediff,
    required this.gpcStonediffvalue,
    required this.gpcKundanvaluesalesAc,
    required this.gpcPossalessrAc,
    required this.gpcMetalamtAc,
    required this.gpcPhysicalstockAc,
    required this.gpcWastageAc,
    required this.gpcStampchargeAc,
    required this.blockedSamedaySales,
    required this.allowWithoutRate,
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
      rate: json["RATE"] ?? 0,
      stoneWt: json["STONE_WT"] ?? 0,
      netWt: json["NET_WT"] ?? 0,
      blockNegativestock: json["BLOCK_NEGATIVESTOCK"] ?? "",
      blockMinimumprice: json["BLOCK_MINIMUMPRICE"] ?? "",
      validatePcs: json["VALIDATE_PCS"] ?? false,
      metalRate: json["METAL_RATE"] ?? 0,
      metalRatePergms24Karat: json["METAL_RATE_PERGMS_24KARAT"] ?? 0,
      metalRatePergmsItemkarat: json["METAL_RATE_PERGMS_ITEMKARAT"] ?? 0.0,
      giftVoucher: json["GIFT_VOUCHER"] ?? false,
      dontShowStockbal: json["DONT_SHOW_STOCKBAL"] ?? false,
      pcsToGms: json["PCS_TO_GMS"] ?? 0,
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
    required this.statecode,
    required this.gstCode,
    required this.hsnCode,
    required this.cgstPer,
    required this.sgstPer,
    required this.igstPer,
    required this.cgstAccode,
    required this.sgstAccode,
    required this.igstAccode,
    required this.posTaxAccode,
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
      cgstPer: json["CGST_PER"] ?? "",
      sgstPer: json["SGST_PER"] ?? "",
      igstPer: json["IGST_PER"] ?? "",
      cgstAccode: json["CGST_ACCODE"] ?? "",
      sgstAccode: json["SGST_ACCODE"] ?? "",
      igstAccode: json["IGST_ACCODE"] ?? "",
      posTaxAccode: json["POS_TAX_ACCODE"] ?? "",
    );
  }
}
