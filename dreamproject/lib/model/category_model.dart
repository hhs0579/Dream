CategoryModel? categoryModel;

class CategoryModel {
  String category;
  int donateuser;
  int monthdonation;
  int yeardonation;
  int totaldonate;

  CategoryModel(
      {required this.category,
      required this.donateuser,
      required this.monthdonation,
      required this.yeardonation,
      required this.totaldonate});

  CategoryModel.fromJson(Map<String, dynamic> json)
      : category = json['category'],
        donateuser = json['donateuser'],
        monthdonation = json['monthdonation'],
        yeardonation = json['yeardonation'],
        totaldonate = json['totaldonate'];

  Map<String, dynamic> toJson() => {
        'category': category,
        'donateuser': donateuser,
        'monthdonation': monthdonation,
        'yeardonation': yeardonation,
        'totaldonate': totaldonate
      };
}
