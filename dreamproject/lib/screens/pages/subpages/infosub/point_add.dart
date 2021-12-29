import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PointAdd extends StatefulWidget {
  const PointAdd({Key? key}) : super(key: key);

  @override
  _PointAddState createState() => _PointAddState();
}

class _PointAddState extends State<PointAdd> {
  var _point = 500000;

  var resultPoint = 0;
  var inputText = '0';

  final _pointEditor = TextEditingController();

  _addPointButton(text, onPressed) {
    return Container(
        width: 60,
        height: 35,
        child: TextButton(
          onPressed: onPressed,
          child: Text(text, style: TextStyle(fontSize: 11)),
          style: TextButton.styleFrom(
            elevation: 0,
            primary: Colors.blue,
            side: BorderSide(color: Colors.blue),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ));
  }

  _resultPoint(point) {
    double result = double.parse(point);
    result += result / 10;
    return result.floor().toString();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pointEditor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.close, color: Color(0xff3AAFFC), size: 30)),
          actions: [
            TextButton(
                onPressed: () {},
                child: Text('완료',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff3AAFFC),
                        fontWeight: FontWeight.bold)))
          ],
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text('나의 포인트',
                      style: TextStyle(fontSize: 9, color: Colors.grey)),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$_point',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      SizedBox(width: 8),
                      Text('Point', style: TextStyle(fontSize: 15))
                    ],
                  ),
                  Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Icon(Icons.add_circle_outline_sharp,
                          color: Color(0xff3AAFFC), size: 30)),
                  Text('결제 시 추가될 포인트',
                      style: TextStyle(fontSize: 9, color: Colors.grey)),
                  SizedBox(height: 10),
                  Container(
                    width: 320,
                    child: TextField(
                        controller: _pointEditor,
                        onChanged: (text) {
                          if (text != '') {
                            inputText = text;
                          } else {
                            inputText = '0';
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            hintText: '금액 직접 입력',
                            hintStyle:
                                TextStyle(fontSize: 15, color: Colors.grey),
                            suffixIcon:
                                Text('Point', style: TextStyle(fontSize: 15)),
                            suffixIconConstraints: BoxConstraints())),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 320,
                    child: Row(
                      children: [
                        _addPointButton('+ 1천', () {
                          setState(() {
                            var result = int.parse(inputText);
                            result += 1000;
                            inputText = result.toString();
                            _pointEditor.text = inputText;
                          });
                        }),
                        SizedBox(width: 5),
                        _addPointButton('+ 5천', () {
                          setState(() {
                            var result = int.parse(inputText);
                            result += 5000;
                            inputText = result.toString();
                            _pointEditor.text = inputText;
                          });
                        }),
                        SizedBox(width: 5),
                        _addPointButton('+ 1만', () {
                          setState(() {
                            var result = int.parse(inputText);
                            result += 10000;
                            inputText = result.toString();
                            _pointEditor.text = inputText;
                          });
                        }),
                        SizedBox(width: 5),
                        _addPointButton('+ 1만5천', () {
                          setState(() {
                            var result = int.parse(inputText);
                            result += 15000;
                            inputText = result.toString();
                            _pointEditor.text = inputText;
                          });
                        }),
                        SizedBox(width: 5),
                        _addPointButton('+ 2만', () {
                          setState(() {
                            var result = int.parse(inputText);
                            result += 20000;
                            inputText = result.toString();
                            _pointEditor.text = inputText;
                          });
                        }),
                      ],
                    ),
                  ),
                  SizedBox(height: 220),
                  Container(
                    width: 320,
                    height: 1,
                    margin: EdgeInsets.only(bottom: 15),
                    color: Colors.grey[300],
                  ),
                  Container(
                    width: 280,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('부가세(VAT) 포함한 결제 금액',
                                  style: TextStyle(
                                    fontSize: 9,
                                    color: Colors.grey,
                                  )),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  _pointEditor.text == ''
                                      ? Text('0',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xff3AAFFC)))
                                      : Text(_resultPoint(_pointEditor.text),
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xff3AAFFC))),
                                  SizedBox(width: 5),
                                  Text('원',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff3AAFFC)))
                                ],
                              ),
                            ],
                          )
                        ]),
                  ),
                  SizedBox(height: 20),
                  Visibility(
                    visible: _pointEditor.text != '',
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(320, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25))),
                        onPressed: () {},
                        child: Text('결제하기',
                            style:
                                TextStyle(fontSize: 15, color: Colors.white))),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
