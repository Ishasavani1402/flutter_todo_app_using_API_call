// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
//
// class scan_qr_code extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() => _scan_qr_state();
// }
//
// class _scan_qr_state extends State<scan_qr_code>{
//   final GlobalKey qrkey = GlobalKey(debugLabel: 'QR');
//   QRViewController? controller;
//   String qr_scan_data = "your Scanned Qr ";
//
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     controller?.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             flex: 4,
//             child: QRView(key: qrkey, onQRViewCreated: (QRViewController controller){
//               this.controller = controller;
//               controller.scannedDataStream.listen((qr_scan_data){
//                 setState(() {
//                   qr_scan_data = qr_scan_data.code! as Barcode;
//                 });
//               });
//
//             },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }