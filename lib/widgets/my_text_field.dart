

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../constants/color_constants.dart';
import '../utils/form_validator.dart';

class MyTextFormField extends StatelessWidget {
  Function(bool isActive)? onTap;
  final String? labelText;
  final String? hintText;
  final bool activeBorder, isTextFieldDisabled;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final String? readOnlyText;
  final bool obscureText, readOnly, isPhoneNumber;
  final TextInputType? keyType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function()? ontapSuffix;
  final String? Function(String?)? validator, onChanged;

  MyTextFormField({
    Key? key,
    this.prefixIconPath,
    this.suffixIconPath,
    this.controller,
    this.ontapSuffix,
    this.obscureText = false,
    this.readOnly = false,
    this.activeBorder = false,
    this.isPhoneNumber = false,
    this.isTextFieldDisabled = false,
    this.keyType,
    this.onTap,
    this.labelText,
    this.hintText,
    this.readOnlyText,
    this.validator,
    this.focusNode, this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        InkWell(
          onTap: onTap != null
              ? () {
                  onTap!(true);
                }
              : null,
          child: Container(
              height: 85,
              width: double.infinity,

              margin: const EdgeInsets.only(bottom: 6.0),
              alignment: Alignment.center,
              decoration: activeBorder
                  ? BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: ColorConstants.primaryColorSwatch,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(15))
                  : BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          offset: const Offset(0.0, 3.0), //(x,y)
                          blurRadius: 5.0,
                          spreadRadius: 0,
                        ),
                        const BoxShadow(
                          color: Colors.white,
                          // offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 0.3,
                        )
                      ],
                    ),
                  
              ),
        ),
        Row(
          children: [
            const SizedBox(width: 20),
            Expanded(
              flex: 1,
              child:
                  // isIcon==true?
                  // Icon(prefixIconData,color:Theme.of(context).primaryColorDark,size: prefixIconScale,):
                  prefixIconPath != null
                      ? Image.asset(
                          prefixIconPath!,
                          scale: 3.3,
                          color: Theme.of(context).primaryColorLight,
                          fit: BoxFit.none,
                        )
                      : Icon(Icons.text_fields,
                          color: Theme.of(context).primaryColorLight),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    labelText ?? "Label",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 13),
                  ),
                  const SizedBox(height: 0.5),
                  readOnly && readOnlyText != null
                      ? ConstrainedBox(
                          constraints: const BoxConstraints(
                            minHeight: 30,
                          ),
                          child: Text(readOnlyText!))
                      : ConstrainedBox(
                          constraints: const BoxConstraints(
                            minHeight: 30,
                          ),
                          child: 
                          isPhoneNumber
                              ? InternationalPhoneNumberInput(

                                selectorButtonOnErrorPadding: 0,
                                  spaceBetweenSelectorAndTextField: 0,
                                  selectorConfig: const SelectorConfig(
                                      selectorType: PhoneInputSelectorType
                                          .DIALOG,
                                      showFlags: false),
                                  inputBorder: InputBorder.none,
                                  validator: (value) =>
                                      FormValidator.phoneValidator(value),
                                  textFieldController: controller,
                                  initialValue: PhoneNumber(isoCode: "AE"),
                                  onInputChanged: (phoneNumber) {})
                              : 
                              TextFormField(
                                  readOnly: isTextFieldDisabled,
                                  obscureText: obscureText,
                                  // obscuringCharacter: "*",
                                  controller: controller,
                                  keyboardType: keyType,
                                  validator: validator,
                                  onTap: () {
                                    onTap!(true);
                                  },
                                  // validator: onValidate,
                                  // style:  GoogleFonts.redHatDisplay(
                                  //   color: Colors.black,
                                  //   fontSize: 11.sp,
                                  // ),
                                  
                                  decoration: InputDecoration(
                                    errorStyle: const TextStyle(fontSize: 11),
                                    errorMaxLines: 2,
                                    isDense: true,
                                    contentPadding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 0),
                                    border: InputBorder.none,
                                    hintText: hintText ?? "Hint",
                                  ),
                                  onChanged: onChanged,
                                ),
                        )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: suffixIconPath != null
                  ? InkWell(
                      onTap: ontapSuffix,
                      child: Image.asset(
                        suffixIconPath!,
                        scale: 3,

                        // color: AppColors.THEME_COLOR_GREY,
                      ))
                  : const SizedBox(),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ],
    );
  }
}
