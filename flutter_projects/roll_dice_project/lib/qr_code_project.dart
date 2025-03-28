// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:roll_dice_project/generate_qr_code.dart';
// import 'package:roll_dice_project/scan_qrcode.dart';
//
// class qr_code_project extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() => _qr_code_state();
// }
//
// class _qr_code_state extends State<qr_code_project>{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Qr Code Project"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(onPressed: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context)=> scan_qr_code()));
//
//             },style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.black,
//               foregroundColor: Colors.white
//             )
//                 , child: Text("Scan Qr code")),
//             ElevatedButton(onPressed: (){
// Navigator.push(context, MaterialPageRoute(builder: (context)=> generate_qr_code()));
//             },style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.black,
//                 foregroundColor: Colors.white
//             )
//                 , child: Text("Generate Qr Code"))
//           ],
//         ),
//       ),
//
//     );
//   }
// }