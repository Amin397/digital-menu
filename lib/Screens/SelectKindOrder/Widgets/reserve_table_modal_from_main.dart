import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled13/Bloc/blocs.dart';
import 'package:untitled13/Const/color_utils.dart';
import 'package:untitled13/Helpers/view_helper.dart';
import 'package:untitled13/Screens/SelectKindOrder/Controller/select_kind_order_controller.dart';
import 'package:untitled13/Screens/ShopingBasket/Model/shoping_basket_model.dart';

class ReserveTableModalFromMain extends StatelessWidget {
  ReserveTableModalFromMain({
    Key? key,
    this.selectKindOrderController,
  }) : super(key: key);
  final SelectKindOrderController? selectKindOrderController;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.only(
          top: Get.height * .015,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              Get.height * .03,
            ),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: Get.height * .055,
              width: Get.width,
              margin: EdgeInsets.symmetric(
                horizontal: Get.width * .1,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffD4970A),
                borderRadius: BorderRadius.circular(
                  Get.height * .015,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                  ),
                  const AutoSizeText(
                    "میز خود را انتخاب کنید",
                    maxLines: 1,
                    maxFontSize: 20.0,
                    minFontSize: 12.0,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.clear,
                      color: Color(0xffD4970A),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * .01,
            ),
            GetBuilder(
              init: selectKindOrderController,
              builder: (ctx) {
                return Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: Get.width * .02,
                      vertical: Get.height * .01,
                    ),
                    height: double.maxFinite,
                    width: Get.width,
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (_, index) => _buildItem(
                        item: selectKindOrderController!.tableList![index],
                      ),
                      itemCount: selectKindOrderController!.tableList!.length,
                    ),
                    // child: Center(
                    //   child: Stack(
                    //     children: [
                    //       Center(
                    //         child: SizedBox(
                    //           height: Get.height * .1,
                    //           width: Get.width,
                    //           child: Column(
                    //             mainAxisAlignment:
                    //                 MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               Container(
                    //                 height: Get.height * .0015,
                    //                 width: Get.width,
                    //                 color: Colors.black,
                    //               ),
                    //               Container(
                    //                 height: Get.height * .0015,
                    //                 width: Get.width,
                    //                 color: Colors.black,
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //       PageView.builder(
                    //         controller:
                    //             selectKindOrderController!.pageController,
                    //         onPageChanged: (page) {
                    //           selectKindOrderController!.changePage(page);
                    //         },
                    //         physics: const BouncingScrollPhysics(),
                    //         scrollDirection: Axis.vertical,
                    //         itemCount:
                    //             selectKindOrderController!.tableList!.length,
                    //         itemBuilder: (context, index) =>
                    //             _buildTableNumberViewItem(
                    //           item:
                    //               selectKindOrderController!.tableList![index],
                    //           index: index,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ),
                );
              },
            ),
            InkWell(
              onTap: () {
                // Blocs.aminBasket.setTable(
                //   tableModel: selectKindOrderController!
                //       .tableList![selectKindOrderController!.currentPage],
                // );
                // selectKindOrderController!.setTime();
                selectKindOrderController!.showSelectTimeAlert();
              },
              child: Container(
                height: Get.height * .05,
                width: Get.width,
                color: Colors.red,
                child: const Center(
                  child: AutoSizeText(
                    'انتخاب میز',
                    maxLines: 1,
                    maxFontSize: 18.0,
                    minFontSize: 14.0,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCapacity({
    TableModel? item,
  }) {
    return Flexible(
      flex: 1,
      child: SizedBox(
        height: Get.height * .05,
        width: double.maxFinite,
        child: Row(
          children: [
            const Flexible(
              flex: 1,
              child: SizedBox(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AutoSizeText(
                    'ظرفیت :',
                    maxLines: 1,
                    maxFontSize: 14.0,
                    minFontSize: 10.0,
                    style: TextStyle(
                      color: ColorUtils.grey,
                      fontSize: 10.0,
                    ),
                  ),
                ),
                height: double.maxFinite,
                width: double.maxFinite,
              ),
            ),
            Expanded(
              child: SizedBox(
                child: Center(
                  child: AutoSizeText(
                    item!.capacity.toString() + ' نفر',
                    maxLines: 1,
                    maxFontSize: 18.0,
                    minFontSize: 12.0,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                height: double.maxFinite,
                width: double.maxFinite,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReservePrice({
    TableModel? item,
  }) {
    return Flexible(
      flex: 1,
      child: SizedBox(
        height: Get.height * .05,
        width: double.maxFinite,
        child: Row(
          children: [
            const Flexible(
              flex: 1,
              child: SizedBox(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AutoSizeText(
                    'هزینه رزرو :',
                    maxLines: 1,
                    maxFontSize: 14.0,
                    minFontSize: 10.0,
                    style: TextStyle(
                      color: ColorUtils.grey,
                      fontSize: 10.0,
                    ),
                  ),
                ),
                height: double.maxFinite,
                width: double.maxFinite,
              ),
            ),
            Expanded(
              child: SizedBox(
                child: Center(
                  child: AutoSizeText(
                      (item!.price == 0)?'رایگان':ViewHelper.moneyFormat(
                      double.parse(
                        item.price.toString(),
                      ),
                    ) + ' تومان',
                    maxLines: 1,
                    maxFontSize: 18.0,
                    minFontSize: 12.0,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                height: double.maxFinite,
                width: double.maxFinite,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTableNumber({
    TableModel? item,
  }) {
    return Flexible(
      flex: 1,
      child: SizedBox(
        height: Get.height * .05,
        width: double.maxFinite,
        child: Row(
          children: [
            const Flexible(
              flex: 1,
              child: SizedBox(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AutoSizeText(
                    'شماره میز :',
                    maxLines: 1,
                    maxFontSize: 14.0,
                    minFontSize: 10.0,
                    style: TextStyle(
                      color: ColorUtils.grey,
                      fontSize: 10.0,
                    ),
                  ),
                ),
                height: double.maxFinite,
                width: double.maxFinite,
              ),
            ),
            Expanded(
              child: SizedBox(
                child: Center(
                  child: AutoSizeText(
                    item!.number.toString(),
                    maxLines: 1,
                    maxFontSize: 18.0,
                    minFontSize: 12.0,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                height: double.maxFinite,
                width: double.maxFinite,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTableName({
    TableModel? item,
  }) {
    return (item!.name!.isEmpty)
        ? const SizedBox()
        : SizedBox(
            height: Get.height * .05,
            width: double.maxFinite,
            child: Row(
              children: [
                const Flexible(
                  flex: 1,
                  child: SizedBox(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: AutoSizeText(
                        'نام میز',
                        maxLines: 2,
                        maxFontSize: 12.0,
                        minFontSize: 8.0,
                        style: TextStyle(
                          color: ColorUtils.grey,
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: Center(
                      child: AutoSizeText(
                        item.name!,
                        maxFontSize: 18.0,
                        minFontSize: 12.0,
                        maxLines: 2,
                        style: const TextStyle(
                          color: ColorUtils.textColor,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }

  _buildItem({TableModel? item}) {
    return GestureDetector(
      onTap: () {
        selectKindOrderController!.selectTableForReserve(
          item: item,
        );
      },
      child: Obx(() => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.all(6.0),
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * .01,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: item!.isSelected.value
                    ? ColorUtils.red
                    : Colors.transparent,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: ViewHelper.shadow(),
            ),
            child: Column(
              children: [
                _buildTableName(
                  item: item,
                ),
                _buildCapacity(
                  item: item,
                ),
                _buildTableNumber(
                  item: item,
                ),
                _buildReservePrice(
                  item: item,
                ),
              ],
            ),
          )),
    );
  }
}
