import 'package:flutter/material.dart';

class foodSearchBox extends StatelessWidget {
  const foodSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(

            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "What would you like to have5? ",
                      suffixIcon: Icon(Icons.search),
                      contentPadding:
                          EdgeInsets.only(left: 20.0, bottom: 5.0, top: 12.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white),
                      )),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0)),
                child: IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.redAccent,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/filter');
                  },
                ),
              )
            ],
          ),
        );
  }
}
