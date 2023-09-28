import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lazure_cleaner/controller/job_history_controller.dart';
import 'package:lazure_cleaner/model/JobHistoryDummy.dart';
import 'package:loader_overlay/loader_overlay.dart';

class JobHistoryScreen extends GetView<JobHistoryController>
{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: LoaderOverlay(
        child: Column(
          children: [
            SizedBox(height: 40,),
            Center(
              child: SizedBox(
                  height:50 ,
                  width: 100,
                  child: Image.asset("assets/icons/logo_black.png")),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: Text("Job History"
              ,style: TextStyle(fontSize: 19,
                color: Colors.black,
                fontWeight: FontWeight.bold
                ),
              ),
            ),
            buildOrderHistoryList()
          ],
        ),

      ),
    );
  }


  Widget buildOrderHistoryList() {
    //List<OrderHistoryModel> historyHistories = orderHistoryList;

    
    List<JobHistoryDummy> jobHistoryList = [];
    jobHistoryList.add(
        JobHistoryDummy("LAZ 2050", "Thursday, 03 May | 5:30", "Address: Expo Center Dubai",
            "Honda Civic", "AE 9546", "AE 500"));
    jobHistoryList.add(
        JobHistoryDummy("LAZ 2050", "Thursday, 03 May | 5:30", "Address: Expo Center Dubai",
            "Honda Civic", "AE 9546", "AE 500"));
    jobHistoryList.add(
        JobHistoryDummy("LAZ 2050", "Thursday, 03 May | 5:30", "Address: Expo Center Dubai",
            "Honda Civic", "AE 9546", "AE 500"));
    jobHistoryList.add(
        JobHistoryDummy("LAZ 2050", "Thursday, 03 May | 5:30", "Address: Expo Center Dubai",
            "Honda Civic", "AE 9546", "AE 500"));
    jobHistoryList.add(
        JobHistoryDummy("LAZ 2050", "Thursday, 03 May | 5:30", "Address: Expo Center Dubai",
            "Honda Civic", "AE 9546", "AE 500"));

    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: jobHistoryList.length,
      itemBuilder: (BuildContext context, int index) {
        //var item = myPolicies[index];
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
          child: jobHistoryCard(jobHistoryList, index),
        );
      },
    );
  }

  Widget jobHistoryCard(List<JobHistoryDummy> historyItem, int index) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text("Job No: Laz 2050",
                  style: TextStyle(fontSize: 15,
                      color: Colors.lightGreen,
                      fontWeight: FontWeight.w700
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("Thursday, 03 May | 5:30",
                    style: TextStyle(fontSize: 12,

                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Text("Address: Expo center Dubai",
                    style: TextStyle(fontSize: 12,

                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text("Honda Civic | AE 9546",
                    style: TextStyle(fontSize: 12,

                    ),

                  ),
                )
              ],
            ),
            Text("200 AED"
              ,style: TextStyle(fontSize: 19,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
            )
            ,

          ],
        )     ,

      ),

    );
  }
}
