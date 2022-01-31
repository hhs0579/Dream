ClubModel? clubmodel;

class ClubModel {
  String name;
  String image;
  String clubmaster;
  List<dynamic> clubuserlist;
  List<dynamic> clubuser;
  int clubdonatepoint;

  ClubModel(
      {required this.name,
      required this.image,
      required this.clubmaster,
      required this.clubuserlist,
      required this.clubuser,
      required this.clubdonatepoint});

  ClubModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        image = json['image'],
        clubmaster = json['clubmaster'],
        clubuserlist = json['clubuserlist'],
        clubuser = json['clubuser'],
        clubdonatepoint = json['clubdonatepoint'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'clubmaster': clubmaster,
        'clubuserlist': clubuserlist,
        'clubuser': clubuser,
        'clubdonatepoint': clubdonatepoint,
      };
}