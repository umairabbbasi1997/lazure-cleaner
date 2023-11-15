

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazure_cleaner/constants/BookingDetails.dart';

import '../api_service/api_services.dart';
import '../navigation/nav_paths.dart';

class VerifyController extends GetxController
{



/*  var myImage = File().obs;*/
  var selectedImagePath=''.obs;
  var extractedText=''.obs;

  ///get image method
/*  Future<void> recognizedText(String pickedImage) async {
    if (pickedImage == null) {
      Get.snackbar(

          "Error", "image is not selected"
          ,
          backgroundColor: Colors.red);
    }
    else {
      extractedText.value = '';
      var textRecognizer = GoogleMlKit.vision.textRecognizer();
      final visionImage = InputImage.fromFilePath(pickedImage);
      try{

        var visionText= await textRecognizer.processImage(visionImage);
        for(TextBlock textBlock in visionText.blocks){
          for(TextLine textLine in textBlock.lines){
            for(TextElement textElement in textLine.elements){
              extractedText.value=extractedText.value + textElement.text+' ';
            }
            extractedText.value=extractedText.value + " \n";
          }
        }
        print("extracted text: ${extractedText.value}");
      }
      catch(e){
        Get.snackbar(

            "Error", e.toString()
            ,
            backgroundColor: Colors.red);
      }
    }
  }*/


  Future<void> verifyPlat(String imagePath,BuildContext context)
  async {
    var response = await ApiService().postPlatReader(context,imagePath);

  var result =  jsonDecode(response.body)['results'];
    //print("extractedPlatNo: $result");


  if ( result != null )
  {

    String extractedPlatNo =  jsonDecode(response.body)['results'][0]['plate'];

    print("extracted: "+extractedPlatNo +" cusreg: "+BookingDetails.customerRegNo.toString());

    print("filtered text : "+removeSpecialCharacters(extractedPlatNo.toString().toLowerCase()) +" cusreg: "+removeSpecialCharacters(BookingDetails.customerRegNo.toLowerCase()) );

    if(removeSpecialCharacters(extractedPlatNo.toString().toLowerCase())
        .contains(removeSpecialCharacters(BookingDetails.customerRegNo.toLowerCase()) ))
    {
      Get.snackbar(

          "Success", "Verified"
          ,
          backgroundColor: Colors.green);
      extractedPlatNo = "";


      Get.offNamed(navVerified);


    }
    else{
      Get.snackbar(

          "Error", "Vehicle Registration Doesn't Matched"
          ,
          backgroundColor: Colors.red);
      extractedPlatNo = "";


    }
  }
  else{
    Get.snackbar(

        "Error", "Vehicle Registration Doesn't Matched"
        ,
        backgroundColor: Colors.red);


  }

  }

/*  bool verifyCarDetails() {
*//*    if(extractedText.contains(Booki))*//*
  print("extracted: "+extractedText.toString() +" cusreg: "+BookingDetails.customerRegNo.toString());
  if(extractedText.contains(BookingDetails.customerRegNo))
    {
      Get.snackbar(

          "Success", "Verified"
          ,
          backgroundColor: Colors.green);
      extractedText.value = "";
      Get.offNamed(navVerified);

      return true;
    }
  else{
    Get.snackbar(

        "Error", "Vehicle Registration Doesn't Matched"
        ,
        backgroundColor: Colors.red);
    extractedText.value = "";

    return false;
  }
  }*/

  String removeSpecialCharacters(String text)
  {
   var filteredText = text.replaceAll("/[`~!@#%^&*()_|+\-=?;:',.<>\-\{\}\[\]\\\/]/gi", '');

  return filteredText.replaceAll('-', "");
  }
}