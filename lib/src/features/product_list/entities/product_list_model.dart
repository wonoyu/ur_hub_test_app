// To parse this JSON data, do
//
//     final productListModel = productListModelFromMap(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

ProductListModel productListModelFromMap(String str) =>
    ProductListModel.fromMap(json.decode(str));

String productListModelToMap(ProductListModel data) =>
    json.encode(data.toMap());

class ProductListModel {
  ProductListModel({
    required this.success,
    required this.status,
    required this.msg,
    required this.products,
  });

  int success;
  int status;
  String msg;
  List<Product> products;

  factory ProductListModel.fromMap(Map<String, dynamic> json) =>
      ProductListModel(
        success: json["success"],
        status: json["status"],
        msg: json["msg"],
        products:
            List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "status": status,
        "msg": msg,
        "products": List<dynamic>.from(products.map((x) => x.toMap())),
      };
}

class Product extends Equatable {
  Product({
    required this.id,
    required this.sku,
    required this.categoryId,
    required this.subcategoryId,
    required this.name,
    required this.description,
    required this.image,
    required this.stock,
    required this.boxStock,
    required this.ballStock,
    required this.cogs,
    required this.price,
    required this.boxPrice,
    required this.ballPrice,
    required this.specialPrice,
    required this.isWholesale,
    required this.isVariant,
    required this.rating,
    required this.sold,
    required this.weight,
    required this.boxWeight,
    required this.ballWeight,
    required this.length,
    required this.width,
    required this.height,
    required this.boxLength,
    required this.boxWidth,
    required this.boxHeight,
    required this.ballLength,
    required this.ballWidth,
    required this.ballHeight,
    required this.weightMetricId,
    required this.boxWeightMetricId,
    required this.ballWeightMetricId,
    required this.volumeMetricId,
    required this.slug,
    required this.warrantyId,
    required this.point,
    required this.redeemable,
    required this.wholesaleDiscount,
    required this.packPrice,
    required this.packStock,
    required this.packWeight,
    required this.packWidth,
    required this.packLength,
    required this.packHeight,
    required this.packWeightMetricId,
    required this.preorder,
    required this.sample,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.productId,
    required this.cName,
    required this.category,
    required this.wName,
    required this.mwName,
    required this.mvName,
    required this.variantGroups,
    required this.images,
    required this.quantity,
  });

  String id;
  String sku;
  String categoryId;
  String subcategoryId;
  String name;
  String description;
  String image;
  String stock;
  String boxStock;
  String ballStock;
  String cogs;
  String price;
  String boxPrice;
  String ballPrice;
  String specialPrice;
  String isWholesale;
  String isVariant;
  String rating;
  String sold;
  String weight;
  String boxWeight;
  String ballWeight;
  String length;
  String width;
  String height;
  String boxLength;
  String boxWidth;
  String boxHeight;
  String ballLength;
  String ballWidth;
  String ballHeight;
  String weightMetricId;
  String boxWeightMetricId;
  String ballWeightMetricId;
  String volumeMetricId;
  String slug;
  String warrantyId;
  String point;
  String redeemable;
  String wholesaleDiscount;
  String packPrice;
  String packStock;
  String packWeight;
  String packWidth;
  String packLength;
  String packHeight;
  String packWeightMetricId;
  dynamic preorder;
  String sample;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String productId;
  String cName;
  String category;
  String wName;
  String mwName;
  String mvName;
  List<dynamic> variantGroups;
  List<String> images;
  int quantity;

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        sku: json["sku"],
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        stock: json["stock"],
        boxStock: json["box_stock"],
        ballStock: json["ball_stock"],
        cogs: json["cogs"],
        price: json["price"],
        boxPrice: json["box_price"],
        ballPrice: json["ball_price"],
        specialPrice: json["special_price"],
        isWholesale: json["is_wholesale"],
        isVariant: json["is_variant"],
        rating: json["rating"],
        sold: json["sold"],
        weight: json["weight"],
        boxWeight: json["box_weight"],
        ballWeight: json["ball_weight"],
        length: json["length"],
        width: json["width"],
        height: json["height"],
        boxLength: json["box_length"],
        boxWidth: json["box_width"],
        boxHeight: json["box_height"],
        ballLength: json["ball_length"],
        ballWidth: json["ball_width"],
        ballHeight: json["ball_height"],
        weightMetricId: json["weight_metric_id"],
        boxWeightMetricId: json["box_weight_metric_id"],
        ballWeightMetricId: json["ball_weight_metric_id"],
        volumeMetricId: json["volume_metric_id"],
        slug: json["slug"],
        warrantyId: json["warranty_id"],
        point: json["point"],
        redeemable: json["redeemable"],
        wholesaleDiscount: json["wholesale_discount"],
        packPrice: json["pack_price"],
        packStock: json["pack_stock"],
        packWeight: json["pack_weight"],
        packWidth: json["pack_width"],
        packLength: json["pack_length"],
        packHeight: json["pack_height"],
        packWeightMetricId: json["pack_weight_metric_id"],
        preorder: json["preorder"],
        sample: json["sample"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        productId: json["product_id"],
        cName: json["cName"],
        category: json["category"],
        wName: json["wName"],
        mwName: json["mwName"],
        mvName: json["mvName"],
        variantGroups: json['variant_groups'] == null
            ? []
            : List<dynamic>.from(json["variant_groups"].map((x) => x)),
        images: List<String>.from(json["images"].map((x) => x)),
        quantity: 1,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "sku": sku,
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "name": name,
        "description": description,
        "image": image,
        "stock": stock,
        "box_stock": boxStock,
        "ball_stock": ballStock,
        "cogs": cogs,
        "price": price,
        "box_price": boxPrice,
        "ball_price": ballPrice,
        "special_price": specialPrice,
        "is_wholesale": isWholesale,
        "is_variant": isVariant,
        "rating": rating,
        "sold": sold,
        "weight": weight,
        "box_weight": boxWeight,
        "ball_weight": ballWeight,
        "length": length,
        "width": width,
        "height": height,
        "box_length": boxLength,
        "box_width": boxWidth,
        "box_height": boxHeight,
        "ball_length": ballLength,
        "ball_width": ballWidth,
        "ball_height": ballHeight,
        "weight_metric_id": weightMetricId,
        "box_weight_metric_id": boxWeightMetricId,
        "ball_weight_metric_id": ballWeightMetricId,
        "volume_metric_id": volumeMetricId,
        "slug": slug,
        "warranty_id": warrantyId,
        "point": point,
        "redeemable": redeemable,
        "wholesale_discount": wholesaleDiscount,
        "pack_price": packPrice,
        "pack_stock": packStock,
        "pack_weight": packWeight,
        "pack_width": packWidth,
        "pack_length": packLength,
        "pack_height": packHeight,
        "pack_weight_metric_id": packWeightMetricId,
        "preorder": preorder,
        "sample": sample,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "product_id": productId,
        "cName": cName,
        "category": category,
        "wName": wName,
        "mwName": mwName,
        "mvName": mvName,
        "variant_groups": List<dynamic>.from(variantGroups.map((x) => x)),
        "images": List<dynamic>.from(images.map((x) => x)),
      };

  @override
  List<Object?> get props => [
        id,
        sku,
        categoryId,
        subcategoryId,
        name,
        description,
        image,
        stock,
        boxStock,
        ballStock,
        cogs,
        price,
        boxPrice,
        ballPrice,
        specialPrice,
        isWholesale,
        isVariant,
        rating,
        sold,
        weight,
        boxWeight,
        ballWeight,
        length,
        width,
        height,
        boxLength,
        boxWidth,
        boxHeight,
        ballLength,
        ballWidth,
        ballHeight,
        weightMetricId,
        boxWeightMetricId,
        ballWeightMetricId,
        volumeMetricId,
        slug,
        warrantyId,
        point,
        redeemable,
        wholesaleDiscount,
        packPrice,
        packStock,
        packWeight,
        packWidth,
        packLength,
        packHeight,
        packWeightMetricId,
        preorder,
        sample,
        createdAt,
        updatedAt,
        deletedAt,
        productId,
        cName,
        category,
        wName,
        mwName,
        mvName,
        variantGroups,
        images,
        quantity
      ];
}
