import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../utils/Utils.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {


    var value = Get.arguments;
    String newsImage = value[0];
    String newsTitle = value[1];
    String newsAuthor = value[3];
    String newsDesc = value[4];
    String newsContent = value[5];
    String newsSource = value[6];

    double Kwidth = MediaQuery.of(context).size.width;
    double Kheight = MediaQuery.of(context).size.height;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey[600],
            )),
      ),
      body: Stack(
        children: [
          Flexible(
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: Kheight * 0.02),
              height: Kheight * 0.45,
              width: Kwidth,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: CachedNetworkImage(
                  imageUrl: "${newsImage}",
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                      child: SpinKitFadingCircle(
                    color: Colors.amber,
                    size: 50.0,
                  )),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(top: Kheight * 0.4),
              padding: EdgeInsets.only(top: 20, right: 20, left: 20),
              height: Kheight * 0.6,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: ListView(

                children: [
                  Text('${newsTitle}',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.w700)),
                  SizedBox(height: Kheight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Container(
                          child: Text(
                            newsSource,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: Kheight * 0.03,
                  ),
                  Text('${newsDesc}',
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: Kheight * 0.03,
                  ),
                  // Text('${newsContent}',
                  //     maxLines: 20,
                  //     style: GoogleFonts.poppins(
                  //         fontSize: 15,
                  //         color: Colors.black87,
                  //         fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: Kheight * 0.03,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
