import 'package:dokan/app/core/app_icons.dart';
import 'package:dokan/app/core/app_sizes.dart';
import 'package:dokan/app/global_widget/custom_image.dart';
import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({super.key, required this.title, required this.icon, required this.onPressed, this.topRadius, this.bottomRadius});
  final String title;
  final String icon;
  final Function? onPressed;
  final double? topRadius;
  final double? bottomRadius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(top: Radius.circular(getWidth(topRadius ?? 0)),bottom: Radius.circular(getWidth(bottomRadius ?? 0))),
      child: InkWell(
        borderRadius: BorderRadius.vertical(top: Radius.circular(getWidth(topRadius ?? 0)),bottom: Radius.circular(getWidth(bottomRadius ?? 0))),
        onTap: onPressed == null ? null : (){
          onPressed!();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(16),vertical: getWidth(16)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 24,
                  maxHeight: 24
                ),
                  child: CustomImage(path: icon,color: const Color(0xff7C8592),)),
              SizedBox(width: getWidth(16),),
              Expanded(
                child: Text(title,
                  style: TextStyle(fontSize: getWidth(17),
                    color: Colors.black,
                  ),),
              ),
              SizedBox(width: getWidth(16),),
              const CustomImage(path: AppIcons.rightArrow),
            ],
          ),
        ),
      ),
    );
  }
}
