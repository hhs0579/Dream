import 'package:flutter/material.dart';

class AppBars extends StatelessWidget {
  const AppBars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '드림 소개',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: (Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Text('''  드림 소개 
드림(DREAM)
대중의 문제를 대중의 생각으로, SNS 솔루션 펀딩 플랫폼

Q. What's your LOOK?

"사회문제의 발굴이 어려운 것이 바로 사회문제."

사회문제에 경중은 없습니다. 발굴된 사회문제와 그렇지 않은 사회문제가 있을 뿐입니다.
드림을 통해 목격한 혹은 직접 겪은 사회문제를 공유하고 사람들과 함께 해당 사회문제를 해결하고 복지 사각지대를 줄여나가 보세요.

Q. Rookie Solution?

사용자가 직접 사회문제를 제보하고 솔루션을 제안, 기획할 수 있는 SNS 형태의 플랫폼입니다.

드림은 각 솔루션마다 금전 기부와 더불어 재능 기부 물품 기부 등을 받고 해당 내용에 대한 사용자별 영수증과 수혜 영상 증빙과 같은 피드백 서비스를 제공하여 100% 투명한 기부 활동을 실행합니다.

뿐만 아니라 댓글을 통한 아이디어 제안 혹은 공감 표현만으로도 간접적으로 선행에 참여할 수 있습니다.
'''),
        )));
  }
}
