// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';
//
// class generate_qr_code extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() => _generate_qr_state();
// }
//
// class _generate_qr_state extends State<generate_qr_code>{
//   var urlcontroller = TextEditingController();
//   String qrimage = "";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        appBar: AppBar(
//          title: Text("Generate Qr Code"),
//        ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: 10,
//           ),
//           TextField(
//             controller: urlcontroller,
//             decoration: InputDecoration(
//               labelText: "Enter Data for Qr",
//               labelStyle: TextStyle(fontWeight: FontWeight.normal , color: Colors.black),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: BorderSide(
//                   width: 2,
//                   color: Colors.black
//                 )
//               ),
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20)
//                 )
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           ElevatedButton(onPressed: (){
//             setState(() {
//               qrimage = urlcontroller.text;
//             });
//           },style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.black,
//               foregroundColor: Colors.white
//           )
//               , child: Text("Generate Qr code")),
//           SizedBox(
//             height: 10,
//           ),
//           if (qrimage.isNotEmpty)
//             QrImageView(
//               data: qrimage,
//               size: 200,
//             ),
//         ],
//       ),
//     );
//   }
// }