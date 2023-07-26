import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:music_app/screens/homescreen/controller/homepage_controller.dart';
import '../../resources/app_images.dart';
import '../../resources/app_colors.dart';
import '../bottomsheetscreen/bottom_sheet_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  void displayBottomSheet(
      BuildContext context, int index, List<String> imagesPathList) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return BottomSheetMusic(
          imagesPathList: imagesPathList,
          imageIndex: index,
        );
      },
    );
  }

  final homePageController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    //width:MediaQuery.of(context).size.width ,
                    //height: MediaQuery.of(context).size.height,
                    decoration:  BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          'Hello Jaimin,',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.tertiary),
                        ),
                        const Text(
                          'What you want to hear today?',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.grey),
                            //controller: textController,
                            //autovalidateMode: AutovalidateMode.onUserInteraction,
                            //validator: (value) => validation!(value),
                            //onChanged: onChanged,
                            // cursorColor: Colors.grey,
                            // keyboardType: keyboardType,
                            // inputFormatters: inputFormatters,
                            decoration: InputDecoration(
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                              ),
                              suffixIcon: Transform.scale(
                                scale: 0.55,
                                  child: SvgPicture.asset(AppImages.pageInfoIcon,height: 25 ,colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),)),
                              fillColor: const Color.fromARGB(255, 36, 36, 80),
                              filled: true,
                              hintText: 'Search Podcast',

                              //focusColor: Colors.grey,
                              hintStyle: const TextStyle(color: Colors.grey),

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 36, 36, 80)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 36, 36, 80)),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 36, 36, 80)),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 36, 36, 80)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          padding: const EdgeInsets.only(top: 30),
                          child: ListView.builder(
                            itemCount: homePageController.musicType.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                  margin: const EdgeInsets.only(right: 20),
                                  child: Text(
                                    homePageController.musicType[index],
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 18),
                                  ));
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 30),
                          height: 305,
                          //color: Colors.white,
                          child: ListView.builder(
                            itemCount: homePageController.imagesPath.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  //color: Colors.white,
                                ),
                                height: 250,
                                width: 290,
                                margin: const EdgeInsets.only(right: 20),
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: -10,
                                        bottom: 20,
                                        left: 20,
                                        right: 20,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                              image: AssetImage(homePageController.imagesPath[index]),
                                              fit: BoxFit.fill
                                            )
                                          ),
                                          height: 250,
                                          width: 260,
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                                            child: Container(
                                              color: Colors.black.withOpacity(0),
                                            ),
                                          ),
                                        ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        height: 250,
                                        width: 290,
                                        child: Image.asset(homePageController.imagesPath[index],
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    Positioned(
                                      left: 10,
                                      right: 10,
                                      bottom: 40,
                                      child: Opacity(
                                        opacity: 0.95,
                                        child: Container(
                                          height: 45,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color:
                                                AppColors.stackContainerColor,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                height: 25,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8),
                                                  gradient: const LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: [AppColors.gradientButtonColor1, AppColors.gradientButtonColor2],
                                                    stops: [0.2,0.8]
                                                  ),
                                                ),
                                                width: 45,
                                                child: const Text(
                                                  'NEW!',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              const Text(
                                                'Name of Podcast, eps xy',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Recently Play',
                              style:
                                  TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.tertiary),
                            ),
                           const Text(
                              'See All',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            //height: 150,
                            padding: const EdgeInsets.only(top: 10),
                            child: ListView.builder(
                              //shrinkWrap: true,
                              itemCount: homePageController.imagesPath.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    displayBottomSheet(context, index, homePageController.imagesPath);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    padding: const EdgeInsets.all(10),
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(255, 34, 36, 77),
                                    ),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: 75,
                                          width: 70,
                                          child: Image.asset(
                                            homePageController.imagesPath[index],
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            alignment: Alignment.centerLeft,
                                            child: RichText(
                                              text: const TextSpan(children: [
                                                TextSpan(
                                                  text: "Song Name\n",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'Artist Name\n\n',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '12:30/',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey),
                                                ),
                                                TextSpan(
                                                  text: '22:30',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: AppColors
                                                          .musicTimeTextColor),
                                                )
                                              ]),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  AppColors.gradientButtonColor1,
                                                  AppColors.gradientButtonColor2
                                                ],
                                              ),
                                            ),
                                            child: Transform.scale(
                                              scale: 0.6,
                                                child: SvgPicture.asset(AppImages.playIcon, colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),))
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            onTap: (value) {
              homePageController.selectedIndex(value, context);
            },
            type: BottomNavigationBarType.fixed,
            currentIndex: 0,
            items:  [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_filled,
                    size: 30,
                    color: AppColors.bottomNavigationIconColor,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    size: 30,
                    color: AppColors.bottomNavigationIconColor,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppImages.saveIcon, height: 25,colorFilter: const ColorFilter.mode(AppColors.bottomNavigationIconColor, BlendMode.srcIn)),
                  label: ''),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppImages.settingIcon, height: 25, colorFilter: const ColorFilter.mode(AppColors.bottomNavigationIconColor, BlendMode.srcIn),),
                  label: ''),
            ],
          ),
        ),
      ),
    );
  }
}
