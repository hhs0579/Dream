import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //제목칸
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      //프로필 사진받아오기
                      backgroundImage: NetworkImage(
                          'https://www.woolha.com/media/2020/03/eevee.png'),
                    ),
                    SizedBox(width: 5),
                    //프로필 사진,이름 받아오기
                    Text(
                      '황해성',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                Text('1시간전'),
                //시간 받아오기
              ],
            ),
          ),
          Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Center(child: Image.asset('assets/imgs/noin2.jpg'))),
          Container(
              padding: EdgeInsets.only(top: 10),
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Row(children: [
                Container(
                    width: 70,
                    height: 25,
                    margin: EdgeInsets.only(left: 50),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Color(0xff3AAFFC),
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      '노인',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    )),
              ])),
          Container(
            padding: EdgeInsets.only(left: 50, bottom: 10),
            height: 100,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Row(
              children: [
                //작성하기 글 가져오기
                Text('''강림면 노인인구가 41% 로 이중 독거노인이 32%
를 차지하는 초고령사회에 해당하고, 독거노인 
중 거동이 불편하거나 관절 등의 문제로
좌식 식사가 어려운 어르신들에게 입식 식탁을'''),
                Container(
                    padding: EdgeInsets.only(top: 57, right: 15),
                    child: TextButton(
                        onPressed: () {
                          //게시글 전체 보기 글을 늘리기
                        },
                        child: Text('더보기..'))),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 50, bottom: 10),
              height: 35,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Row(children: [
                Text('게시기간: 2021.05.27~2021.06.27',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))
              ])),
          Container(
              height: 40,
              padding: EdgeInsets.only(left: 45),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Row(children: [
                //공감 아이콘
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: Color(0xff3AAFFC),
                  ),
                ),
                //공감 숫자
                Text('59',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xff3AAFFC))),
                //댓글 아이콘
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.comment,
                      color: Color(0xff3AAFFC),
                    ),
                  ),
                ),
                //댓글 숫자
                Text('2',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xff3AAFFC))),
                Container(
                  padding: EdgeInsets.only(left: 80),
                  child: Row(
                    children: [
                      Container(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            color: Color(0xff3AAFFC),
                          ),
                        ),
                      ),
                      Text('공감하기',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xff3AAFFC))),
                    ],
                  ),
                ),
              ])),
          Container(
              padding: EdgeInsets.only(left: 40),
              height: 1200,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                children: [
                  Row(children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('댓글 모두보기'),
                    )
                  ]),
                  Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            //프로필 사진받아오기
                            backgroundImage: NetworkImage(
                                'https://www.woolha.com/media/2020/03/eevee.png'),
                          ),
                          SizedBox(width: 5),
                          //프로필 사진,이름 받아오기
                          Text(
                            '김땡땡',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, height: 1.0),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            height: 20,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Color(0xff3AAFFC))),
                            child: (Text(
                              '물품기부',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff3AAFFC), fontSize: 13),
                            )),
                          )
                        ],
                      ),
                      Text('안녕하세요 저희 집에 입식식탁이 있어서 드리고싶어요.',
                          style: TextStyle(fontSize: 13, height: 1.0)),
                      Container(
                        padding: EdgeInsets.only(top: 17),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              //프로필 사진받아오기
                              backgroundImage: NetworkImage(
                                  'https://www.woolha.com/media/2020/03/eevee.png'),
                            ),
                            SizedBox(width: 5),
                            //프로필 사진,이름 받아오기
                            Text(
                              '박땡땡',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, height: 1.0),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 20,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Color(0xff3AAFFC))),
                              child: (Text(
                                '재능기부',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xff3AAFFC), fontSize: 13),
                              )),
                            )
                          ],
                        ),
                      ),
                      Text(
                        '저도 돕고싶어요~',
                        style: TextStyle(fontSize: 13, height: 1.0),
                      ),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
