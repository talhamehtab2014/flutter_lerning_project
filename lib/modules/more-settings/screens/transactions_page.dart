import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_text_style.dart';
import '../../../utils/colors.dart';
import '../../../widgets/back_button.dart';

class TransactionsPage extends StatelessWidget {
  static const id = "/Transactions";
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var paymentMethod = ''.obs;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.w),
        child: Column(
          children: [
            SizedBox(
              height: 49.h,
            ),
            Row(
              children: [
                CustomBackButton(),
                SizedBox(
                  width: 97.w,
                ),
                Text(
                  'Transactions',
                  style: AppTextStyle.header4,
                )
              ],
            ),
            SizedBox(
              height: 23.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 21.h, left: 17.w),
                  width: 152.w,
                  height: 90.h,
                  decoration: BoxDecoration(
                    color: ThemeColors.socialSignInButton,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Money Earned',
                        style: AppTextStyle.transactionslabelStyle,
                      ),
                      Text(
                        'USD 4,930',
                        style: AppTextStyle.wishModalStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 21.h, left: 17.w),
                  width: 152.w,
                  height: 90.h,
                  decoration: BoxDecoration(
                    color: ThemeColors.socialSignInButton,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fulfilled Wishes',
                        style: AppTextStyle.transactionslabelStyle,
                      ),
                      Text(
                        '90',
                        style: AppTextStyle.wishModalStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 21.h,
            ),
            Container(
              width: 327.w,
              height: 48.h,
              decoration: BoxDecoration(
                border: Border.all(color: ThemeColors.txtFieldBorderColor),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Obx(
                () {
                  return DropdownButton(
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: ThemeColors.mainTitle,
                    ),
                    hint: const Text('Select Your  Payout Method'),
                    borderRadius: BorderRadius.circular(8.r),
                    icon: Image.asset(
                      AppAssets.icDropDown,
                    ),
                    elevation: 1,
                    underline: Container(),
                    value: paymentMethod.value,
                    isExpanded: true,
                    padding: EdgeInsets.only(left: 140.w, right: 20.w),
                    items: const [
                      DropdownMenuItem<String>(
                        value: '',
                        child: Text(''),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Escrow',
                        child: Text(
                          'Escrow',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: 'PayPal',
                        child: Text('PayPal', textAlign: TextAlign.center),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Bank',
                        child: Text('Bank', textAlign: TextAlign.center),
                      ),
                    ],
                    onChanged: (String? value) {
                      paymentMethod.value = value!;
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.only(top: 39.h, left: 16.w, right: 19.w),
              decoration: BoxDecoration(
                color: ThemeColors.transactionsChartBgColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.r),
                ),
              ),
              width: 325.w,
              height: 477.h,
              child: Expanded(
                child: BarChart(
                  BarChartData(
                      barTouchData: barTouchData,
                      titlesData: titlesData,
                      borderData: borderData,
                      barGroups: barGroups,
                      extraLinesData: ExtraLinesData(horizontalLines: [
                        HorizontalLine(
                          y: 0.0,
                          color: ThemeColors
                              .txtFieldBorderColor, // Set the color of the line
                          strokeWidth: 1, // Set the width of the line
                          dashArray: [5, 5],
                        ),
                        HorizontalLine(
                          y: 60000,
                          color: ThemeColors
                              .txtFieldBorderColor, // Set the color of the line
                          strokeWidth: 1, // Set the width of the line
                          dashArray: [5, 5],
                        ),
                      ]),
                      gridData: FlGridData(
                        show: true,
                        drawHorizontalLine:
                            true, // Enable drawing horizontal lines
                        drawVerticalLine:
                            false, // Disable drawing vertical lines
                        verticalInterval: 10000,
                        checkToShowHorizontalLine: (value) =>
                            value == 0 ||
                            value % 10000 == 0 ||
                            value == 60000, // Interval for the horizontal lines
                        getDrawingHorizontalLine: (value) {
                          if (value == 0 ||
                              value % 10000 == 0 ||
                              value == 60000) {
                            return const FlLine(
                              color: ThemeColors
                                  .txtFieldBorderColor, // Set the color of the line
                              strokeWidth: 1, // Set the width of the line
                              dashArray: [
                                5,
                                5
                              ], // Optionally, set a dash pattern
                            );
                          } else {
                            return FlLine(color: Colors.transparent);
                          }
                        },
                      ),
                      alignment: BarChartAlignment.spaceAround,
                      maxY: 60000,
                      minY: 0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => Colors.transparent,
          //tooltipPadding: EdgeInsets.only(left: 5.w),
          //tooltipMargin: 10,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              TextStyle(
                color: ThemeColors.transactionsChartTextColor,
                fontWeight: FontWeight.w500,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
        color: ThemeColors.transactionsChartTextColor,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Jan';
        break;
      case 1:
        text = 'Feb';
        break;
      case 2:
        text = 'Mar';
        break;
      case 3:
        text = 'Apr';
        break;
      case 4:
        text = 'May';
        break;
      default:
        text = ''; // Use any text or placeholder if needed
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget getLeftTitles(double value, TitleMeta meta) {
    final style = TextStyle(
        color: ThemeColors.transactionsChartTextColor,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500);
    String leftText;
    if (value == 0) {
      leftText = '0 k';
    } else if (value == 60000) {
      leftText = '60 k';
    } else if (value % 10000 == 0) {
      leftText = '${(value / 1000).toStringAsFixed(0)}K';
    } else {
      leftText = ''; // Empty string for non-marked intervals
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(leftText, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: AxisTitles(
          axisNameSize: 12.sp,
          sideTitles: SideTitles(
              interval: 10000,
              showTitles: true,
              reservedSize: 40.sp,
              getTitlesWidget: getLeftTitles),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: 45000,
              color: ThemeColors.toggleSwitchBgColor,
            )
          ],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: 5000,
              color: ThemeColors.toggleSwitchBgColor,
            )
          ],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              toY: 25000,
              color: ThemeColors.toggleSwitchBgColor,
            )
          ],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              toY: 32000,
              color: ThemeColors.toggleSwitchBgColor,
            )
          ],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              toY: 17000,
              color: ThemeColors.toggleSwitchBgColor,
            )
          ],
          // showingTooltipIndicators: [0],
        ),
      ];
}
