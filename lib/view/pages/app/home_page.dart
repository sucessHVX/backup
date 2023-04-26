// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:wihaoh/controller/post_controller.dart';
// import 'package:wihaoh/controller/user_controller.dart';
// import 'package:wihaoh/view/pages/app/detail_page.dart';
// import 'package:wihaoh/view/pages/app/write_page.dart';
// import 'package:wihaoh/view/pages/user/login_page.dart';
// import 'package:wihaoh/size.dart';

// import '../user/user_page.dart';

// class HomePage extends StatelessWidget {
//   var refreshKey = GlobalKey<RefreshIndicatorState>();

//   HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     //put은 없으면 만들고, 이미 만들어뒀으면 찾기
//     UserController u = Get.find();
//     PostController p = Get.put(PostController());
//     //p.findAll();

//     return Scaffold(
//         drawer: _navigation(context),
//         appBar: AppBar(
//           //Obx가 변경까지 관찰해주는 함수
//           title: Obx(() => Text("${u.isLogin}")),
//         ),
//         body: Obx(
//           () => RefreshIndicator(
//             key: refreshKey,
//             onRefresh: () async {
//               await p.findAll();
//             },
//             child: ListView.separated(
//               itemCount: p.posts.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   onTap: () async {
//                     await p.findById(p.posts[index].id!); //!가 붙으면 null이 절대 아닌 것
//                     Get.to(DetailPage(p.posts[index].id), arguments: "이걸로 넘김");
//                   },
//                   title: Text("${p.posts[index].title}"),
//                   leading: Text("${p.posts[index].id}"),
//                 );
//               },
//               separatorBuilder: (context, index) {
//                 return const Divider();
//               },
//             ),
//           ),
//         ));
//   }
// }

// Widget _navigation(BuildContext context) {
//   UserController u = Get.find(); //다시 찾기
//   return Container(
//     //메뉴
//     width: getDrawerWidth(context),
//     height: double.infinity,
//     color: Colors.white,
//     child: SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0), //모든면에 패딩
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context); //뒤로 돌아왔을 때 메뉴창 제거
//               Get.to(() => WritePage());
//             },
//             child: const Text(
//               "글쓰기",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black54,
//               ),
//             ),
//           ),
//           const Divider(),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               Get.to(() => const UserPage());
//             },
//             child: const Text(
//               "회원정보",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black54,
//               ),
//             ),
//           ),
//           const Divider(),
//           TextButton(
//             onPressed: () {
//               u.logout();
//               Get.to(() => LoginPage());
//             },
//             child: const Text(
//               "로그아웃",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black54,
//               ),
//             ),
//           ),
//           const Divider(),
//         ]),
//       ),
//     ),
//   );
// }
