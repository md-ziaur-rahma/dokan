import 'dart:convert';

class ProductModel {
  final int id;
  final String name;
  final String slug;
  final String postAuthor;
  final String permalink;
  final DateTime dateCreated;
  final DateTime dateCreatedGmt;
  final DateTime dateModified;
  final DateTime dateModifiedGmt;
  final String type;
  final String status;
  final bool featured;
  final String catalogVisibility;
  final String description;
  final String shortDescription;
  final String sku;
  final String price;
  final String regularPrice;
  final String salePrice;
  final dynamic dateOnSaleFrom;
  final dynamic dateOnSaleFromGmt;
  final dynamic dateOnSaleTo;
  final dynamic dateOnSaleToGmt;
  final String priceHtml;
  final bool onSale;
  final bool purchasable;
  final int totalSales;
  final bool virtual;
  final bool downloadable;
  final List<Download> downloads;
  final int downloadLimit;
  final int downloadExpiry;
  final String externalUrl;
  final String buttonText;
  final String taxStatus;
  final String taxClass;
  final bool manageStock;
  final int stockQuantity;
  final dynamic lowStockAmount;
  final bool inStock;
  final String backorders;
  final bool backordersAllowed;
  final bool backordered;
  final bool soldIndividually;
  final String weight;
  final Dimensions dimensions;
  final bool shippingRequired;
  final bool shippingTaxable;
  final String shippingClass;
  final int shippingClassId;
  final bool reviewsAllowed;
  final String averageRating;
  final int ratingCount;
  final List<int> relatedIds;
  final List<dynamic> upsellIds;
  final List<dynamic> crossSellIds;
  final int parentId;
  final String purchaseNote;
  final List<Category> categories;
  final List<Category> tags;
  final List<Image> images;
  final List<Attribute> attributes;
  final List<dynamic> defaultAttributes;
  final List<int> variations;
  final List<dynamic> groupedProducts;
  final int menuOrder;
  final List<MetaDatum> metaData;
  final Store store;
  final Links links;

  ProductModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.postAuthor,
    required this.permalink,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.type,
    required this.status,
    required this.featured,
    required this.catalogVisibility,
    required this.description,
    required this.shortDescription,
    required this.sku,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.dateOnSaleFrom,
    required this.dateOnSaleFromGmt,
    required this.dateOnSaleTo,
    required this.dateOnSaleToGmt,
    required this.priceHtml,
    required this.onSale,
    required this.purchasable,
    required this.totalSales,
    required this.virtual,
    required this.downloadable,
    required this.downloads,
    required this.downloadLimit,
    required this.downloadExpiry,
    required this.externalUrl,
    required this.buttonText,
    required this.taxStatus,
    required this.taxClass,
    required this.manageStock,
    required this.stockQuantity,
    required this.lowStockAmount,
    required this.inStock,
    required this.backorders,
    required this.backordersAllowed,
    required this.backordered,
    required this.soldIndividually,
    required this.weight,
    required this.dimensions,
    required this.shippingRequired,
    required this.shippingTaxable,
    required this.shippingClass,
    required this.shippingClassId,
    required this.reviewsAllowed,
    required this.averageRating,
    required this.ratingCount,
    required this.relatedIds,
    required this.upsellIds,
    required this.crossSellIds,
    required this.parentId,
    required this.purchaseNote,
    required this.categories,
    required this.tags,
    required this.images,
    required this.attributes,
    required this.defaultAttributes,
    required this.variations,
    required this.groupedProducts,
    required this.menuOrder,
    required this.metaData,
    required this.store,
    required this.links,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    String? slug,
    String? postAuthor,
    String? permalink,
    DateTime? dateCreated,
    DateTime? dateCreatedGmt,
    DateTime? dateModified,
    DateTime? dateModifiedGmt,
    String? type,
    String? status,
    bool? featured,
    String? catalogVisibility,
    String? description,
    String? shortDescription,
    String? sku,
    String? price,
    String? regularPrice,
    String? salePrice,
    dynamic dateOnSaleFrom,
    dynamic dateOnSaleFromGmt,
    dynamic dateOnSaleTo,
    dynamic dateOnSaleToGmt,
    String? priceHtml,
    bool? onSale,
    bool? purchasable,
    int? totalSales,
    bool? virtual,
    bool? downloadable,
    List<Download>? downloads,
    int? downloadLimit,
    int? downloadExpiry,
    String? externalUrl,
    String? buttonText,
    String? taxStatus,
    String? taxClass,
    bool? manageStock,
    int? stockQuantity,
    dynamic lowStockAmount,
    bool? inStock,
    String? backorders,
    bool? backordersAllowed,
    bool? backordered,
    bool? soldIndividually,
    String? weight,
    Dimensions? dimensions,
    bool? shippingRequired,
    bool? shippingTaxable,
    String? shippingClass,
    int? shippingClassId,
    bool? reviewsAllowed,
    String? averageRating,
    int? ratingCount,
    List<int>? relatedIds,
    List<dynamic>? upsellIds,
    List<dynamic>? crossSellIds,
    int? parentId,
    String? purchaseNote,
    List<Category>? categories,
    List<Category>? tags,
    List<Image>? images,
    List<Attribute>? attributes,
    List<dynamic>? defaultAttributes,
    List<int>? variations,
    List<dynamic>? groupedProducts,
    int? menuOrder,
    List<MetaDatum>? metaData,
    Store? store,
    Links? links,
  }) =>
      ProductModel(
        id: id ?? this.id,
        name: name ?? this.name,
        slug: slug ?? this.slug,
        postAuthor: postAuthor ?? this.postAuthor,
        permalink: permalink ?? this.permalink,
        dateCreated: dateCreated ?? this.dateCreated,
        dateCreatedGmt: dateCreatedGmt ?? this.dateCreatedGmt,
        dateModified: dateModified ?? this.dateModified,
        dateModifiedGmt: dateModifiedGmt ?? this.dateModifiedGmt,
        type: type ?? this.type,
        status: status ?? this.status,
        featured: featured ?? this.featured,
        catalogVisibility: catalogVisibility ?? this.catalogVisibility,
        description: description ?? this.description,
        shortDescription: shortDescription ?? this.shortDescription,
        sku: sku ?? this.sku,
        price: price ?? this.price,
        regularPrice: regularPrice ?? this.regularPrice,
        salePrice: salePrice ?? this.salePrice,
        dateOnSaleFrom: dateOnSaleFrom ?? this.dateOnSaleFrom,
        dateOnSaleFromGmt: dateOnSaleFromGmt ?? this.dateOnSaleFromGmt,
        dateOnSaleTo: dateOnSaleTo ?? this.dateOnSaleTo,
        dateOnSaleToGmt: dateOnSaleToGmt ?? this.dateOnSaleToGmt,
        priceHtml: priceHtml ?? this.priceHtml,
        onSale: onSale ?? this.onSale,
        purchasable: purchasable ?? this.purchasable,
        totalSales: totalSales ?? this.totalSales,
        virtual: virtual ?? this.virtual,
        downloadable: downloadable ?? this.downloadable,
        downloads: downloads ?? this.downloads,
        downloadLimit: downloadLimit ?? this.downloadLimit,
        downloadExpiry: downloadExpiry ?? this.downloadExpiry,
        externalUrl: externalUrl ?? this.externalUrl,
        buttonText: buttonText ?? this.buttonText,
        taxStatus: taxStatus ?? this.taxStatus,
        taxClass: taxClass ?? this.taxClass,
        manageStock: manageStock ?? this.manageStock,
        stockQuantity: stockQuantity ?? this.stockQuantity,
        lowStockAmount: lowStockAmount ?? this.lowStockAmount,
        inStock: inStock ?? this.inStock,
        backorders: backorders ?? this.backorders,
        backordersAllowed: backordersAllowed ?? this.backordersAllowed,
        backordered: backordered ?? this.backordered,
        soldIndividually: soldIndividually ?? this.soldIndividually,
        weight: weight ?? this.weight,
        dimensions: dimensions ?? this.dimensions,
        shippingRequired: shippingRequired ?? this.shippingRequired,
        shippingTaxable: shippingTaxable ?? this.shippingTaxable,
        shippingClass: shippingClass ?? this.shippingClass,
        shippingClassId: shippingClassId ?? this.shippingClassId,
        reviewsAllowed: reviewsAllowed ?? this.reviewsAllowed,
        averageRating: averageRating ?? this.averageRating,
        ratingCount: ratingCount ?? this.ratingCount,
        relatedIds: relatedIds ?? this.relatedIds,
        upsellIds: upsellIds ?? this.upsellIds,
        crossSellIds: crossSellIds ?? this.crossSellIds,
        parentId: parentId ?? this.parentId,
        purchaseNote: purchaseNote ?? this.purchaseNote,
        categories: categories ?? this.categories,
        tags: tags ?? this.tags,
        images: images ?? this.images,
        attributes: attributes ?? this.attributes,
        defaultAttributes: defaultAttributes ?? this.defaultAttributes,
        variations: variations ?? this.variations,
        groupedProducts: groupedProducts ?? this.groupedProducts,
        menuOrder: menuOrder ?? this.menuOrder,
        metaData: metaData ?? this.metaData,
        store: store ?? this.store,
        links: links ?? this.links,
      );

  factory ProductModel.fromRawJson(String str) => ProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    postAuthor: json["post_author"],
    permalink: json["permalink"],
    dateCreated: DateTime.parse(json["date_created"]),
    dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
    dateModified: DateTime.parse(json["date_modified"]),
    dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
    type: json["type"],
    status: json["status"],
    featured: json["featured"],
    catalogVisibility: json["catalog_visibility"],
    description: json["description"],
    shortDescription: json["short_description"],
    sku: json["sku"],
    price: json["price"],
    regularPrice: json["regular_price"],
    salePrice: json["sale_price"],
    dateOnSaleFrom: json["date_on_sale_from"],
    dateOnSaleFromGmt: json["date_on_sale_from_gmt"],
    dateOnSaleTo: json["date_on_sale_to"],
    dateOnSaleToGmt: json["date_on_sale_to_gmt"],
    priceHtml: json["price_html"],
    onSale: json["on_sale"],
    purchasable: json["purchasable"],
    totalSales: json["total_sales"],
    virtual: json["virtual"],
    downloadable: json["downloadable"],
    downloads: List<Download>.from(json["downloads"].map((x) => Download.fromJson(x))),
    downloadLimit: json["download_limit"],
    downloadExpiry: json["download_expiry"],
    externalUrl: json["external_url"],
    buttonText: json["button_text"],
    taxStatus: json["tax_status"],
    taxClass: json["tax_class"],
    manageStock: json["manage_stock"],
    stockQuantity: json["stock_quantity"] ?? 0,
    lowStockAmount: json["low_stock_amount"],
    inStock: json["in_stock"],
    backorders: json["backorders"],
    backordersAllowed: json["backorders_allowed"],
    backordered: json["backordered"],
    soldIndividually: json["sold_individually"],
    weight: json["weight"],
    dimensions: Dimensions.fromJson(json["dimensions"]),
    shippingRequired: json["shipping_required"],
    shippingTaxable: json["shipping_taxable"],
    shippingClass: json["shipping_class"],
    shippingClassId: json["shipping_class_id"],
    reviewsAllowed: json["reviews_allowed"],
    averageRating: json["average_rating"],
    ratingCount: json["rating_count"],
    relatedIds: List<int>.from(json["related_ids"].map((x) => x)),
    upsellIds: List<dynamic>.from(json["upsell_ids"].map((x) => x)),
    crossSellIds: List<dynamic>.from(json["cross_sell_ids"].map((x) => x)),
    parentId: json["parent_id"],
    purchaseNote: json["purchase_note"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    tags: List<Category>.from(json["tags"].map((x) => Category.fromJson(x))),
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
    defaultAttributes: List<dynamic>.from(json["default_attributes"].map((x) => x)),
    variations: List<int>.from(json["variations"].map((x) => x)),
    groupedProducts: List<dynamic>.from(json["grouped_products"].map((x) => x)),
    menuOrder: json["menu_order"],
    metaData: List<MetaDatum>.from(json["meta_data"].map((x) => MetaDatum.fromJson(x))),
    store: Store.fromJson(json["store"]),
    links: Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "post_author": postAuthor,
    "permalink": permalink,
    "date_created": dateCreated.toIso8601String(),
    "date_created_gmt": dateCreatedGmt.toIso8601String(),
    "date_modified": dateModified.toIso8601String(),
    "date_modified_gmt": dateModifiedGmt.toIso8601String(),
    "type": type,
    "status": status,
    "featured": featured,
    "catalog_visibility": catalogVisibility,
    "description": description,
    "short_description": shortDescription,
    "sku": sku,
    "price": price,
    "regular_price": regularPrice,
    "sale_price": salePrice,
    "date_on_sale_from": dateOnSaleFrom,
    "date_on_sale_from_gmt": dateOnSaleFromGmt,
    "date_on_sale_to": dateOnSaleTo,
    "date_on_sale_to_gmt": dateOnSaleToGmt,
    "price_html": priceHtml,
    "on_sale": onSale,
    "purchasable": purchasable,
    "total_sales": totalSales,
    "virtual": virtual,
    "downloadable": downloadable,
    "downloads": List<dynamic>.from(downloads.map((x) => x.toJson())),
    "download_limit": downloadLimit,
    "download_expiry": downloadExpiry,
    "external_url": externalUrl,
    "button_text": buttonText,
    "tax_status": taxStatus,
    "tax_class": taxClass,
    "manage_stock": manageStock,
    "stock_quantity": stockQuantity,
    "low_stock_amount": lowStockAmount,
    "in_stock": inStock,
    "backorders": backorders,
    "backorders_allowed": backordersAllowed,
    "backordered": backordered,
    "sold_individually": soldIndividually,
    "weight": weight,
    "dimensions": dimensions.toJson(),
    "shipping_required": shippingRequired,
    "shipping_taxable": shippingTaxable,
    "shipping_class": shippingClass,
    "shipping_class_id": shippingClassId,
    "reviews_allowed": reviewsAllowed,
    "average_rating": averageRating,
    "rating_count": ratingCount,
    "related_ids": List<dynamic>.from(relatedIds.map((x) => x)),
    "upsell_ids": List<dynamic>.from(upsellIds.map((x) => x)),
    "cross_sell_ids": List<dynamic>.from(crossSellIds.map((x) => x)),
    "parent_id": parentId,
    "purchase_note": purchaseNote,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
    "default_attributes": List<dynamic>.from(defaultAttributes.map((x) => x)),
    "variations": List<dynamic>.from(variations.map((x) => x)),
    "grouped_products": List<dynamic>.from(groupedProducts.map((x) => x)),
    "menu_order": menuOrder,
    "meta_data": List<dynamic>.from(metaData.map((x) => x.toJson())),
    "store": store.toJson(),
    "_links": links.toJson(),
  };
}

class Attribute {
  final int id;
  final String slug;
  final String name;
  final int position;
  final bool visible;
  final bool variation;
  final List<String> options;

  Attribute({
    required this.id,
    required this.slug,
    required this.name,
    required this.position,
    required this.visible,
    required this.variation,
    required this.options,
  });

  Attribute copyWith({
    int? id,
    String? slug,
    String? name,
    int? position,
    bool? visible,
    bool? variation,
    List<String>? options,
  }) =>
      Attribute(
        id: id ?? this.id,
        slug: slug ?? this.slug,
        name: name ?? this.name,
        position: position ?? this.position,
        visible: visible ?? this.visible,
        variation: variation ?? this.variation,
        options: options ?? this.options,
      );

  factory Attribute.fromRawJson(String str) => Attribute.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
    id: json["id"],
    slug: json["slug"],
    name: json["name"],
    position: json["position"],
    visible: json["visible"],
    variation: json["variation"],
    options: List<String>.from(json["options"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "name": name,
    "position": position,
    "visible": visible,
    "variation": variation,
    "options": List<dynamic>.from(options.map((x) => x)),
  };
}

class Category {
  final int id;
  final String name;
  final String slug;

  Category({
    required this.id,
    required this.name,
    required this.slug,
  });

  Category copyWith({
    int? id,
    String? name,
    String? slug,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        slug: slug ?? this.slug,
      );

  factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
  };
}

class Dimensions {
  final String length;
  final String width;
  final String height;

  Dimensions({
    required this.length,
    required this.width,
    required this.height,
  });

  Dimensions copyWith({
    String? length,
    String? width,
    String? height,
  }) =>
      Dimensions(
        length: length ?? this.length,
        width: width ?? this.width,
        height: height ?? this.height,
      );

  factory Dimensions.fromRawJson(String str) => Dimensions.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
    length: json["length"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "length": length,
    "width": width,
    "height": height,
  };
}

class Download {
  final String id;
  final String name;
  final String file;

  Download({
    required this.id,
    required this.name,
    required this.file,
  });

  Download copyWith({
    String? id,
    String? name,
    String? file,
  }) =>
      Download(
        id: id ?? this.id,
        name: name ?? this.name,
        file: file ?? this.file,
      );

  factory Download.fromRawJson(String str) => Download.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Download.fromJson(Map<String, dynamic> json) => Download(
    id: json["id"],
    name: json["name"],
    file: json["file"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "file": file,
  };
}

class Image {
  final int id;
  final DateTime dateCreated;
  final DateTime dateCreatedGmt;
  final DateTime dateModified;
  final DateTime dateModifiedGmt;
  final String src;
  final String name;
  final String alt;
  final int position;

  Image({
    required this.id,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.src,
    required this.name,
    required this.alt,
    required this.position,
  });

  Image copyWith({
    int? id,
    DateTime? dateCreated,
    DateTime? dateCreatedGmt,
    DateTime? dateModified,
    DateTime? dateModifiedGmt,
    String? src,
    String? name,
    String? alt,
    int? position,
  }) =>
      Image(
        id: id ?? this.id,
        dateCreated: dateCreated ?? this.dateCreated,
        dateCreatedGmt: dateCreatedGmt ?? this.dateCreatedGmt,
        dateModified: dateModified ?? this.dateModified,
        dateModifiedGmt: dateModifiedGmt ?? this.dateModifiedGmt,
        src: src ?? this.src,
        name: name ?? this.name,
        alt: alt ?? this.alt,
        position: position ?? this.position,
      );

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    dateCreated: DateTime.parse(json["date_created"]),
    dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
    dateModified: DateTime.parse(json["date_modified"]),
    dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
    src: json["src"],
    name: json["name"],
    alt: json["alt"],
    position: json["position"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date_created": dateCreated.toIso8601String(),
    "date_created_gmt": dateCreatedGmt.toIso8601String(),
    "date_modified": dateModified.toIso8601String(),
    "date_modified_gmt": dateModifiedGmt.toIso8601String(),
    "src": src,
    "name": name,
    "alt": alt,
    "position": position,
  };
}

class Links {
  final List<Collection> self;
  final List<Collection> collection;

  Links({
    required this.self,
    required this.collection,
  });

  Links copyWith({
    List<Collection>? self,
    List<Collection>? collection,
  }) =>
      Links(
        self: self ?? this.self,
        collection: collection ?? this.collection,
      );

  factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: List<Collection>.from(json["self"].map((x) => Collection.fromJson(x))),
    collection: List<Collection>.from(json["collection"].map((x) => Collection.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": List<dynamic>.from(self.map((x) => x.toJson())),
    "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
  };
}

class Collection {
  final String href;

  Collection({
    required this.href,
  });

  Collection copyWith({
    String? href,
  }) =>
      Collection(
        href: href ?? this.href,
      );

  factory Collection.fromRawJson(String str) => Collection.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}

class MetaDatum {
  final int id;
  final String key;
  final dynamic value;

  MetaDatum({
    required this.id,
    required this.key,
    required this.value,
  });

  MetaDatum copyWith({
    int? id,
    String? key,
    dynamic value,
  }) =>
      MetaDatum(
        id: id ?? this.id,
        key: key ?? this.key,
        value: value ?? this.value,
      );

  factory MetaDatum.fromRawJson(String str) => MetaDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
    id: json["id"],
    key: json["key"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "key": key,
    "value": value,
  };
}

class ValueClass {
  final String enableWholesale;
  final String price;
  final dynamic quantity;

  ValueClass({
    required this.enableWholesale,
    required this.price,
    required this.quantity,
  });

  ValueClass copyWith({
    String? enableWholesale,
    String? price,
    dynamic quantity,
  }) =>
      ValueClass(
        enableWholesale: enableWholesale ?? this.enableWholesale,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
      );

  factory ValueClass.fromRawJson(String str) => ValueClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ValueClass.fromJson(Map<String, dynamic> json) => ValueClass(
    enableWholesale: json["enable_wholesale"],
    price: json["price"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "enable_wholesale": enableWholesale,
    "price": price,
    "quantity": quantity,
  };
}

class Store {
  final int id;
  final String name;
  final String url;
  final String avatar;
  final Address address;

  Store({
    required this.id,
    required this.name,
    required this.url,
    required this.avatar,
    required this.address,
  });

  Store copyWith({
    int? id,
    String? name,
    String? url,
    String? avatar,
    Address? address,
  }) =>
      Store(
        id: id ?? this.id,
        name: name ?? this.name,
        url: url ?? this.url,
        avatar: avatar ?? this.avatar,
        address: address ?? this.address,
      );

  factory Store.fromRawJson(String str) => Store.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    name: json["name"],
    url: json["url"],
    avatar: json["avatar"],
    address: Address.fromJson(json["address"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "url": url,
    "avatar": avatar,
    "address": address.toJson(),
  };
}

class Address {
  final String street1;
  final String street2;
  final String city;
  final String zip;
  final String country;
  final String state;

  Address({
    required this.street1,
    required this.street2,
    required this.city,
    required this.zip,
    required this.country,
    required this.state,
  });

  Address copyWith({
    String? street1,
    String? street2,
    String? city,
    String? zip,
    String? country,
    String? state,
  }) =>
      Address(
        street1: street1 ?? this.street1,
        street2: street2 ?? this.street2,
        city: city ?? this.city,
        zip: zip ?? this.zip,
        country: country ?? this.country,
        state: state ?? this.state,
      );

  factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    street1: json["street_1"],
    street2: json["street_2"],
    city: json["city"],
    zip: json["zip"],
    country: json["country"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "street_1": street1,
    "street_2": street2,
    "city": city,
    "zip": zip,
    "country": country,
    "state": state,
  };
}
