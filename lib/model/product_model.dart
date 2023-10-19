// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  bool? error;
  List<ProductList>? productList;

  ProductModel({
    this.error,
    this.productList,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        error: json["error"],
        productList: json["product_list"] == null
            ? []
            : List<ProductList>.from(
                json["product_list"]!.map((x) => ProductList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "product_list": productList == null
            ? []
            : List<dynamic>.from(productList!.map((x) => x.toJson())),
      };
}

class ProductList {
  int? tenantId;
  String? name;
  String? customCode;
  String? unitprice;
  String? msp;
  int? id;
  bool? isActive;
  List<int>? productOption1;
  Meta? meta;
  Discount? discount;
  String? gst;
  int? sp;
  List<ProductVariant>? productVariants;
  List<ProductAccessory>? productAccessories;

  ProductList({
    this.tenantId,
    this.name,
    this.customCode,
    this.unitprice,
    this.msp,
    this.id,
    this.isActive,
    this.productOption1,
    this.meta,
    this.discount,
    this.gst,
    this.sp,
    this.productVariants,
    this.productAccessories,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        tenantId: json["tenant_id"],
        name: json["name"],
        customCode: json["custom_code"],
        unitprice: json["unitprice"],
        msp: json["msp"],
        id: json["id"],
        isActive: json["is_active"],
        productOption1: json["product_option1"] == null
            ? []
            : List<int>.from(json["product_option1"]!.map((x) => x)),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        discount: json["discount"] == null
            ? null
            : Discount.fromJson(json["discount"]),
        gst: json["gst"],
        sp: json["sp"],
        productVariants: json["product_variants"] == null
            ? []
            : List<ProductVariant>.from(json["product_variants"]!
                .map((x) => ProductVariant.fromJson(x))),
        productAccessories: json["product_accessories"] == null
            ? []
            : List<ProductAccessory>.from(json["product_accessories"]!
                .map((x) => ProductAccessory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tenant_id": tenantId,
        "name": name,
        "custom_code": customCode,
        "unitprice": unitprice,
        "msp": msp,
        "id": id,
        "is_active": isActive,
        "product_option1": productOption1 == null
            ? []
            : List<dynamic>.from(productOption1!.map((x) => x)),
        "meta": meta?.toJson(),
        "discount": discount?.toJson(),
        "gst": gst,
        "sp": sp,
        "product_variants": productVariants == null
            ? []
            : List<dynamic>.from(productVariants!.map((x) => x.toJson())),
        "product_accessories": productAccessories == null
            ? []
            : List<dynamic>.from(productAccessories!.map((x) => x.toJson())),
      };
}

class Discount {
  bool? isDiscountPercent;
  dynamic discountValue;

  Discount({
    this.isDiscountPercent,
    this.discountValue,
  });

  factory Discount.fromJson(Map<String, dynamic> json) => Discount(
        isDiscountPercent: json["is_discount_percent"],
        discountValue: json["discount_value"],
      );

  Map<String, dynamic> toJson() => {
        "is_discount_percent": isDiscountPercent,
        "discount_value": discountValue,
      };
}

class Meta {
  String? description;
  String? specifications;
  String? features;
  String? imageId;
  String? variant;

  Meta({
    this.description,
    this.specifications,
    this.features,
    this.imageId,
    this.variant,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        description: json["description"],
        specifications: json["specifications"],
        features: json["features"],
        imageId: json["imageId"],
        variant: json["variant"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "specifications": specifications,
        "features": features,
        "imageId": imageId,
        "variant": variant,
      };
}

class ProductAccessory {
  int? accessoriesId;
  int? productId;
  String? name;
  int? sellingPrice;
  int? gst;
  DateTime? createdAt;

  ProductAccessory({
    this.accessoriesId,
    this.productId,
    this.name,
    this.sellingPrice,
    this.gst,
    this.createdAt,
  });

  factory ProductAccessory.fromJson(Map<String, dynamic> json) =>
      ProductAccessory(
        accessoriesId: json["accessories_id"],
        productId: json["product_id"],
        name: json["name"],
        sellingPrice: json["selling_price"],
        gst: json["gst"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "accessories_id": accessoriesId,
        "product_id": productId,
        "name": name,
        "selling_price": sellingPrice,
        "gst": gst,
        "created_at": createdAt?.toIso8601String(),
      };
}

class ProductVariant {
  int? productId;
  String? variantType;
  String? variantValue;
  int? tenantId;
  DateTime? createdAt;

  ProductVariant({
    this.productId,
    this.variantType,
    this.variantValue,
    this.tenantId,
    this.createdAt,
  });

  factory ProductVariant.fromJson(Map<String, dynamic> json) => ProductVariant(
        productId: json["product_id"],
        variantType: json["variant_type"],
        variantValue: json["variant_value"],
        tenantId: json["tenant_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "variant_type": variantType,
        "variant_value": variantValue,
        "tenant_id": tenantId,
        "created_at": createdAt?.toIso8601String(),
      };
}
