import 'package:dokan/app/core/app_colors.dart';
import 'package:dokan/app/core/app_icons.dart';
import 'package:dokan/app/core/app_images.dart';
import 'package:dokan/app/core/app_sizes.dart';
import 'package:dokan/app/core/utils.dart';
import 'package:dokan/app/global_widget/custom_edittext.dart';
import 'package:dokan/app/module/account/components/account_button.dart';
import 'package:dokan/app/module/account/controller/account_controller.dart';
import 'package:dokan/app/module/login/controller/login_controller.dart';
import 'package:dokan/app/module/main_page/controller/main_controller.dart';
import 'package:dokan/app/routes/routes.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountScreen extends GetView<AccountController> {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.pageBackground2,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            /// Appbar
            SliverAppBar(
              title: const Text("My Account",style: TextStyle(fontSize: 22.5,fontWeight: FontWeight.w700,color: Color(0xff222455)),),
              backgroundColor: AppColors.pageBackground2,
              surfaceTintColor: AppColors.pageBackground2,
              centerTitle: true,
              floating: true,
              pinned: false,
            ),
            /// profile image
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              sliver: SliverToBoxAdapter(
                child: DottedBorder(
                  color: const Color(0xffFFADAD),
                  borderType: BorderType.Circle,
                  padding: EdgeInsets.all(getWidth(12)),
                  strokeWidth: 1,
                  dashPattern: const [6, 6, 6, 6],
                  child: Center(
                    child: Container(
                        height: getWidth(128),
                        width: getWidth(128),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                            shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(AppImages.women)
                          )
                        ),
                    ),
                  ),
                ),
              ),
            ),
            /// Email and name
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${controller.userInfo?.userDisplayName}",
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: getWidth(24),
                            fontWeight: FontWeight.w900)),
                    Text("${controller.userInfo?.userEmail}",
                        style: GoogleFonts.roboto(
                            color: const Color(0xff535353),
                            fontSize: getWidth(14),
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ),
            /// Buttons
            SliverToBoxAdapter(
              child: ClipRRect(
                clipBehavior: Clip.none,
            borderRadius: BorderRadius.circular(getWidth(16)),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(getWidth(16)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        color: const Color(0xff4D5877).withOpacity(0.13),
                        offset: const Offset(2, 3)
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                      ExpandablePanel(
                        theme: const ExpandableThemeData(
                          animationDuration: Duration(milliseconds: 500),
                          hasIcon: false,
                        ),
                        header: const AccountButton(
                          title: "Account",
                          icon: AppIcons.account,
                          onPressed: null,
                          topRadius: 16,
                        ),
                        collapsed: const SizedBox(),
                        expanded: Padding(
                          padding: EdgeInsets.all(getWidth(16)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: getWidth(16),
                              ),
                              Text("Email",style: TextStyle(color: const Color(0xff263238).withOpacity(0.55),fontSize: getWidth(16)),),
                              SizedBox(
                                height: getWidth(8),
                              ),
                              CustomEditText().borderEditText(
                                controller.emailController,
                                controller.emailController.text,
                                "youremail@xmail.com",
                                textColor: const Color(0xff263238).withOpacity(0.32),
                                TextInputType.emailAddress,
                                Colors.white,
                                inputAction: TextInputAction.next,
                              ),
                              SizedBox(
                                height: getWidth(16),
                              ),
                              Text("Full Name",style: TextStyle(color: const Color(0xff263238).withOpacity(0.55),fontSize: getWidth(16)),),
                              SizedBox(
                                height: getWidth(8),
                              ),
                              CustomEditText().borderEditText(
                                  controller.fullNameController,
                                controller.fullNameController.text,
                                  "Full Name",
                                  TextInputType.name,
                                textColor: const Color(0xff263238).withOpacity(0.32),
                                  Colors.white,
                                  inputAction: TextInputAction.next,
                              ),
                              SizedBox(
                                height: getWidth(16),
                              ),
                              Text("Street Address",style: TextStyle(color: const Color(0xff263238).withOpacity(0.55),fontSize: getWidth(16)),),
                              SizedBox(
                                height: getWidth(8),
                              ),
                              CustomEditText().borderEditText(
                                TextEditingController(),
                                "465 Nolan Causeway Suite 079",
                                "Street Address",
                                textColor: const Color(0xff263238).withOpacity(0.32),
                                TextInputType.streetAddress,
                                Colors.white,
                                inputAction: TextInputAction.next,
                              ),
                              SizedBox(
                                height: getWidth(16),
                              ),
                              Text("Apt, Suite, Bldg (optional)",style: TextStyle(color: const Color(0xff263238).withOpacity(0.55),fontSize: getWidth(16)),),
                              SizedBox(
                                height: getWidth(8),
                              ),
                              CustomEditText().borderEditText(
                                TextEditingController(),
                                "Unit 512",
                                "",
                                TextInputType.streetAddress,
                                Colors.white,
                                textColor: const Color(0xff263238).withOpacity(0.32),
                                inputAction: TextInputAction.next,
                              ),
                              SizedBox(
                                height: getWidth(16),
                              ),
                              Text("Zip Code",style: TextStyle(color: const Color(0xff263238).withOpacity(0.55),fontSize: getWidth(16)),),
                              SizedBox(
                                height: getWidth(8),
                              ),
                              SizedBox(
                                width: screenWidth() * 0.3,
                                height: getWidth(52),
                                child: CustomEditText().borderEditText(
                                  TextEditingController(),
                                  "1212",
                                  "Street Address",
                                  textColor: const Color(0xff263238).withOpacity(0.32),
                                  TextInputType.streetAddress,
                                  Colors.white,
                                  inputAction: TextInputAction.next,
                                ),
                              ),
                              SizedBox(
                                height: getWidth(16),
                              ),
                              SizedBox(
                                height: getWidth(52),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: getWidth(52),
                                        child: OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              side: BorderSide(color: AppColors.textBorderColor.withOpacity(0.12)),
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                                          onPressed: (){},
                                          child: Text("Cancel",style: TextStyle(color: const Color(0xff607374),fontSize: getWidth(17),fontWeight: FontWeight.w700),),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        height: getWidth(61),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: const Color(0xff1ABC9C),
                                              foregroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                                          onPressed: (){},
                                          child: Text("Save",style: TextStyle(fontSize: getWidth(17),fontWeight: FontWeight.w500),),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Divider(height: 1,color: const Color(0xffA0A9BD).withOpacity(0.31),),
                      ),
                      AccountButton(title: "Passwords", icon: AppIcons.password, onPressed: (){}),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Divider(height: 1,color: const Color(0xffA0A9BD).withOpacity(0.31),),
                      ),
                      AccountButton(title: "Notification", icon: AppIcons.notification, onPressed: (){}),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Divider(height: 1,color: const Color(0xffA0A9BD).withOpacity(0.31),),
                      ),
                      AccountButton(title: "Wishlist(00)", icon: AppIcons.favourite, onPressed: (){},bottomRadius: 16,),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(getWidth(16)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 6,
                          color: const Color(0xff4D5877).withOpacity(0.13),
                          offset: const Offset(2, 3)
                      )
                    ]
                ),
                child: AccountButton(
                  title: "Logout",
                  icon: AppIcons.logout,
                  onPressed: (){
                    Utils.loadingDialog(context);
                    try{
                      Get.find<LoginController>().userLogout().then((value){
                        value.fold((l) {
                          Utils.snackbar(title: "Error",message: 'Try Again', context: context);
                        }, (r) {
                          Future.delayed(const Duration(seconds: 2)).then((value){
                            Utils.closeDialog(context);
                            Get.find<MainController>().currentIndex(0);
                            Get.offAllNamed(Routes.login);
                          });
                        });
                      });
                    } catch (e){
                      if (kDebugMode) {
                        print(e.toString());
                      }
                    }
                  },
                  topRadius: 16,
                  bottomRadius: 16,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 50,),
            )
          ],
        ),
      ),
    );
  }
}
