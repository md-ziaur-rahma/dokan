import 'package:dokan/app/core/app_colors.dart';
import 'package:dokan/app/core/app_icons.dart';
import 'package:dokan/app/core/app_sizes.dart';
import 'package:dokan/app/core/utils.dart';
import 'package:dokan/app/global_widget/custom_image.dart';
import 'package:dokan/app/module/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground2,
      body: CustomScrollView(
        slivers: [
          /// AppBar
          SliverAppBar(
            title: const Text("Product List",style: TextStyle(fontSize: 22.5,fontWeight: FontWeight.w700,color: Color(0xff222455)),),
            backgroundColor: AppColors.pageBackground2,
            surfaceTintColor: AppColors.pageBackground2,
            centerTitle: true,
            floating: true,
            pinned: false,
            actions: [
              IconButton(onPressed: (){},
                  icon: CustomImage(path: AppIcons.search,
                    height: getWidth(24),width: getWidth(24),)),
              SizedBox(width: getWidth(12),)
            ],
          ),
          /// filter Button
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: getWidth(60),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(getWidth(16)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        color: const Color(0xff395AB8).withOpacity(0.1),
                        offset: const Offset(0, 3)
                    ),
                  ]
                ),
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(getWidth(16)),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(getWidth(16)),
                    onTap: (){
                      Get.bottomSheet(
                        Container(
                          width: screenWidth(),
                          decoration: BoxDecoration(
                            color: const Color(0xffF8F8F8),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 14,
                                  color: Colors.black.withOpacity(0.08),
                                  offset: const Offset(0, -10)
                              ),
                            ]
                          ),
                          padding: EdgeInsets.symmetric(horizontal: getWidth(20),vertical: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 3,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffFFD3DD),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16,),
                              Text("Filter",style: TextStyle(color: Colors.black,fontSize: getWidth(17),fontWeight: FontWeight.w700),),
                              const SizedBox(height: 16,),
                              ...List.generate(controller.filterList.length, (index){
                                return GestureDetector(
                                  onTap: (){
                                    controller.selectFilter(controller.filterList[index]);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Obx((){
                                          if(controller.isSelect(controller.filterList[index]).value){
                                            return const CustomImage(path: AppIcons.checked);
                                          } else {
                                            return const CustomImage(path: AppIcons.checkBlank);
                                          }
                                        }),
                                        SizedBox(width: getWidth(16),),
                                        Expanded(child: Text(controller.filterList[index],style: TextStyle(fontSize: getWidth(15),),))
                                      ],
                                    ),
                                  ),
                                );
                              }),
                              const SizedBox(
                                height: 100,
                              ),
                              SizedBox(
                                height: getWidth(61),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: getWidth(61),
                                        child: OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              side: const BorderSide(color: Color(0xffD2DBE0)),
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                                          onPressed: (){
                                            Get.back();
                                          },
                                          child: const Text("Cancel",style: TextStyle(color: Color(0xff818995)),),
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
                                          onPressed: (){
                                            controller.filterApply();
                                            Get.back();
                                          },
                                          child: const Text("Apply",style: TextStyle(),),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                      child: Row(
                        children: [
                          const CustomImage(path: AppIcons.filter),
                          SizedBox(width: getWidth(8),),
                          const Text("Fiter",style: TextStyle(color: Color(0xff818995)),),
                          const Spacer(),
                          const Text("Sort by",style: TextStyle(color: Color(0xff818995)),),
                          SizedBox(width: getWidth(8),),
                          const CustomImage(path: AppIcons.dropDown),
                          SizedBox(width: getWidth(8),),
                          const CustomImage(path: AppIcons.list),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          /// Product GridView
          SliverPadding(
            padding: EdgeInsets.all(getWidth(12)),
            sliver: SliverToBoxAdapter(
              child: Obx(() {
                if(controller.isLoading.value){
                  return const Center(child: CircularProgressIndicator());
                }
                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: controller.productList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: getWidth(12),
                      crossAxisSpacing: getWidth(12),
                      childAspectRatio: 0.61
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(getWidth(16))
                        ),
                        child: Material(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(getWidth(16)),
                          child: InkWell(
                            onTap: (){
              
                            },
                            borderRadius: BorderRadius.circular(getWidth(16)),
                            child: Column(
                              children: [
                                AspectRatio(
                                  aspectRatio: 1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(getWidth(16))),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.primaries[index % 17].withOpacity(0.1),
                                        borderRadius: BorderRadius.vertical(top: Radius.circular(getWidth(16))),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        ///AppImages.women
                                        child: CustomImage(path: controller.productList[index].images.firstOrNull?.src,),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        // Girls Stylish Dresses pink with yellow…
                                        Expanded(
                                          child: Text(controller.productList[index].name,
                                            maxLines: screenWidth() > 380 ? 2 : 1,overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: getWidth(14),color: Colors.black,fontWeight: FontWeight.w500),),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: controller.isShowCuttedPrice(index) ? "\$${controller.productList[index].regularPrice} " : "",
                                            style: TextStyle(color: const Color(0xff989FA8),fontSize: getWidth(18),decoration: TextDecoration.lineThrough),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: "\$${controller.productList[index].salePrice}",
                                                style: TextStyle(color: Colors.black,fontSize: getWidth(18),decoration: TextDecoration.none),
                                              )
                                            ]
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          children: [
                                            ...List.generate(5, (index){
                                              return Icon(Icons.star,
                                                size: getWidth(14),
                                                color: index >= Utils.toInt("3.5") ? const Color(0xffD3D8E5) : const Color(0xffF5A623),);
                                            })
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 100,),
          ),
        ],
      ),
    );
  }
}
