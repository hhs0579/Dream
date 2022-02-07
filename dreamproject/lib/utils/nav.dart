import 'package:flutter/material.dart';

class AppFooter extends StatefulWidget {
  @override
  _AppFooterState createState() => _AppFooterState();
}

class _AppFooterState extends State<AppFooter> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return new Theme(
      data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Colors.white,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Colors.green,
          textTheme: Theme.of(context)
              .textTheme
              .copyWith(caption: new TextStyle(color: Colors.grey))),
      child: new BottomNavigationBar(
          selectedLabelStyle: TextStyle(fontSize: 12.0),
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          onTap: (int index) {
            setState(() {
              this.index = index;
            });
            switch (index) {
              case 0:
                Navigator.of(context).pushNamed('/dashboard');
                break;
              case 1:
                Navigator.of(context).pushNamed('/medical centre');
                break;
              case 2:
                Navigator.of(context).pushNamed('/history');
                break;
            }
          },
          items: [
            new BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: index == 0
                    ? new Image.asset('assets/images/dashboard_active.png')
                    : new Image.asset('assets/images/dashboard_inactive.png'),
                label: ('Dashboard'),),
                    // style: new TextStyle(fontSize: 12.0))),
            new BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: index == 1
                    ? new Image.asset('assets/images/medical_sevice_active.png')
                    : new Image.asset(
                        'assets/images/medical_sevice_inactive.png'),
                label: ('Health Services')),
            new BottomNavigationBarItem(
                icon: InkWell(
                  child: Icon(
                    Icons.format_align_left,
                    // color: green,
                    size: 20.0,
                  ),
                ),
                label: ('History')),
          ]),
    );
  }
}
