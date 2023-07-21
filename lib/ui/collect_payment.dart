import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CollectPayment extends StatelessWidget {
  const CollectPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Container(
            width: double.infinity,
            color: Colors.black87,
            margin: const EdgeInsets.only(
                top: 180, left: 35, right: 35, bottom: 20),
            child: Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
              child: Text(
                "Collect Payment",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 25, left: 45, right: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cleaning earning",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text("Fare", textAlign: TextAlign.start),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "Surge",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text("Earning boost"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text("Cleaning fee"),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Text("123", textAlign: TextAlign.start),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "465",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text("785"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text("123"),
                      ),
                    ],
                  )
                ],
              )),
          Container(
            height: 2,
            width: double.infinity,
            color: Colors.grey,
            margin: EdgeInsets.only(left: 35, right: 35, top: 30),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Estimated payout",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text("456", style: TextStyle(fontWeight: FontWeight.w500))
              ],
            ),
          ),
          Container(
            height: 2,
            width: double.infinity,
            color: Colors.grey,
            margin: EdgeInsets.only(left: 35, right: 35, top: 30),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cleaning Time",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text("45 min", style: TextStyle(fontWeight: FontWeight.w500))
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left:35,right:35,top: 20),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Collect Rs 900"),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.lightGreen)),
                ),
              )),
        ],
      ),
    );
  }
}
