import 'package:dokan/app/core/app_colors.dart';
import 'package:dokan/app/core/app_sizes.dart';
import 'package:dokan/app/core/contants.dart';
import 'package:flutter/material.dart';

import 'custom_image.dart';
import 'helper_text.dart';

class CustomEditText {
  normalEditText(TextEditingController controller, String? text, String hintText, validator,
      TextInputType inputType) {
    return TextFormField(
      validator: validator,
      controller: controller,
      textInputAction: TextInputAction.next,
      keyboardType: inputType,
      // inputFormatters: [
      //   FilteringTextInputFormatter.digitsOnly
      // ],
      maxLines: 1,
      onSaved: (String? val) {
        text = val;
      },
      decoration: InputDecoration(
        // filled: true,
        // fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        hintText: hintText,
        hintStyle: TextStyle(
            color: AppColors.ashTextColor,
            fontFamily: 'GlobalFonts',
            fontWeight: FontWeight.w400,
            fontSize: 14),
        // labelText: 'Email',
        // isDense: true,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.textColor),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red.withOpacity(0.7)),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.ashTextColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.ashTextColor),
        ),
      ),
    );
  }

  normalEditText2(TextEditingController controller, String? text, String hintText, validator,
      TextInputType inputType, line) {
    return TextFormField(
      validator: validator,
      controller: controller,
      textInputAction: TextInputAction.next,
      keyboardType: inputType,
      // inputFormatters: [
      //   FilteringTextInputFormatter.digitsOnly
      // ],
      maxLines: line,
      onSaved: (String? val) {
        text = val;
      },
      decoration: InputDecoration(
        // filled: true,
        // fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        hintText: hintText,
        hintStyle:
            TextStyle(color: AppColors.ashTextColor, fontWeight: FontWeight.w400, fontSize: 14),
        // labelText: 'Email',
        // isDense: true,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.textColor),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red.withOpacity(0.7)),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.ashTextColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.ashTextColor),
        ),
      ),
    );
  }

  boxEditText(
    TextEditingController controller,
    String? text,
    String hintText,
    TextInputType inputType,
    Color fillColor, {
    int maxLines = 1,
    TextInputAction inputAction = TextInputAction.next,
    TextAlign textAlign = TextAlign.start,
    double borderRadius = 3.0,
    Function? onTap,
    Color errorBorder = Colors.red,
    bool readOnly = false,
  }) {
    return TextFormField(
      controller: controller,
      textInputAction: inputAction,
      keyboardType: inputType,
      // inputFormatters: [
      //   FilteringTextInputFormatter.digitsOnly
      // ],
      maxLines: maxLines,
      readOnly: readOnly,
      textAlign: textAlign,
      onSaved: (String? val) {
        text = val;
      },
      onTap: () {
        if (onTap == null) return;
        onTap();
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        hintText: hintText,
        hintStyle:
            TextStyle(color: AppColors.ashTextColor, fontWeight: FontWeight.w400, fontSize: 14),
        // labelText: 'Email',
        // isDense: true,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(color: Colors.transparent)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: errorBorder)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(color: Colors.transparent)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(color: Colors.transparent)),
      ),
    );
  }

  borderEditText(TextEditingController controller, String? text, String hintText,
      TextInputType inputType, Color fillColor,
      {int maxLines = 1,
      String labelText = "",
        Color textColor = const Color(0xffA4A9AF),
      TextInputAction inputAction = TextInputAction.next,
      bool readOnly = false}) {
    controller.text = text ?? "";
    return TextFormField(
      controller: controller,
      textInputAction: inputAction,
      keyboardType: inputType,
      style: TextStyle(color: textColor,fontSize: getWidth(15)),
      // inputFormatters: [
      //   FilteringTextInputFormatter.digitsOnly
      // ],
      maxLines: maxLines,
      readOnly: readOnly,
      onSaved: (String? val) {
        text = val;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.ashTextColor, fontWeight: FontWeight.w400, fontSize: 14),
        labelText: labelText,
        labelStyle: TextStyle(color: AppColors.ashTextColor),
        // isDense: true,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.textBorderColor.withOpacity(0.12))),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.textBorderColor.withOpacity(0.12))),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.textBorderColor.withOpacity(0.12))),
      ),
    );
  }

  figmaTextView(
    String hintText,
    String inputText, {
    IconData? suffixIcon,
    String suffixImage = "",
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // const Spacer(),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HelperText().ashNormalText(hintText),
            HelperText().boldText18(inputText),
          ],
        )),
        const SizedBox(
          width: 16,
        ),
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
              boxShadow: zeroPxBoxShadow(),
              borderRadius: BorderRadius.circular(13),
              color: Colors.white),
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            child: Center(
                child: suffixImage == ""
                    ? Icon(
                        suffixIcon,
                        color: AppColors.ashTextColor,
                      )
                    : CustomImage(
                        path: suffixImage,
                        height: 24,
                        width: 24,
                      )),
          ),
        ),
      ],
    );
  }

  figmaTextField(
    TextEditingController controller,
    String hintText,
    TextInputType inputType, {
    int maxLines = 1,
    double height = 60.0,
    String labelText = "",
    bool autoFocus = false,
    TextInputAction inputAction = TextInputAction.next,
    bool readOnly = false,
    Widget? prefixIcon,
    String suffixImage = "",
    Color borderColor = Colors.transparent,
    IconData? suffixIcon,
  }) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              offset: const Offset(0, 3),
              color: const Color(0xff395AB8).withOpacity(0.1)
            )
          ],
          border: Border.all(color: borderColor)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Builder(
            builder: (context) {
              if(prefixIcon != null){
                return Row(
                  children: [
                    prefixIcon,
                    const SizedBox(width: 12,)
                  ],
                );
              }
              return const SizedBox();
            },
          ),
          Expanded(
            child: TextFormField(
              autofocus: autoFocus,
              maxLines: maxLines,
              controller: controller,
              keyboardType: inputType,
              textInputAction: inputAction,
              decoration: InputDecoration(
                hintText: hintText,
                hintMaxLines: 1,
                // prefixIcon: prefixIcon,
                // prefixIconConstraints: const BoxConstraints(
                //   maxHeight: 22,
                //   minHeight: 15,
                //   maxWidth: 22,
                //   minWidth: 18
                // ),
                hintStyle: TextStyle(fontSize: 15, fontFamily: "Nunito", color: AppColors.hintColor),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
            ),
          ),
          Visibility(
              visible: suffixImage != "",
              child: CustomImage(
                path: suffixImage,
                height: 24,
                width: 24,
              )),
          Visibility(
              visible: suffixIcon != null,
              child: Icon(
                suffixIcon,
                size: 24,
                color: AppColors.greyTextColor,
              )),
        ],
      ),
    );
  }

  figmaTextPasswordField(
      TextEditingController controller,
      String hintText,
      TextInputType inputType,
      ValueChanged<bool> toggle, {
        bool isVisible = false,
        int maxLines = 1,
        double height = 60.0,
        String labelText = "",
        bool autoFocus = false,
        TextInputAction inputAction = TextInputAction.next,
        bool readOnly = false,
        Widget? prefixIcon,
        String suffixImage = "",
        Color borderColor = Colors.transparent,
        IconData? suffixIcon,
      }) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                offset: const Offset(0, 3),
                color: const Color(0xff395AB8).withOpacity(0.1)
            )
          ],
          border: Border.all(color: borderColor)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Builder(
            builder: (context) {
              if(prefixIcon != null){
                return Row(
                  children: [
                    prefixIcon,
                    const SizedBox(width: 12,)
                  ],
                );
              }
              return const SizedBox();
            },
          ),
          Expanded(
            child: TextFormField(
              autofocus: autoFocus,
              maxLines: maxLines,
              obscureText: isVisible,
              controller: controller,
              keyboardType: inputType,
              textInputAction: inputAction,
              decoration: InputDecoration(
                hintText: hintText,
                hintMaxLines: 1,
                suffixIcon: IconButton(
                  onPressed: () {
                    toggle(!isVisible);
                  },
                  icon: isVisible
                      ? const Icon(
                    Icons.visibility,
                    color: Colors.black54,
                  )
                      : const Icon(
                    Icons.visibility_off,
                    color: Colors.black54,
                  ),
                ),
                hintStyle: TextStyle(fontSize: 15, fontFamily: "Nunito", color: AppColors.hintColor),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
            ),
          ),
          Visibility(
              visible: suffixImage != "",
              child: CustomImage(
                path: suffixImage,
                height: 24,
                width: 24,
              )),
          Visibility(
              visible: suffixIcon != null,
              child: Icon(
                suffixIcon,
                size: 24,
                color: AppColors.greyTextColor,
              )),
        ],
      ),
    );
  }

  figmaDateField(
    TextEditingController controller,
    String hintText,
    TextInputType inputType,
    Function onTap, {
    int maxLines = 1,
    String labelText = "",
    bool autoFocus = false,
    TextInputAction inputAction = TextInputAction.next,
    bool readOnly = true,
    String suffixImage = "",
    Color borderColor = Colors.transparent,
    IconData? suffixIcon,
  }) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: zeroPxBoxShadowWithDark(),
          border: Border.all(color: borderColor)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              autofocus: autoFocus,
              maxLines: maxLines,
              controller: controller,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: hintText,
                hintMaxLines: 1,
                hintStyle: TextStyle(fontSize: 15, fontFamily: "Nunito", color: AppColors.hintColor),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
              onTap: () {
                onTap();
              },
            ),
          ),
          Visibility(
              visible: suffixImage != "",
              child: CustomImage(
                path: suffixImage,
                height: 24,
                width: 24,
              )),
          Visibility(
              visible: suffixIcon != null,
              child: Icon(
                suffixIcon,
                size: 24,
                color: AppColors.greyTextColor,
              )),
        ],
      ),
    );
  }

  figmaTextFieldButton(
    String text,
    Function onTap, {
    int maxLines = 1,
    Color textColor = const Color(0xff7282A0),
    String suffixImage = "",
    Color borderColor = Colors.transparent,
    IconData? suffixIcon,
  }) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: zeroPxBoxShadowWithDark(),
            border: Border.all(color: borderColor)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Text(
              text,
              style: TextStyle(fontSize: 15, fontFamily: "Nunito", color: textColor),
            )),
            Visibility(
                visible: suffixImage != "",
                child: CustomImage(
                  path: suffixImage,
                  height: 24,
                  width: 24,
                )),
            Visibility(
                visible: suffixIcon != null,
                child: Icon(
                  suffixIcon,
                  size: 24,
                  color: AppColors.hintColor,
                )),
          ],
        ),
      ),
    );
  }
}
