import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset("assets/icons/menu.png")),
              Text("Online"),
              Switch(
                value: true,
                onChanged: (bool value) {},
                activeTrackColor: Colors.lightGreen,
                activeColor: Colors.white,
              )
            ],
          ),
        ),
      ),
      bottomSheet: SizedBox(
        height: 270,
        child: BottomSheet(
          onClosing: () {},
          builder: (BuildContext context) {
            return Wrap(
              children: <Widget>[
                Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          color: Colors.black45,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50, right: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Aslam khan",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10),
                                          child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Icon(Icons.star),
                                          ),
                                        ),
                                        Text("4.6",
                                            style: TextStyle(color: Colors.white)),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundColor: Colors.white,
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.call),
                                          ),
                                        )),
                                    SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundColor: Colors.white,
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.message),
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50,right: 50),
                        child: Column(

                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Contact Number",
                                            style: TextStyle(fontWeight: FontWeight.w600),
                                          ),
                                          Text("0300234231"),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Address",
                                            style: TextStyle(fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: 100,
                                            child: Text(
                                              "ABC,street, 123, Road canal city",
                                              softWrap: true,
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8,bottom: 8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Car registeration",
                                            style: TextStyle(fontWeight: FontWeight.w600),
                                          ),
                                          Text("abc 123456"),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 100,
                                    height: 100,
                                  child: CircleAvatar(

                                    child: Image.asset("assets/icons/user.png"),
                                  ),
                                )

                              ],
                            ),
                          Padding(
                              padding: const EdgeInsets.only(top: 10,bottom: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: SizedBox(
                                        height: 50,
                                        child: ElevatedButton(
                                          onPressed: () {

                                          },
                                          child:
                                          Text("Ignore"
                                          ),
                                          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(
                                              Colors.red
                                          )),

                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: SizedBox(
                                        height: 50,
                                        child: ElevatedButton(
                                          onPressed: () {

                                          },
                                          child:
                                          Text("Accept"
                                          ),
                                          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(
                                              Colors.lightGreen
                                          )),

                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )

                          ],
                        ),
                      ),
                    )
                  ],
                )
              ]

            );
          },
        ),
      ),
      body: Image.asset(
        "assets/images/map.png",
        fit: BoxFit.fill,
      )
    );
  }
}
