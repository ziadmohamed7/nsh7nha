class AllFavoritsModel {
  bool? success;
  String? message;
  List<Data>? data;

  AllFavoritsModel({this.success, this.message, this.data});

  AllFavoritsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  int? cardId;
  String? createdAt;
  String? updatedAt;
  Card? card;

  Data(
      {this.id,
      this.userId,
      this.cardId,
      this.createdAt,
      this.updatedAt,
      this.card});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    cardId = json['card_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    card = json['card'] != null ? Card.fromJson(json['card']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['card_id'] = cardId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (card != null) {
      data['card'] = card!.toJson();
    }
    return data;
  }
}

class Card {
  int? id;
  String? title;
  String? description;
  String? image;
  String? price;
  Null discount;
  int? countryId;
  int? categoryId;
  String? createdAt;
  String? updatedAt;

  Card(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.price,
      this.discount,
      this.countryId,
      this.categoryId,
      this.createdAt,
      this.updatedAt});

  Card.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    discount = json['discount'];
    countryId = json['country_id'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['price'] = price;
    data['discount'] = discount;
    data['country_id'] = countryId;
    data['category_id'] = categoryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
