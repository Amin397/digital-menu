import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/Const/consts.dart';
import 'package:untitled13/Helpers/view_helper.dart';

typedef OnChangeStringInput = void Function(String);

class WidgetHelper {


  static Widget textFormField({
    TextEditingController? controller,
    String? label,
    int? maxLength,
    bool numeric = false,
    int? maxLines,
    bool? enable,
    TextAlign? textAlign,
    TextInputAction? inputAction,
    Color fillColor = Colors.white,
    List<TextInputFormatter> formatter = const [],
    OnChangeStringInput? onChange,
    Color? borderColor,
    FocusNode? focusNode,
    double? hintSize,
    double? height,
    double? width,
    Widget? prefixWidget,
    bool? autoFocus,
    TextStyle? textStyle,
    Function(String)? func,
    Color? focusedColor,
    Color? placeHolderColor = Colors.grey,
  }) {
    if (borderColor == null) {
      borderColor = Colors.grey.withOpacity(0.1);
      placeHolderColor = Colors.black;
    }

    return Container(
      width: width,
      height: height,
      child: Center(
        child: TextField(

          onSubmitted: (text) {
            func!(text);
          },
          textInputAction: inputAction,
          enabled: enable,
          autofocus: autoFocus!,
          maxLength: maxLength,
          focusNode: focusNode,
          textAlign: textAlign!,
          keyboardType: (numeric) ? TextInputType.number : TextInputType.text,
          maxLines: maxLines,
          onChanged: onChange,
          controller: controller,
          inputFormatters: formatter,
          style: textStyle,
          decoration: InputDecoration(
            counterText: "",
            prefixIcon: prefixWidget,
            fillColor: fillColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: radiusAll10,
              borderSide: BorderSide(
                color: borderColor,
                width: 0.5,
                style: BorderStyle.solid,
              ),
            ),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: focusedColor!,
              ),
            ),
            disabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(173, 179, 191, 1),
                width: 0.5,
                style: BorderStyle.solid,
              ),
            ),
            labelText: label,
            errorStyle: TextStyle(
              color: Colors.red.shade600,
              fontSize: 10.0,
            ),
            labelStyle: TextStyle(
              color: placeHolderColor,
              fontSize: hintSize,
            ),
          ),
        ),
      ),
    );
  }



  Widget _buildFormTextField({
    TextEditingController? controller,
    String? title,
    int? maxLine,
    double? height,
    Widget? icon,
    List<TextInputFormatter> formatter = const [],
  }) {
    return WidgetHelper.textFormField(
      height: height!,
      width: Get.width,
      func: (text){

      },
      formatter: formatter,
      fillColor: Colors.white,
      enable: true,
      maxLines: maxLine,
      controller: controller!,
      label: title!,
      numeric: false,
      autoFocus: false,
      textAlign: TextAlign.right,
      prefixWidget: icon!,
      borderColor: Colors.grey.withOpacity(.5),
      placeHolderColor: Colors.grey,
      textStyle: TextStyle(
        color: Colors.black.withOpacity(.8),
        fontSize: 14.0,
      ),
      inputAction: TextInputAction.done,
      focusedColor: ColorUtils.main,
    );
  }

  static Widget menuItem({
    Widget? icon,
    Widget? title,
    GestureTapCallback? onTap,
    String? subTitle,
  }) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        highlightColor: Colors.black12,
        splashColor: Colors.grey.withOpacity(0.1),
        onTap: onTap,
        child: Container(
          width: Get.width,
          height: Get.height * .05,
          margin: EdgeInsets.symmetric(
            vertical: Get.height * .01,
            horizontal: Get.width * .02,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: radiusAll24,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.3),
                blurRadius: 5.0,
                spreadRadius: 3.0,
                offset: const Offset(
                  0.0,
                  3.0,
                ),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: paddingAll6,
                width: Get.width * .12,
                height: Get.width * .12,
                child: Center(
                  child: icon,
                ),
              ),
              SizedBox(
                width: Get.width * .05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: subTitle is String
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.center,
                children: [
                  title!,
                  subTitle is String
                      ? AutoSizeText(
                          '$subTitle',
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 11.0,
                          ),
                        )
                      : Container(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget singleAppBar({String? title, Widget? actions}) {
    return Container(
      width: Get.width,
      height: Get.height * .09,
      decoration: BoxDecoration(
        boxShadow: ViewHelper.shadow(),
        color: ColorUtils.main,
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Center(
              child: AutoSizeText(
                title!,
                maxLines: 1,
                maxFontSize: 20.0,
                minFontSize: 12.0,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
            ),
            (actions == null)
                ? Container()
                : Align(
                    alignment: Alignment.centerRight,
                    child: actions,
                  )
          ],
        ),
      ),
    );
  }

  static divider({
    String? title,
  }) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * .03,
      ),
      height: Get.height * .03,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: Get.height * .001,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: ColorUtils.main.withOpacity(.5),
                borderRadius: radiusAll8,
              ),
            ),
          ),
          SizedBox(
            width: Get.width * .03,
          ),
          AutoSizeText(
            title!,
            maxLines: 1,
            maxFontSize: 16.0,
            minFontSize: 10.0,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
            ),
          ),
          SizedBox(
            width: Get.width * .03,
          ),
          Expanded(
            child: Container(
              height: Get.height * .001,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: ColorUtils.main.withOpacity(.5),
                borderRadius: radiusAll8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
