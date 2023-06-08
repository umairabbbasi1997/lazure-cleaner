import 'package:flutter/material.dart';

class LargeElevatedButtonWidget extends StatelessWidget {
  final String buttonTitle;
  final String? iconPath;
  final Color? primaryColor;
  final bool centerContent, isLoading;
  final Function()? onPressd;
  const LargeElevatedButtonWidget({
    Key? key,
    required this.buttonTitle,
    this.iconPath,
    required this.onPressd,
    this.centerContent = false,
    this.primaryColor,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 60,
      width: double.infinity,

      // decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter, colors: [ColorConstants.greenColor, ColorConstants.purpleColor])),
      child: ElevatedButton(


        style: ElevatedButton.styleFrom(

          primary: primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: isLoading ? null : onPressd,
        child: isLoading
            ? const CircularProgressIndicator.adaptive()
            : centerContent
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      iconPath != null
                          ? Image.asset(iconPath!, scale: 4)
                          : const Icon(Icons.check),
                      const SizedBox(width: 20),
                      Text(buttonTitle),
                    ],
                  )
                : Row(
                    children: [
                      iconPath != null
                          ? Expanded(
                              flex: 1, child: Image.asset(iconPath!, scale: 3))
                          : const SizedBox(),
                      Expanded(
                        flex: 2,
                        child: Text(
                          buttonTitle,
                          textAlign: iconPath != null
                              ? TextAlign.start
                              : TextAlign.center,
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
