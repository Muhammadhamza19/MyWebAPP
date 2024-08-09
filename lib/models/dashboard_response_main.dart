// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Category {
  String? image;
  String? categoryName;
  Category({
    this.categoryName,
    this.image,
  });
  static List<Category> getDummyCategorys() {
    return [
      Category(image: 'assets/images/vegetable.png', categoryName: 'Vegetable'),
      Category(image: 'assets/images/milk.png', categoryName: 'Milk'),
      Category(image: 'assets/images/vegetable.png', categoryName: 'Vegetable'),
      Category(image: 'assets/images/milk.png', categoryName: 'Milk'),
      Category(image: 'assets/images/vegetable.png', categoryName: 'Vegetable'),
      Category(image: 'assets/images/milk.png', categoryName: 'Milk'),
      Category(image: 'assets/images/vegetable.png', categoryName: 'Vegetable'),
      Category(image: 'assets/images/milk.png', categoryName: 'Milk'),
      // Add more dummy Categorys as needed
    ];
  }
}

class StoreDeal {
  String? image;
  int? id;
  String? storeName;
  String? discountOffer;
  String? dealDesc1;
  String? dealDesc2;
  double? currentRating;
  String? martDistance;

  StoreDeal({
    this.storeName,
    this.id,
    this.discountOffer,
    this.dealDesc1,
    this.dealDesc2,
    this.image,
    this.currentRating,
    this.martDistance,
  });
  static List<StoreDeal> getDummyStoreDeal() {
    return [
      StoreDeal(
        id: 1,
        image: 'vegetable',
        storeName: "Walmart Store Walmart Store",
        discountOffer: "Avail 20% Off",
        dealDesc1: "Delivery Weekdays 04:00 PM to 8:00 PM ",
        dealDesc2: "Delivery Weekdays 04:00 PM to 8:00 PM ",
        currentRating: 4,
        martDistance: "5 km away",
      ),
      StoreDeal(
        id: 2,
        image: 'vegetable',
        storeName: "Walmart Store",
        discountOffer: "Avail 20% Off",
        dealDesc1: "Delivery Weekdays 04:00 PM to 8:00 PM ",
        dealDesc2: "Delivery Weekdays 04:00 PM to 8:00 PM ",
        currentRating: 4,
        martDistance: "5 km away",
      ),
      StoreDeal(
        id: 3,
        image: 'vegetable',
        storeName: "Walmart Store ",
        discountOffer: "Avail 20% Off",
        dealDesc1: "Delivery Weekdays 04:00 PM to 8:00 PM ",
        dealDesc2: "Delivery Weekdays 04:00 PM to 8:00 PM ",
        currentRating: 4,
        martDistance: "5 km away",
      ),
      StoreDeal(
        id: 4,
        image: 'vegetable',
        storeName: "Walmart Store Walmart Store",
        discountOffer: "Avail 20% Off",
        dealDesc1: "Delivery Weekdays 04:00 PM to 8:00 PM ",
        dealDesc2: "Delivery Weekdays 04:00 PM to 8:00 PM ",
        currentRating: 4,
        martDistance: "5 km away",
      ),
    ];
  }
}

class Promotion {
  int? promotionIndex;
  List<AllProducts>? products;
  int? promotionType;
  String? promotionTypeDesc;
  String? discountOffer;
  String? storeName;
  String? bundleName;
  String? stockDescription;
  double? currentRating;
  String? martDistance;
  String? orignalRate;
  String? discountlRate;
  String? offerLeft;
  String? offerLeftHeading;

  Promotion({
    this.products,
    this.promotionIndex,
    this.offerLeft,
    this.bundleName,
    this.promotionType,
    this.storeName,
    this.promotionTypeDesc,
    this.offerLeftHeading,
    this.stockDescription,
    this.orignalRate,
    this.discountlRate,
    this.discountOffer,
    this.currentRating,
    this.martDistance,
  });
  static List<Promotion> getDummyPromotion() {
    return [
      Promotion(
        promotionIndex: 1,
        promotionType: 2,
        bundleName: "Fruits",
        promotionTypeDesc: "Bundle Promotion",
        products: [
          AllProducts(
            productName: 'Red Cherry',
            image: 'cherries-clipart-fru',
          ),
          AllProducts(
            productName: 'Red Cherry',
            image: 'cherries-clipart-fru',
          ),
          AllProducts(
            productName: 'Red Cherry',
            image: 'cherries-clipart-fru',
          ),
        ],
        stockDescription: 'In Stock - 1 Kg',
        orignalRate: '\$ 10.00',
        discountlRate: '\$ 5.00',
        offerLeft: '2 Days Left',
        offerLeftHeading: 'ONLINE EXCLUSIVE',
        discountOffer: "60% Off",
        currentRating: 4,
        martDistance: "5 km away",
      ),
      Promotion(
        promotionIndex: 2,
        promotionType: 3,
        promotionTypeDesc: "Store Promotion",
        products: [
          AllProducts(
            productName: 'Red Cherry',
            image: 'cherries-clipart-fru',
          ),
          AllProducts(
            productName: 'Red Cherry',
            image: 'cherries-clipart-fru',
          ),
        ],
        stockDescription: 'In Stock - 1 Kg',
        orignalRate: '\$ 10.00',
        discountlRate: '\$ 5.00',
        offerLeft: '2 Days Left',
        offerLeftHeading: 'ONLINE EXCLUSIVE',
        storeName: "at Walmart Store Walmart Store",
        discountOffer: "60% Off",
        currentRating: 4,
        martDistance: "5 km away",
      ),
      Promotion(
        promotionIndex: 3,
        promotionType: 1,
        promotionTypeDesc: "Product Promotion",
        products: [
          AllProducts(
            productName: 'Red Cherry',
            image: 'cherries-clipart-fru',
          ),
        ],
        stockDescription: 'In Stock - 1 Kg',
        orignalRate: '\$ 10.00',
        discountlRate: '\$ 5.00',
        offerLeft: '2 Days Left',
        offerLeftHeading: 'ONLINE EXCLUSIVE',
        storeName: "at Walmart Store ",
        discountOffer: "60% Off",
        currentRating: 4,
        martDistance: "5 km away",
      ),
    ];
  }
}

class BestSeller {
  String? image;
  String? storeName;
  String? discountOffer;
  String? productName;
  String? stockDescription;
  double? currentRating;
  String? martDistance;
  String? orignalRate;
  String? discountlRate;
  String? offerLeft;
  String? offerLeftHeading;

  BestSeller({
    this.offerLeft,
    this.offerLeftHeading,
    this.productName,
    this.stockDescription,
    this.orignalRate,
    this.discountlRate,
    this.storeName,
    this.discountOffer,
    this.image,
    this.currentRating,
    this.martDistance,
  });
  static List<BestSeller> getDummySeller() {
    return [
      BestSeller(
        productName: 'Red Cherry',
        stockDescription: 'In Stock - 1 Kg',
        orignalRate: '\$ 10.00',
        discountlRate: '\$ 5.00',
        offerLeft: '2 Days Left',
        offerLeftHeading: 'ONLINE EXCLUSIVE',
        image: 'cherries-clipart-fru',
        storeName: "at Walmart Store Walmart Store",
        discountOffer: "60% Off",
        currentRating: 4,
        martDistance: "5 km away",
      ),
      BestSeller(
        productName: 'Red Cherry',
        stockDescription: 'In Stock - 1 Kg',
        orignalRate: '\$ 10.00',
        discountlRate: '\$ 5.00',
        offerLeft: '2 Days Left',
        offerLeftHeading: 'ONLINE EXCLUSIVE',
        image: 'cherries-clipart-fru',
        storeName: "at Walmart Store Walmart Store",
        discountOffer: "60% Off",
        currentRating: 4,
        martDistance: "5 km away",
      ),
      BestSeller(
        productName: 'Red Cherry',
        stockDescription: 'In Stock - 1 Kg',
        orignalRate: '\$ 10.00',
        discountlRate: '\$ 5.00',
        offerLeft: '2 Days Left',
        offerLeftHeading: 'ONLINE EXCLUSIVE',
        image: 'cherries-clipart-fru',
        storeName: "at Walmart Store ",
        discountOffer: "60% Off",
        currentRating: 4,
        martDistance: "5 km away",
      ),
    ];
  }
}

class OrderList {
  String? image;
  String? storeName;
  String? discountOffer;
  String? productName;
  String? stockDescription;
  double? currentRating;
  String? martDistance;
  String? orignalRate;
  String? discountlRate;
  String? offerLeft;
  String? offerLeftHeading;

  OrderList({
    this.offerLeft,
    this.offerLeftHeading,
    this.productName,
    this.stockDescription,
    this.orignalRate,
    this.discountlRate,
    this.storeName,
    this.discountOffer,
    this.image,
    this.currentRating,
    this.martDistance,
  });
  static List<OrderList> getDummySeller() {
    return [
      OrderList(
        productName: 'Red Cherry',
        stockDescription: 'In Stock - 1 Kg',
        orignalRate: '\$ 10.00',
        discountlRate: '\$ 5.00',
        offerLeft: '2 Days Left',
        offerLeftHeading: 'ONLINE EXCLUSIVE',
        image: 'cherries-clipart-fru',
        storeName: "at Walmart Store Walmart Store",
        discountOffer: "60% Off",
        currentRating: 4,
        martDistance: "5 km away",
      ),
      OrderList(
        productName: 'Red Cherry',
        stockDescription: 'In Stock - 1 Kg',
        orignalRate: '\$ 10.00',
        discountlRate: '\$ 5.00',
        offerLeft: '2 Days Left',
        offerLeftHeading: 'ONLINE EXCLUSIVE',
        image: 'cherries-clipart-fru',
        storeName: "at Walmart Store Walmart Store",
        discountOffer: "60% Off",
        currentRating: 4,
        martDistance: "5 km away",
      ),
      OrderList(
        productName: 'Red Cherry',
        stockDescription: 'In Stock - 1 Kg',
        orignalRate: '\$ 10.00',
        discountlRate: '\$ 5.00',
        offerLeft: '2 Days Left',
        offerLeftHeading: 'ONLINE EXCLUSIVE',
        image: 'cherries-clipart-fru',
        storeName: "at Walmart Store ",
        discountOffer: "60% Off",
        currentRating: 4,
        martDistance: "5 km away",
      ),
    ];
  }
}

class SearchProducts {
  int? productId;
  String? image;
  String? storeName;
  String? productName;
  double? currentRating;

  SearchProducts(
      {this.image,
      this.productId,
      this.storeName,
      this.productName,
      this.currentRating});

  static List<SearchProducts> getDummyAllProducts() {
    return [
      SearchProducts(
        productId: 1,
        productName: 'Red Cherry',
        image: 'cherries-clipart-fru',
        storeName: "at Walmart Store Walmart Store",
        currentRating: 4,
      ),
      SearchProducts(
        productId: 2,
        productName: 'Red Cherry',
        image: 'cherries-clipart-fru',
        storeName: "at Walmart Store Walmart Store",
        currentRating: 4,
      ),
      SearchProducts(
        productId: 3,
        productName: 'Red Cherry',
        image: 'cherries-clipart-fru',
        storeName: "at Walmart Store ",
        currentRating: 4,
      ),
    ];
  }
}

class AllProducts {
  int? productId;
  String? image;
  String? storeName;
  String? productName;
  double? currentRating;

  AllProducts(
      {this.image,
      this.productId,
      this.storeName,
      this.productName,
      this.currentRating});

  static List<AllProducts> getDummyAllProducts() {
    return [
      AllProducts(
        productId: 1,
        productName: 'Red Cherry',
        image: 'cherries-clipart-fru',
        storeName: "at Walmart Store Walmart Store",
        currentRating: 4,
      ),
      AllProducts(
        productId: 2,
        productName: 'Red Cherry',
        image: 'cherries-clipart-fru',
        storeName: "at Walmart Store Walmart Store",
        currentRating: 4,
      ),
      AllProducts(
        productId: 3,
        productName: 'Red Cherry',
        image: 'cherries-clipart-fru',
        storeName: "at Walmart Store ",
        currentRating: 4,
      ),
    ];
  }
}

class Review {
  String? reviewer;
  String? comment;
  double? rating;
  String? image;

  Review({
    this.reviewer,
    this.comment,
    this.rating,
    this.image,
  });
}

class BundlePromotion {
  List<Product>? products;
  int? promotionIndex;
  String? bundlePromotion;
  double? originalPrice;
  double? discountedPrice;
  int? quantity;
  String? store;
  bool? available;
  String? offer;
  double? enviromentFees;
  String? currency;
  double? productRating;
  double? recycleFees;
  double? hst;
  List<Review>? reviews;
  String? piecesAvailable;
  double? totalPrice;
  BundlePromotion({
    this.products,
    this.promotionIndex,
    this.bundlePromotion,
    this.originalPrice,
    this.discountedPrice,
    this.quantity,
    this.available,
    this.store,
    this.offer,
    this.enviromentFees,
    this.recycleFees,
    this.hst,
    this.productRating,
    this.currency,
    this.reviews,
    this.piecesAvailable,
    this.totalPrice,
  });
  factory BundlePromotion.dummyData() {
    return BundlePromotion(
      promotionIndex: 1,
      bundlePromotion: "Fruits",
      store: "at Walmart Store",
      quantity: 1,
      originalPrice: 10.00,
      discountedPrice: 5.00,
      enviromentFees: 0.24,
      recycleFees: 0.24,
      hst: 0.07,
      currency: "\$",
      available: true,
      productRating: 4.0,
      offer: "50% OFF",
      products: [
        Product(
          name: "Red Cherry",
          image: 'cherries-clipart-fru',
          description:
              "Red Cherry, Import quality from Pakistan. 100% Fresh and nutritious without any chemical preservatives.",
          ingredients:
              "Red Cherry, Import quality from Pakistan. 100% Fresh and nutritious without any chemical preservatives.",
        ),
        Product(
          name: "Milk",
          image: 'milk',
          description:
              "Milk, Import quality from Pakistan. 100% Fresh and nutritious without any chemical preservatives.",
          ingredients:
              "Milk, Import quality from Pakistan. 100% Fresh and nutritious without any chemical preservatives.",
        ),
      ],
      reviews: [
        Review(
          image: "cherries-clipart-fru",
          reviewer: "Muhammad Saad Iqbal",
          comment: "Amazing product, fresh, healthy.",
          rating: 4.0,
        ),
        Review(
          image: "cherries-clipart-fru",
          reviewer: "Muhammad Saad Iqbal",
          comment: "Amazing product, fresh, healthy.",
          rating: 4.0,
        ),
        Review(
          image: "cherries-clipart-fru",
          reviewer: "Muhammad Saad Iqbal",
          comment: "Amazing product, fresh, healthy.",
          rating: 4.0,
        ),
      ],
      piecesAvailable: "25",
    );
  }
}

class Product {
  int? id;
  String? name;
  String? store;
  String? image;
  String? description;
  int? quantity;
  String? ingredients;
  double? originalPrice;
  double? discountedPrice;
  String? currency;
  bool? available;
  String? offer;
  double? enviromentFees;
  double? recycleFees;
  double? hst;
  String? dealEnd;
  double? productRating;
  List<Review>? reviews;
  String? piecesAvailable;
  double? totalPrice;
  Product({
    this.id,
    this.name,
    this.store,
    this.hst,
    this.image,
    this.enviromentFees,
    this.recycleFees,
    this.currency,
    this.description,
    this.quantity,
    this.ingredients,
    this.originalPrice,
    this.discountedPrice,
    this.available,
    this.offer,
    this.dealEnd,
    this.reviews,
    this.productRating,
    this.piecesAvailable,
    this.totalPrice,
  });

  factory Product.dummyData() {
    return Product(
      id: 1,
      name: "Red Cherry",
      image: 'cherries-clipart-fru',
      store: "at Walmart Store",
      description:
          "Red Cherry, Import quality from Pakistan. 100% Fresh and nutritious without any chemical preservatives.",
      quantity: 1,
      ingredients:
          "Red Cherry, Import quality from Pakistan. 100% Fresh and nutritious without any chemical preservatives.",
      originalPrice: 10.00,
      discountedPrice: 5.00,
      enviromentFees: 0.24,
      recycleFees: 0.24,
      hst: 0.07,
      currency: "\$",
      available: true,
      productRating: 4.0,
      offer: "50% OFF",
      dealEnd: "Deals End in 2 Days",
      reviews: [
        Review(
          image: "cherries-clipart-fru",
          reviewer: "Muhammad Saad Iqbal",
          comment: "Amazing product, fresh, healthy.",
          rating: 4.0,
        ),
        Review(
          image: "cherries-clipart-fru",
          reviewer: "Muhammad Saad Iqbal",
          comment: "Amazing product, fresh, healthy.",
          rating: 4.0,
        ),
        Review(
          image: "cherries-clipart-fru",
          reviewer: "Muhammad Saad Iqbal",
          comment: "Amazing product, fresh, healthy.",
          rating: 4.0,
        ),
      ],
      piecesAvailable: "25",
    );
  }
}

class CartsProduct {
  int? productId;
  String? name;
  String? store;
  double? price;
  String? currency;
  int? quantity;
  String? piecesAvailable;

  CartsProduct({
    this.productId,
    this.name,
    this.store,
    this.price,
    this.currency,
    this.quantity,
    this.piecesAvailable,
  });
}

class Cart {
  List<Product> productList = List.empty(growable: true);
  bool? shouldSendGift;
  List<BundlePromotion> bundlePromotionList = List.empty(growable: true);
  dummyPromotionData(BundlePromotion bundlePromotion) {
    bundlePromotionList.add(bundlePromotion);
    shouldSendGift = false;
  }

  dummyData(Product product) {
    productList.add(product);
    shouldSendGift = false;
  }
}

class Order {
  String? tokenId;
  String? currency;
  double? price;
  String? status;
  String? deliveryMethod;
  String? orderDate;
  List<OrderDetailResponse>? orderDetailResponse;
  Order({
    this.tokenId,
    this.currency,
    this.price,
    this.orderDetailResponse,
    this.status,
    this.deliveryMethod,
    this.orderDate,
  });
  static List<Order> dummyData() {
    return [
      Order(
        tokenId: "LG-001256",
        currency: "\$",
        price: 5.0,
        status: "Not Delivered",
        deliveryMethod: "Local Grocery Devlivery",
        orderDate: "25/03/2020",
        orderDetailResponse: [
          OrderDetailResponse(
            productName: "Red Cherry",
            storeName: "at Walmart Store",
            quantityDetail: "1 kg",
            quantity: 1,
            tokenId: "LG-001256",
            currency: "\$",
            price: 5.0,
            productImage: 'cherries-clipart-fru',
          ),
        ],
      ),
      Order(
        tokenId: "LG-001257",
        currency: "\$",
        price: 5.0,
        status: "Not Delivered",
        deliveryMethod: "Local Grocery Devlivery",
        orderDate: "25/03/2020",
        orderDetailResponse: [
          OrderDetailResponse(
            productName: "Red Cherry",
            storeName: "at Walmart Store",
            quantityDetail: "1 kg",
            quantity: 1,
            tokenId: "LG-001257",
            currency: "\$",
            price: 5.0,
            productImage: 'cherries-clipart-fru',
          ),
        ],
      ),
      Order(
        tokenId: "LG-001258",
        currency: "\$",
        price: 5.0,
        status: "Not Delivered",
        deliveryMethod: "Local Grocery Devlivery",
        orderDate: "25/03/2020",
        orderDetailResponse: [
          OrderDetailResponse(
            productName: "Red Cherry",
            storeName: "at Walmart Store",
            quantityDetail: "1 kg",
            quantity: 1,
            tokenId: "LG-001258",
            currency: "\$",
            price: 5.0,
            productImage: 'cherries-clipart-fru',
          ),
        ],
      ),
    ];
  }
}

class OrderDetailResponse {
  String? productName;
  String? storeName;
  String? productImage;
  String? quantityDetail;
  double? quantity;
  String? tokenId;
  String? currency;
  double? price;
  OrderDetailResponse({
    this.productName,
    this.storeName,
    this.quantityDetail,
    this.quantity,
    this.productImage,
    this.tokenId,
    this.currency,
    this.price,
  });
}

class Transaction {
  String? transactionId;
  String? currency;
  double? price;
  String? status;
  String? deliveryMethod;
  String? TransactionDate;
  List<OrderDetailResponse>? orderDetailResponse;
  Transaction({
    this.transactionId,
    this.currency,
    this.price,
    this.orderDetailResponse,
    this.status,
    this.deliveryMethod,
    this.TransactionDate,
  });
  static List<Transaction> dummyData() {
    return [
      Transaction(
        transactionId: "001256",
        currency: "\$",
        price: 5.0,
        status: "Not Delivered",
        deliveryMethod: "Local Grocery Devlivery",
        TransactionDate: "25/03/2020",
        orderDetailResponse: [
          OrderDetailResponse(
            productName: "Red Cherry",
            storeName: "at Walmart Store",
            quantityDetail: "1 kg",
            quantity: 1,
            tokenId: "LG-001256",
            currency: "\$",
            price: 5.0,
            productImage: 'cherries-clipart-fru',
          ),
        ],
      ),
      Transaction(
        transactionId: "001257",
        currency: "\$",
        price: 5.0,
        status: "Not Delivered",
        deliveryMethod: "Local Grocery Devlivery",
        TransactionDate: "25/03/2020",
        orderDetailResponse: [
          OrderDetailResponse(
            productName: "Red Cherry",
            storeName: "at Walmart Store",
            quantityDetail: "1 kg",
            quantity: 1,
            tokenId: "LG-001257",
            currency: "\$",
            price: 5.0,
            productImage: 'cherries-clipart-fru',
          ),
        ],
      ),
      Transaction(
        transactionId: "001258",
        currency: "\$",
        price: 5.0,
        status: "Not Delivered",
        deliveryMethod: "Local Grocery Devlivery",
        TransactionDate: "25/03/2020",
        orderDetailResponse: [
          OrderDetailResponse(
            productName: "Red Cherry",
            storeName: "at Walmart Store",
            quantityDetail: "1 kg",
            quantity: 1,
            tokenId: "LG-001258",
            currency: "\$",
            price: 5.0,
            productImage: 'cherries-clipart-fru',
          ),
        ],
      ),
    ];
  }
}

class CardDetail {
  int? cardId;
  String? cardNumber;
  String? cardHolderName;
  String? cardExpiry;
  String? cvv;
  CardDetail({
    this.cardNumber,
    this.cardId,
    this.cardHolderName,
    this.cardExpiry,
    this.cvv,
  });
}

class Cards {
  List<CardDetail> cardList = List.empty(growable: true);
}
