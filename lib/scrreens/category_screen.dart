import 'package:cached_network_image/cached_network_image.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:untitled/repository/news_repository.dart';
import 'package:untitled/route/routes.dart';

import '../model/all_news_model.dart';
import '../riverpodProvider/provider_handler.dart';
import 'details_screen.dart';

class CategoriesScreen extends ConsumerStatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends ConsumerState<CategoriesScreen> {
  List<String> btnCategories = [
    'General',
    'Entertainment',
    'Health',
    'Sports',
    'Business',
    'Technology'
  ];
  final format = new DateFormat('MMMM dd,yyyy');

  int btnSelected = 0;
  String selectedCategory = 'General';

  @override
  Widget build(BuildContext context) {
    var data = ref.watch(providerAllNews(selectedCategory));
    double Kwidth = MediaQuery.of(context).size.width;
    double Kheight = MediaQuery.of(context).size.height;
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: Get.back,
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey[400],
          ),
        ),
        centerTitle: true,
        title: Text("News Category",style: TextStyle(
          color: Colors.blue
        ),),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            height: Kheight * 0.07,
            child: ListView.builder(
                itemCount: btnCategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            primary: index == btnSelected
                                ? Colors.blueAccent
                                : Colors.grey),
                        onPressed: () {
                          btnSelected = index;
                          selectedCategory = btnCategories[index];
                          setState(() {});
                        },
                        child: Text(
                          btnCategories[index],
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
              child: data.when(
                  data: (data) {
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: data.articles?.length,
                      itemBuilder: (context, index) {
                        DateTime dateTime =
                            DateTime.parse(data.articles![index].publishedAt!);
                        return InkWell(
                          onTap: () {
                            String newsImage =
                                data!.articles![index].urlToImage!;
                            String newsTitle = data!.articles![index].title!;
                            String newsDate =
                                data!.articles![index].publishedAt!;
                            String newsAuthor = data!.articles![index].author!;
                            String newsDesc =
                                data!.articles![index].description!;
                            String newsContent =
                                data!.articles![index].content!;
                            String newsSource =
                                data!.articles![index].source!.name!;

                            Get.toNamed(Routes.details, arguments: [
                              newsImage,
                              newsTitle,
                              newsDate,
                              newsAuthor,
                              newsDesc,
                              newsContent,
                              newsSource
                            ]);
                          },
                          child: Expanded(

                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: data!.articles![index]!.urlToImage
                                          .toString(),
                                      fit: BoxFit.cover,
                                      height: 100,
                                      width: 90,
                                      placeholder: (context, url) => Container(
                                        child: Center(
                                          child: SpinKitChasingDots(
                                            size: 50,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) => Icon(
                                        Icons.error_outline,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Padding(
                                    padding: EdgeInsets.only(left: 12),
                                    child: Container(
                                        height: 100,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              data.articles![index].title
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.w600),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                            ),
                                            DView.spaceHeight(),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    data!.articles![index].source!
                                                        .name
                                                        .toString(),
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Text(
                                                    format.format(dateTime),
                                                    overflow: TextOverflow.ellipsis,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                  ))
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  error: (error, str) => Text(error.toString()),
                  loading: () => SpinKitChasingDots(
                        color: Colors.blue,
                        size: 40,
                      )))
        ],
      ),
    );
  }
}
