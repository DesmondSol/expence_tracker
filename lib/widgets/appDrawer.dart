// import 'package:flutter/material.dart';
// import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

// class AppDrawer extends StatelessWidget {
//  // const AppDrawer({ Key? key }) : super(key: key);

// AppDrawer({_key});
//   @override
//   Widget build(BuildContext context) {
//      return SliderMenuContainer(
//         appBarColor: Colors.white,
//         key: _key,
//         sliderMenuOpenSize: 200,
//         title: Text(
//           title,
//           style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
//         ),
//         sliderMenu: MenuWidget(
//           onItemClick: (title) {
//             _key.currentState.closeDrawer();
//             setState(() {
//               this.title = title;
//             });
//           },
//         ),
//         sliderMain: MainWidget());
//   }
// }