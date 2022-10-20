import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:recesslibpjt/bloc/basket/basket_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:recesslibpjt/utils/config.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'basket_screen.dart';

class QR_Generate extends StatefulWidget {
  const QR_Generate({super.key});

  @override
  State<QR_Generate> createState() => _QR_GenerateState();
}

class _QR_GenerateState extends State<QR_Generate> {
  String controller = BasketScreen().toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Qr_Code Generator'),
      ),
      body: Center(
        child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QrImage(
                  data: controller,
                  size: 200,
                ),
              ],
            )),
      ),
    );
  }
}
