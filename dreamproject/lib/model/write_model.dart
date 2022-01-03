class WriteModel {
  final DateTime date;
  final String type;
  final String message;
  List<dynamic> images;

  WriteModel(
      {required this.date,
      required this.type,
      required this.message,
      required this.images});

  WriteModel.fromJson(Map<String, dynamic> json)
      : date = json['date'].toDate(),
        type = json['type'],
        message = json['message'],
        images = json['images'];

  Map<String, dynamic> toJson() => {
        'date': date,
        'type': type,
        'message': message,
        'images': images,
      };
  static get keyDate => 'date';
  static get keyType => 'type';
  static get keyMessage => 'message';
  static get keyImages => 'images';
}
