import 'package:dokan/app/core/app_colors.dart';
import 'package:dokan/app/core/app_icons.dart';
import 'package:dokan/app/core/app_sizes.dart';
import 'package:dokan/app/global_widget/app_text_button.dart';
import 'package:dokan/app/global_widget/custom_edittext.dart';
import 'package:dokan/app/global_widget/custom_image.dart';
import 'package:dokan/app/module/signup/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground2,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(
                  vertical: getWidth(0), horizontal: getWidth(30)),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: getWidth(121),
                      width: getWidth(121),
                      margin: const EdgeInsets.symmetric(vertical: 65),
                      child: Stack(
                        children: [
                          Container(
                            height: getWidth(121),
                            width: getWidth(121),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: const CircleBorder(),
                              shadows: [
                                BoxShadow(
                                    blurRadius: 4,
                                    offset: const Offset(0, 3),
                                    color: const Color(0xff395AB8).withOpacity(0.1))
                              ],
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Obx(() {
                                  if(controller.selectedImage.value.isNotEmpty){
                                    return CustomImage(path: controller.selectedImage.value,
                                      fit: BoxFit.cover,isFile: true,);
                                  } else {
                                    return const Center(
                                      child: CustomImage(path: AppIcons.account,
                                        fit: BoxFit.contain,height: 30,width: 30,),
                                    );
                                  }
                                  }
                                )),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: getWidth(34),
                              width: getWidth(34),
                              decoration: ShapeDecoration(
                                shape: const CircleBorder(),
                                shadows: [
                                  BoxShadow(
                                      blurRadius: 23,
                                      offset: const Offset(0, 14),
                                      color: const Color(0xff8B2F40).withOpacity(0.25))
                                ],
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: <Color>[
                                    Color(0xffF2709C),
                                    Color(0xffFF9472),
                                  ]
                                )
                              ),
                              child: Material(
                                color: Colors.transparent,
                                shape: const CircleBorder(),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(50),
                                  onTap: (){
                                    controller.chooseImage();
                                  },
                                  child: const Center(
                                    child: Icon(Icons.camera_alt_rounded,size: 20,color: Colors.white,),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    CustomEditText().figmaTextField(
                      controller.nameController,
                      "Name",
                      TextInputType.text,
                      height: 60,
                      prefixIcon: CustomImage(
                        path: AppIcons.account,
                        height: getWidth(18),
                        width: getWidth(22),
                      ),
                      inputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: getWidth(16),
                    ),
                    CustomEditText().figmaTextField(
                      controller.emailController,
                      "Email",
                      TextInputType.text,
                      height: 60,
                      prefixIcon: CustomImage(
                        path: AppIcons.email,
                        height: getWidth(18),
                        width: getWidth(22),
                      ),
                      inputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: getWidth(16),
                    ),
                    Obx(() {
                      return CustomEditText().figmaTextPasswordField(
                        controller.passwordController,
                        "Password",
                        TextInputType.visiblePassword,
                        (toggle) {
                          controller.togglePassword(toggle);
                        },
                        isVisible: controller.togglePassword.value,
                        height: 60,
                        prefixIcon: CustomImage(
                          path: AppIcons.password,
                          height: getWidth(22),
                          width: getWidth(22),
                        ),
                        inputAction: TextInputAction.next,
                      );
                    }),
                    SizedBox(
                      height: getWidth(16),
                    ),
                    Obx(() {
                      return CustomEditText().figmaTextPasswordField(
                        controller.confirmPasswordController,
                        "Confirm Password",
                        TextInputType.visiblePassword,
                        (toggle) {
                          controller.toggleConfirmPassword(toggle);
                        },
                        isVisible: controller.toggleConfirmPassword.value,
                        height: 60,
                        prefixIcon: CustomImage(
                          path: AppIcons.password,
                          height: getWidth(22),
                          width: getWidth(22),
                        ),
                        inputAction: TextInputAction.next,
                      );
                    }),
                    SizedBox(
                      height: getWidth(50),
                    ),
                    /// Sign up button
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 0),
                      height: getWidth(61),
                      width: screenWidth(),
                      child: Obx(() {
                        if(controller.isLoading.value) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                          return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.buttonColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {
                                controller.validationSignupForm(context);
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: getWidth(17),
                                    fontWeight: FontWeight.w500),
                              ));
                        }
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    /// Social Buttons
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: getWidth(56),
                          width: getWidth(56),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(getWidth(16)),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 4,
                                    offset: const Offset(0, 3),
                                    color: const Color(0xff395AB8)
                                        .withOpacity(0.1))
                              ]),
                          child: Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(getWidth(16)),
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(getWidth(16)),
                              child: const Center(
                                child: CustomImage(
                                  path: AppIcons.facebook,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: getWidth(56),
                          width: getWidth(56),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(getWidth(16)),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 4,
                                    offset: const Offset(0, 3),
                                    color: const Color(0xff395AB8)
                                        .withOpacity(0.1))
                              ]),
                          child: Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(getWidth(16)),
                            child: InkWell(
                              onTap: () {

                              },
                              borderRadius: BorderRadius.circular(getWidth(16)),
                              child: const Center(
                                child: CustomImage(
                                  path: AppIcons.googlePng,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    /// Go to Login Up page
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                              fontSize: getWidth(17),
                              fontWeight: FontWeight.w300,
                              color: const Color(0xff383C40)),
                        ),
                        AppTextButton(
                          onTap: () {
                            Get.back();
                          },
                          text: "Login",
                          textColor: const Color(0xff2893E3),
                          textSize: 17,
                          textDecoration: TextDecoration.none,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
