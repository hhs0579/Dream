import 'package:dreamproject/model/clubitem.dart';
import 'package:dreamproject/model/clubtest.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

class ClubAddPage extends StatefulWidget {
  const ClubAddPage({Key? key}) : super(key: key);

  @override
  _ClubAddPageState createState() => _ClubAddPageState();
}

class _ClubAddPageState extends State<ClubAddPage> {
  bool _isButton = false;
  bool _isClubcreate = false;
  bool _isEnabld = false;
  bool _isClubName = true;
  List<ClubTest> _clubList = [];

  var _selectindex = null;
  TextEditingController _clubNameController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  void initState() {
    _clubList = [];
    _selectindex = null;
    super.initState();
  }

  Future _getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _image = image;
      }
    });
  }

  _clubeCreateOff() {
    return Container(
      width: Get.width,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _isClubcreate = true;
          });
        },
        child: Text(
          "내 클럽 생성하기",
          style: TextStyle(
            fontSize: 16,
            color: Colors.blue,
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.white,
          side: BorderSide(color: Colors.blue, width: 2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
      ),
    );
  }

  _clubeCreateOn() {
    return Container(
        width: Get.width,
        height: 313,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(
                color: _isEnabldcheck() ? Color(0xff3AAFFC) : Color(0xffd6d6d6),
                width: 1.5),
            borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15, left: 30, right: 30),
              child: Column(
                children: [
                  Container(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('클럽이름',
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black54)),
                          SizedBox(width: 50),
                          Container(
                            width: 210,
                            child: TextField(
                                controller: _clubNameController,
                                textAlign: TextAlign.right,
                                maxLength: 7,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xffd6d6d6))))),
                          )
                        ]),
                  ),
                  _clubNameError(),
                  SizedBox(
                    height: 25,
                  ),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('사진등록',
                        style: TextStyle(fontSize: 13, color: Colors.black54)),
                    SizedBox(width: 70),
                    _clubimage()
                  ]),
                  SizedBox(height: 24),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(23)),
              child: Container(
                width: 370,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isEnabldcheck()
                      ? () {
                          if (_clubNameController.text.isEmpty == false) {
                            ClubTest clubtest = new ClubTest(
                                clubname: _clubNameController.text,
                                image: _image);
                            _clubList.add(clubtest);
                            setState(() {
                              _isClubcreate = false;
                              _isClubName = true;
                              _clubNameController.text = '';
                              _image = null;
                            });
                          } else {
                            setState(() {
                              _isClubName = false;
                            });
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(primary: Color(0xff3AAFFC)),
                  child: Text('클럽 생성하기',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
            )
          ],
        ));
  }

  _ClubItem(name, image, index) {
    return Container(
        width: Get.width,
        height: 120,
        margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          color: _selectindex == index ? Colors.blue[50] : Colors.white,
          shape: BoxShape.rectangle,
          border: Border.all(
              color: _selectindex == index ? Colors.blue : Color(0xffd6d6d6),
              width: 1),
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextButton(
          onPressed: () {
            setState(() {
              if (_selectindex == index) {
                _selectindex = null;
              } else {
                _selectindex = index;
              }
            });
          },
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                      width: 25,
                      height: 25,
                      margin: EdgeInsets.only(left: 12, top: 8),
                      decoration: BoxDecoration(
                          color:
                              _selectindex == index ? Color(0xff3AAFFC) : null,
                          shape: BoxShape.circle,
                          border: _selectindex == index
                              ? null
                              : Border.all(color: Color(0xffd6d6d6))),
                      child: _selectindex == index
                          ? Icon(Icons.done, color: Colors.white)
                          : null)
                ],
              ),
              SizedBox(width: 15),
              Container(
                width: 80,
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Column(children: [
                  Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1,
                            color: Color(0xff3AAFFC),
                          )),
                      child: CircleAvatar(
                          backgroundImage: FileImage(File(image!.path)))),
                  SizedBox(height: 5),
                  Text(name,
                      style: TextStyle(fontSize: 11, color: Color(0xff3AAFFC))),
                ]),
              ),
              SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(children: [
                    Container(
                      width: 60,
                      child: Text('회원 수',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 13, color: Colors.grey)),
                    ),
                    SizedBox(width: 30),
                    Container(
                      width: 100,
                      child: Text('999' + ' 명',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 13, color: Colors.black)),
                    ),
                  ]),
                  SizedBox(height: 15),
                  Row(children: [
                    Container(
                      width: 60,
                      child: Text('총 기부금',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 13, color: Colors.grey)),
                    ),
                    SizedBox(width: 30),
                    Container(
                      width: 100,
                      child: Text('1000000' + ' 원',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 13, color: Colors.black)),
                    ),
                  ]),
                ],
              )
            ],
          ),
        ));
  }

  _clubimage() {
    return _image == null
        ? ElevatedButton(
            onPressed: () {
              _getImage();
            },
            child: CircleAvatar(
              backgroundColor: Color(0xffd6d6d6),
              radius: 50,
              child: Icon(
                Icons.image,
                color: Colors.white,
                size: 50,
              ),
            ),
            style:
                ElevatedButton.styleFrom(elevation: 0, shape: CircleBorder()),
          )
        : ElevatedButton(
            onPressed: () {
              _getImage();
            },
            child: CircleAvatar(
              radius: 50,
              backgroundImage: FileImage(File(_image!.path)),
            ),
            style:
                ElevatedButton.styleFrom(elevation: 0, shape: CircleBorder()),
          );
  }

  _clubNameError() {
    if (_isClubName == false) {
      return Container(
        width: Get.width,
        margin: EdgeInsets.only(top: 8),
        child: Text('클럽 이름을 입력해 주세요.',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 12, color: Color(0xff3AAFFC))),
      );
    } else {
      return Container(
        height: 26,
      );
    }
  }

  _isEnabldcheck() {
    if (_clubNameController.text.isEmpty == false || _image != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back, color: Color(0xff3AAFFC))),
            title: Text('클럽 추가',
                style: TextStyle(
                  fontSize: 15,
                ))),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 300,
                              child: TextField(
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff3AAFFC),
                                            width: 2))),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isClubName = true;
                                  });
                                },
                                icon: Icon(Icons.search,
                                    color: Color(0xff3AAFFC), size: 30))
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                          child: _isClubcreate == false
                              ? _clubeCreateOff()
                              : _clubeCreateOn()),
                      SizedBox(height: 10),
                      _clubList.isEmpty
                          ? Container()
                          : Container(
                              height: _clubList.length * 135,
                              child: ListView.builder(
                                  itemCount: _clubList.length,
                                  itemBuilder: (context, index) {
                                    ClubTest _clubtest =
                                        _clubList.elementAt(index);
                                    return _ClubItem(_clubtest.clubname,
                                        _clubtest.image, index);
                                  }),
                            ),
                    ],
                  ),
                ),
              ),
              _clubList.isEmpty
                  ? Container()
                  : Container(
                      width: 400,
                      height: 50,
                      margin: EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.black,
                            primary: Color(0xff3AAFFC),
                            side: BorderSide(color: Colors.white, width: 2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          child: Text('선택한 클럽 추가하기',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ))))
            ],
          ),
        ));
  }
}
