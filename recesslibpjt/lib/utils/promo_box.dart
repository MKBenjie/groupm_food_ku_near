import 'package:flutter/material.dart';
import 'package:recesslibpjt/models/promo_model.dart';

class PromoBox extends StatelessWidget {
  final Promo promos;
  const PromoBox({super.key, required this.promos});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          margin: const EdgeInsets.only(right: 5.0),
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: Colors.redAccent,
              image: DecorationImage(
                image: AssetImage(promos.image),
                fit: BoxFit.cover,
              ))),
      ClipPath(
        clipper: PromoCustomClipper(),
        child: Container(
          margin: const EdgeInsets.only(right: 5.0),
          width: MediaQuery.of(context).size.width - 40,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            color: Colors.redAccent,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 25, right: 125),
            child: Column(
              children: [
                Text(
                  promos.title,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  promos.description,
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}

class PromoCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(225, size.height);
    path.lineTo(275, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
