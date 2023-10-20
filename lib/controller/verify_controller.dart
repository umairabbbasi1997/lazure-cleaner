

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:lazure_cleaner/constants/BookingDetails.dart';

import '../navigation/nav_paths.dart';

class VerifyController extends GetxController
{

/*  var myImage = File().obs;*/
  var selectedImagePath=''.obs;
  var extractedText=''.obs;
  ///get image method
  Future<void> recognizedText(String pickedImage) async {
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
  }

  bool verifyCarDetails() {
/*    if(extractedText.contains(Booki))*/
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
  }
}