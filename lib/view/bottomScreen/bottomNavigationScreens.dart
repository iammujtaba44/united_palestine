import 'package:flutter/material.dart';
import 'package:united_palestine/view/bottomScreen/community.dart';
import 'package:united_palestine/view/bottomScreen/network.dart';
import 'package:united_palestine/view/bottomScreen/upGov.dart';
import 'file:///D:/Projects/united_palestine1/lib/view/drawer_screens/drawer.dart';
import '../../project_theme.dart';
import 'file:///D:/Projects/united_palestine1/lib/view/bottomScreen/updates_screen.dart';

class BottomNavigationScreens extends StatefulWidget {
  @override
  _BottomNavigationScreensState createState() => _BottomNavigationScreensState();
}

class _BottomNavigationScreensState extends State<BottomNavigationScreens> {

  int _currentIndex = 0;
  // final List<Widget> _children = [
  //   // Updatescreen(), UpGov_screen(),NetworkScreen(),CommunityScreen()
  // ];
  final List<String> _titleList =['UPDATES', 'U.P GOVERNANCE ','NETWORK','COMMUNITY'];

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: buildCustomDrawer(_height, _width, context),
      appBar: AppBar(
        toolbarHeight: _height * 0.08,
        title: Center(child: Text(_titleList[_currentIndex])),
        backgroundColor: ProjectTheme.projectPrimaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
      ),
        bottomNavigationBar: SizedBox(
          height: _height * 0.09,
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: ProjectTheme.projectPrimaryColor,
            selectedLabelStyle: TextStyle(
              fontSize: 14,
            ),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white60,
            items: [
              BottomNavigationBarItem(

                icon: ImageIcon(
                  AssetImage(
                    'assets/icons/1.png',
                  ),size: 35,
                ),
                label: 'Updates',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    'assets/icons/2.png',
                  ),size: 35,
                ),
                label: 'U.P GOV.',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                    AssetImage(
                      'assets/icons/3.png',
                    ),size: 35
                ),
                label: 'Network',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                    AssetImage(
                      'assets/icons/4.png',
                    ),size: 35
                ),
                label: 'Community',
              ),
            ],
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
                _pageController.animateToPage(index,
                    duration: Duration(milliseconds: 500), curve: Curves.easeOut);
              });
            },
          ),
        ),
        body: PageView(controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
        children: <Widget>[Updatescreen(), UpGov_screen(),NetworkScreen(),CommunityScreen()],)
    );

  }
}
