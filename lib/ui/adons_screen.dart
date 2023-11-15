import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:lazure_cleaner/constants/BookingDetails.dart';
import 'package:lazure_cleaner/controller/adons_controller.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../navigation/nav_paths.dart';

class AdonsScreen extends GetView<AdonsController> {
  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              "assets/images/lines.png",
            ),
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.2,
              ),
              SizedBox(
                height: 160,
                width: 140,
                child: Image.asset(
                  'assets/icons/selectservice.png',
                  scale: 2,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              const Text(
                'Select Addons',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Obx(() => ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.selectServiceList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, left: 90, right: 90),
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      controller.selectServiceList[index].title
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 3.0, left: 10),
                                    child: Text(
                                        "${controller.selectServiceList[index].price} ${controller.selectServiceList[index].currencyCode}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.lightGreen,
                                        )),
                                  )
                                ],
                              ),
                              Obx(() => Checkbox(
                                    value: controller.selectServiceList[index]
                                        .isSelected.value,
                                    onChanged: (bool? value) {
                                      // This is where we update the state when the checkbox is tapped

                                      controller.selectServiceList[index]
                                          .isSelected.value = value!;
                                    },
                                  ))
                            ],
                          ),
                        )
                        /*ElevatedButton(
                            child:Text(controller.selectServiceList[index].title.toString())
                            , onPressed: (){},
                          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(
                              Colors.lightGreen
                          )),
                        )*/
                        ,
                      ),
                    );
                  })),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
                child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {


                          for(var service in controller.selectServiceList)
                            {
                              if( service.isSelected.value)
                            {

                              BookingDetails.addonsId.add(service.id.toString());
                            }
                            }
                          print("selected addons: "+BookingDetails.addonsId.toString());
                          BookingDetails.carPictureType = BookingDetails.beforeCleaning;
                          controller.addAddons(context);
                        },
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.lightGreen),
                        ),
                        child: const Text("Next"))),
              ),
              const SizedBox(
                height: 40,
              )

/*
              SizedBox(height:  MediaQuery.of(context).size.width * 0.1,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: LargeElevatedButtonWidget(buttonTitle: 'Waterless Car Wash', onPressd: (){

                  BookingDetails.selectedServiceID = "1";
                  Get.to(HomeScreen());

                }, primaryColor: ColorConstants.greenColor),
              ),

              SizedBox(height:  MediaQuery.of(context).size.width * 0.05,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: LargeElevatedButtonWidget(buttonTitle: 'Touchless Car Wash', onPressd: ()
                {
                  BookingDetails.selectedServiceID = "2";
                  Get.to(HomeScreen());
                  },
                  primaryColor: ColorConstants.greenColor),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
