import 'dart:io';
import 'dart:math';

import 'package:dokan/app/global_widget/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toasty_box/toast_enums.dart';
import 'package:toasty_box/toast_service.dart';
import 'package:path/path.dart' as path;
import '../global_widget/custom_button.dart';
import '../global_widget/custom_text.dart';
import 'app_colors.dart';
import 'app_icons.dart';
import 'app_sizes.dart';
import 'app_text.dart';

class Utils {
  static void copyText(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  static showSnackBar({String? title, required String message, Color? color}) {
    Get.snackbar(title ?? "warning".tr, message,
        maxWidth: AppSizes.width * 0.7,
        backgroundColor: Colors.black.withOpacity(0.7),
        duration: const Duration(milliseconds: 1500),
        colorText: color ?? Colors.white,
        snackPosition: SnackPosition.TOP);
  }

  static snackbar(
      {required String title,
      required String message,
      Color? color,
      Color? msgColor,
      double? titleSize,
      required BuildContext context}) {
    ToastService.showWidgetToast(
      context,
      isClosable: true,
      backgroundColor: color ?? AppColors.mainColor,
      shadowColor: Colors.white12,
      length: ToastLength.medium,
      expandedHeight: 100,
      slideCurve: Curves.elasticInOut,
      positionCurve: Curves.bounceOut,
      dismissDirection: DismissDirection.none,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: title,
            fontSize: titleSize ?? getWidth(18),
            fontWeight: FontWeight.w600,
            color: msgColor ?? Colors.white,
          ),
          CustomText(
            text: message,
            fontSize: getWidth(14),
            fontWeight: FontWeight.w600,
            color: msgColor ?? Colors.white,
          ),
        ],
      ),
    );
  }

  static void closeKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static loadingDialog(BuildContext context,
      {bool barrierDismissible = false}) {
    showCustomDialog(
      context,
      child: const SizedBox(
        height: 100,
        child: Center(child: CircularProgressIndicator()),
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  /// this is for showMenu
  static RelativeRect getPopupMenuPosition(BuildContext context){
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
    Overlay.of(context).context.findRenderObject() as RenderBox;

    return RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero),
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );
  }

  static void unFocus() {
    FocusScopeNode currentFocus = FocusScope.of(Get.context!);

    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  /// Is link
  static bool isLink({String? text}){
    if(text == null || text.isEmpty){
      return false;
    }
    if(text.isEmail || text.isURL || text.isPhoneNumber || text.isIPv4 || text.isIPv6){
      return true;
    }
    return false;
  }

  static Future showCustomDialog(
    BuildContext context, {
    Widget? child,
    bool barrierDismissible = false,
    int delay = 400,
  }) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "",
      transitionDuration: Duration(milliseconds: delay),
      pageBuilder: (context, animation, secondaryAnimation) =>
          Align(alignment: Alignment.center, child: child!),
      transitionBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(animation),
        child: child,
      ),
    );
  }

  static void closeDialog(BuildContext context) {
    Navigator.pop(context);
  }


  static double statusBarHeight(BuildContext context) {
    return MediaQuery.paddingOf(context).top;
  }

  static BoxDecoration defaultBoxDecoration() {
    return BoxDecoration(
      boxShadow: defaultBoxShadow(3),
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    );
  }

  static zeroPxBoxShadow({double value = 0}) => <BoxShadow>[
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 4,
          offset: Offset(value, value),
        ),
      ];

  static zeroPxBoxShadowWithDark({double value = 0}) => <BoxShadow>[
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          blurRadius: 4,
          offset: Offset(value, value),
        ),
      ];

  static defaultBoxShadow(double value) => <BoxShadow>[
        BoxShadow(
          color: Colors.grey.withOpacity(0.05),
          blurRadius: 6,
          offset: Offset(value, value),
        ),
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 6,
          offset: Offset(-value, -value),
        ),
      ];

  static double spentPercentage(double whole, double parts) {
    if (whole == 0.0 || parts == 0.0) return 0;
    double value = ((parts / whole) * 100).toDouble();
    return value > 100 ? 100 : value;
  }

  static double toDouble(value) {
    try {
      if (value == null) return 0.0;
      if (value == "") return 0.0;
      if (value is String) return double.tryParse(value) ?? 0.0;
      if (value is int) return value.toDouble();
      if (value is double) return value;
    } catch (e) {
      return 0.0;
    }
    return 0.0;
  }

  static int toInt(value) {
    try {
      if (value == null) return 0;
      if (value == "") return 0;
      if (value is String) {
        return toDouble(value).floor().toInt();
      }
      if (value is int) return value;
      if (value is double) return value.floor().toInt();
    } catch (e) {
      return 0;
    }
    return 0;
  }

  static double perMonthCalculation(
      double amount, String type, String startDate, String endDate) {
    debugPrint("$amount / $type / $startDate / $endDate");
    double value = 0.0;
    DateTime start = DateTime.parse(startDate);
    DateTime end = DateTime.parse(endDate);
    var difference = end.difference(start).inDays;
    debugPrint("first difference : $difference");
    difference = difference < 1 ? 1 : difference;
    debugPrint("difference : $difference");
    if (type.toLowerCase().contains("week")) {
      debugPrint("week");
      value = double.tryParse(
              (amount / (difference / 7).ceilToDouble()).toStringAsFixed(2)) ??
          0;
    } else if (type.toLowerCase().contains("month")) {
      debugPrint("month");
      value = double.tryParse(
              (amount / (difference / 30).ceilToDouble()).toStringAsFixed(2)) ??
          0.0;
    } else if (type.toLowerCase().contains("year")) {
      debugPrint("year");
      value = double.tryParse((amount / (difference / 365).ceilToDouble())
              .toStringAsFixed(2)) ??
          0.0;
    }
    debugPrint("Calculated value : $value");
    return value;
  }

  static String getNumberPlace(int index) {
    int value = index + 1;
    if (value == 1) return "1st";
    if (value == 2) return "2nd";
    if (value == 3) return "3rd";
    return "${value}th";
  }

  String getOrdinal(int number) {
    if (number % 100 >= 11 && number % 100 <= 13) {
      return '${number}th';
    }
    switch (number % 10) {
      case 1:
        return '${number}st';
      case 2:
        return '${number}nd';
      case 3:
        return '${number}rd';
      default:
        return '${number}th';
    }
  }

  static loginFirst({String? content}) {
    showSnackBar(message: content ?? AppText().pleaseLoginFirst);
  }

  static String shortenFileName(String filePath, id) {
    String fileName = filePath.split('/').last;
    fileName = fileName.replaceAll('image_picker', '$id');
    String fileNameWithoutExtension = fileName.split('.').first;
    String extension = fileName.split('.').last;

    int maxLength = 30;

    if (fileName.length <= maxLength) {
      return fileName;
    }

    int fileNameWithoutExtensionLength = fileNameWithoutExtension.length;
    int extensionLength = extension.length;

    int removeCount =
        fileNameWithoutExtensionLength + extensionLength - maxLength + 3;
    int startIndex = (fileNameWithoutExtensionLength - removeCount) ~/ 2;

    String shortenedName =
        "${fileNameWithoutExtension.replaceRange(startIndex, startIndex + removeCount, '')}.$extension";

    return shortenedName;
  }

  static bool isImageUrl(String url) {
    final imageExtensions = ['.jpg', '.jpeg', '.png'];
    // final imageExtensions = [".jpg", ".png", ".jpeg", ".jfif", ".pjpeg", ".pjp", ".webp"];

    final uri = Uri.parse(url);
    final fileExtension = uri.pathSegments.last.split('.').last.toLowerCase();

    return imageExtensions.contains('.$fileExtension');
  }

  static imagePickerModal(Function(String?, bool) onChange) async {
    showModalBottomSheet(
      barrierColor: Colors.grey.withOpacity(0.15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.transparent,
      context: Get.context!,
      builder: (context) {
        return DraggableScrollableSheet(
            initialChildSize: 0.3,
            maxChildSize: 0.3,
            minChildSize: 0.3,
            expand: false,
            builder: (context, scrollController) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  // boxShadow: defaultBoxShadow(5,)
                ),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: Material(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(6),
                              onTap: () async {
                                await Utils.captureImage().then((value) async {
                                  onChange(value, true);
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: AppColors.greyColor,
                                      child: const Center(
                                        child: Icon(
                                          Icons.camera,
                                        ),
                                      ),
                                    ),
                                    const Text("Camera")
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Material(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(6),
                              onTap: () async {
                                await Utils.pickSingleImage()
                                    .then((value) async {
                                  if (value != null) {
                                    onChange(value, true);
                                  }
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: AppColors.greyColor,
                                      child: const Center(
                                        child: FaIcon(FontAwesomeIcons.image),
                                      ),
                                    ),
                                    const Text("Gallery")
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }

  static Future<String?> captureImage() async {
    if (await Permission.camera.status.isGranted) {
      final ImagePicker picker = ImagePicker();
      final XFile? image =
          await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
      if (image != null) {
        final File file = File(image.path);
        final int sizeInBytes = file.lengthSync();
        final double sizeInMb = sizeInBytes / (1024 * 1024);
        if (sizeInMb > 2) {
          showSnackBar(message: AppText().maximum2Allow);
          return null;
        }
        final String dir = path.dirname(image.path);
        final String newPath =
            path.join(dir, '${Random().nextInt(100000000)}.jpg');
        file.renameSync(newPath);
        return newPath;
      }
    } else if (await Permission.camera.status.isGranted) {
      try {
        Map<Permission, PermissionStatus> permissionStatus = await [
          Permission.camera,
        ].request();
        if (permissionStatus[Permission.camera] == PermissionStatus.granted) {
          Future.delayed(const Duration(milliseconds: 150))
              .then((value) => captureImage());
        }
      } on Exception catch (e) {
        debugPrint(e.toString());
      }
      showSnackBar(message: AppText().youDeniedcamera);
    } else if (await Permission.camera.status.isPermanentlyDenied) {
      openAppSettings();
    }

    return null;
  }

  static Future<String?> pickSingleImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image =
          await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
      if (image != null) {
        File file = File(image.path);
        int sizeInBytes = file.lengthSync();
        double sizeInMb = sizeInBytes / (1024 * 1024);
        if (sizeInMb > 2) {
          showSnackBar(message: AppText().maximum2Allow);
          return null;
        }
        return image.path;
      }
    } on Exception catch (e) {
      debugPrint("Image pic error. Reason ${e.toString()}");
      return null;
    }

    return null;
  }

  static Future showSuccessDialog(
    BuildContext context, {
    required String content,
    String? title,
    Function()? onTap,
    bool barrierDismissible = false,
    int delay = 400,
  }) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "",
      transitionDuration: Duration(milliseconds: delay),
      pageBuilder: (context, animation, secondaryAnimation) =>
          const Align(alignment: Alignment.center, child: Text("")),
      transitionBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(animation),
        child: Center(
          child: Material(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.all(15),
              width: AppSizes.width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    height: 25,
                  ),
                  const CustomImage(path: AppIcons.successIcon),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    title ?? AppText().success,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.blue2nd,
                        fontSize: 28),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    content,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomButton(
                      title: AppText().continueText,
                      onTap: onTap ??
                          () {
                            Get.back();
                          })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static String getTransactionType(int type) {
    if (type == 1) return "Cash In";
    if (type == 2) return "Saved";
    if (type == 3) return "Cash Out";
    return "Cash In";
  }

  Widget viewRow(value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        "$value",
        maxLines: 4,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 14.0),
      ),
    );
  }

  static Color getGoalPercentageColor(int type) {
    if (type == 1) {
      return Colors.black87;
    } else if (type == 2) {
      return const Color(0xFFF4970C);
    } else {
      return AppColors.themeColor;
    }
  }
}
