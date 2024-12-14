class RatingModel {
  int? stars;
  String? comments;
  int? itemsId;

  RatingModel({this.stars, this.comments, this.itemsId});

  RatingModel.fromJson(Map<String, dynamic> json) {
    stars = json['stars'];
    comments = json['comments'];
    itemsId = json['items_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stars'] = this.stars;
    data['comments'] = this.comments;
    data['items_id'] = this.itemsId;
    return data;
  }
}
