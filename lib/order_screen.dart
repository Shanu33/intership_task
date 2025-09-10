import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_task/widgets/button.dart';
import 'package:internship_task/widgets/custom_border.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adaptive_linear_layout/adaptive_linear_layout.dart';
import 'package:internship_task/widgets/custom_searchbar.dart';
import 'package:internship_task/widgets/filter_chips.dart';
import 'package:internship_task/widgets/order_table.dart';
import 'package:platform_screener/platform_screener.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFFF8F9FA)),
      debugShowCheckedModeBanner: false,
      home: _OrderScreen(),
    );
  }
}

class _OrderScreen extends StatefulWidget {
  const _OrderScreen({super.key});

  @override
  State<_OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<_OrderScreen> {
  List<String> _clientChips = [], _stockChips = [];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width / 100;
    final screenHeight = screenSize.height / 100;
    var mode=getScreenMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: mode==ScreenMode.portrait?5:55, vertical: mode==ScreenMode.portrait?30:40),
        scrollDirection: Axis.vertical,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * (mode==ScreenMode.portrait?1:2.5)),

            Align(
              alignment: Alignment.centerLeft + Alignment(0.1, 0),
              child: Text(
                "Open Orders",
                style: TextStyle(
                  fontFamily: "roboto",
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 2.3),
            BorderContainer(
              width: screenWidth * 95,
              height: screenHeight * 34,
             //keepHeight:mode==ScreenMode.landscape ?true:false ,
             // keepHieght: mode==ScreenMode.landscape ?true:false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                      CustomSearchBar(
                        width: screenWidth * (mode==ScreenMode.landscape?45: 100),
                        height: screenHeight * (mode==ScreenMode.landscape?11:5),
                        iconContainerHeight: screenHeight * 7,
                        iconContainerWidth: screenWidth * 13,
                        iconWidth: screenWidth * 7,
                        iconHeight: screenWidth * 7,
                        onIconTap: (text) {
                          setState(() {
                            _clientChips.add(text);
                          });
                        },
                      ),
                      SizedBox(height:screenHeight*(mode==ScreenMode.landscape?0.0:0.5) , width: screenWidth*( mode==ScreenMode.landscape?1.5: 0.0),),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: _clientChips.map((chipText) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 2),
                                child: FilterChips(
                                  text: chipText,
                                  textCase: wordCase.capitalized,
                                  onDeleteTap: (item) {
                                    setState(() {
                                      _clientChips.remove(item);
                                    });
                                  },
                                ),
                              );
                            }).toList(),
                          ),
                        ),

                  ),
                  SizedBox(height: screenHeight *(mode==ScreenMode.landscape?1.5:0.5)),
                      CustomSearchBar(
                        width: screenWidth * (mode==ScreenMode.landscape?45: 100),
                        height: screenHeight * (mode==ScreenMode.landscape?11:5),
                        iconContainerHeight: screenHeight * 7,
                        iconContainerWidth: screenWidth * 13,
                        iconWidth: screenWidth * 7,
                        iconHeight: screenWidth * 7,
                        iconPath: "assets/images/search.svg",
                        hintText: "Search for a stock, future, option or index",
                        showRightBorder: false,
                        containerColor: Colors.white,
                        onIconTap: (text) {
                          setState(() {
                            _stockChips.add(text);
                          });
                        },

                  ),
                  SizedBox(height:screenHeight*(mode==ScreenMode.landscape?0.0:0.5) , width: screenWidth*( mode==ScreenMode.landscape?1.5: 0.0),),
                  Align(
                    alignment:Alignment.centerLeft,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _stockChips.map((chipText) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 2),
                            child: FilterChips(
                              text: chipText,
                              textCase: wordCase.upperCase,
                              onDeleteTap: (item) {
                                setState(() {
                                  _stockChips.remove(item);
                                });
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  text: "Download",
                  iconPath: "assets/images/download.svg",
                  width: screenWidth * (mode==ScreenMode.landscape?28: 39),
                  height: screenHeight * (mode==ScreenMode.landscape?11: 5),
                ),
                CustomButton(
                  text: "Cancell all",
                  iconPath: "assets/images/cancel.svg",
                  width: screenWidth * (mode==ScreenMode.landscape?28: 39),
                  height: screenHeight * (mode==ScreenMode.landscape?11: 5),
                  textColor: Colors.white,
                  backgroundColor: Color(0xFFE53935),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 3),
            Container(
              width: screenWidth * 100,
              height: screenHeight *(mode==ScreenMode.landscape?69: 31),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                child: OrdersTable(),
              ),
            ),
            Container(
              width: screenWidth * 100,
              height: screenHeight * (mode==ScreenMode.portrait?8:15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BorderContainer(
                    child: Center(child: Text("Previous")),
                    width: screenWidth * 25,
                    height:screenHeight*(mode==ScreenMode.portrait?5.1:11.0),
                    keepHeight:true ,

                  ),
                  SizedBox(
                    width: screenWidth * 29,
                    child: Center(child: Text("Page 1")),
                  ),
                  BorderContainer(
                    child: Center(child: Text("Next")),
                    width: screenWidth * 25,
                    height: screenHeight*(mode==ScreenMode.portrait?5.1:11.0),
                   keepHeight:true,
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
