// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:wihaoh/controller/post_controller.dart';
// import 'package:wihaoh/view/components/custom_text_form_field.dart';
// import 'package:wihaoh/view/components/custom_textarea.dart';
// import 'package:wihaoh/util/validator_util.dart';

// import '../../components/custom_elevated_button.dart';

// class UpdatePage extends StatelessWidget {
//   final _formkey = GlobalKey<FormState>();
//   //컨트롤러를 통해 넘김
//   final _title = TextEditingController();
//   final _content = TextEditingController();

//   UpdatePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final PostController p = Get.find();
//     //수정할 때 값 전달하기 위해 데이터를 이렇게
//     _title.text = "${p.post.value.title}";
//     _content.text = "${p.post.value.content}";
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
//                 text: "수정",
//                 funPageRoute: () async {
//                   if (_formkey.currentState!.validate()) {
//                     await p.updateById(
//                         p.post.value.id ?? 0, _title.text, _content.text);
//                     //같은 페이지가 있으면 이동할 때 덮어씌우는개 좋음
//                     Get.back();
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
