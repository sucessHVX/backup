// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:wihaoh/controller/post_controller.dart';
// import 'package:wihaoh/view/components/custom_text_form_field.dart';
// import 'package:wihaoh/view/components/custom_textarea.dart';
// import 'package:wihaoh/util/validator_util.dart';

// import '../../components/custom_elevated_button.dart';
// import 'home_page.dart';

// class WritePage extends StatelessWidget {
//   final _formkey = GlobalKey<FormState>();
//   final _title = TextEditingController();
//   final _content = TextEditingController();

//   WritePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     //PostController p = Get.find(); 딴 곳에서도 써야하면 이렇게 위젯이 더 있으면 위로 빼서 작성

//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formkey,
//           child: ListView(
//             children: [
//               CustomTextFormField(
//                 controller: _title,
//                 hint: "제목",
//                 funValidator: validateTitle(),
//               ),
//               CustomTextArea(
//                 controller: _content,
//                 hint: "내용",
//                 funValidator: validateContent(),
//               ),
//               CustomElevatedButton(
//                 text: "등록",
//                 funPageRoute: () async {
//                   if (_formkey.currentState!.validate()) {
//                     //이렇게 한 군데에서만 사용하면 한 줄로 쓰기 가능
//                     await Get.find<PostController>()
//                         .save(_title.text, _content.text);
//                     Get.off(() => HomePage());
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
