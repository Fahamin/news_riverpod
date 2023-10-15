import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../riverpodProvider/provider_handler.dart';
import '../route/routes.dart';

enum SampleItem { bbcNews, alJjazeera, independent, reuters, cnn }

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  final format = new DateFormat('MMMM dd,yyyy');

  SampleItem? selectedMenu;
  String name = 'bbc-news';

  @override
  Widget build(BuildContext context, ref) {
    double Kwidth = MediaQuery.of(context).size.width;
    double Kheight = MediaQuery.of(context).size.height;
    var data = ref.watch(providerHeadLines(name));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            'images/category_icon.png',
            height: Kheight * 0.05,
            width: Kwidth * 0.05,
          ),
        ),
        title: Text('News',
            style: GoogleFonts.poppins(
                fontSize: 24,
                color: Colors.black87,
                fontWeight: FontWeight.w800)),
        actions: [
          PopupMenuButton<SampleItem>(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            initialValue: selectedMenu,
            // Callback that sets the selected popup menu item.
            onSelected: (SampleItem item) {
              if (SampleItem.bbcNews.name == item.name) {
                name = 'bbc-news';
              }
              if (SampleItem.cnn.name == item.name) {
                name = 'cnn';
              }
              if (SampleItem.alJjazeera.name == item.name) {
                name = 'al-jazeera-english';
              }
              if (SampleItem.alJjazeera.name == item.name) {
                name = 'al-jazeera-english';
              }
              if (SampleItem.reuters.name == item.name) {
                name = 'reuters';
              }
              if (SampleItem.independent.name == item.name) {
                name = 'independent';
              }

              selectedMenu = item;
              data = ref.watch(providerHeadLines(name));

            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
              const PopupMenuItem<SampleItem>(
                value: SampleItem.bbcNews,
                child: Text('BBC News'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.alJjazeera,
                child: Text('Al Jazeera'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.independent,
                child: Text('Independent '),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.reuters,
                child: Text('Reuters'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.cnn,
                child: Text('CNN'),
              ),
            ],
          )
        ],
      ),
      body: Center(
          child: data.when(
              error: (error, str) => Text("Not Found"),
              loading: () => Center(child: CircularProgressIndicator()),
              data: (list) {
                return ListView.builder(
                    itemCount: list.articles?.length,
                    itemBuilder: (BuildContext con, int index) {
                      debugPrint(list.articles![index].title);
                      return ListTile(
                        onTap: () async {

                          /*Get.toNamed(Routes.player,
                              arguments: list.articles['title']);*/
                        },
                        title: Text(list.articles![index].title.toString()),
                        trailing: Icon(Icons.more_vert),
                        leading: Icon(Icons.link),
                      );
                    });
              })),
    );
  }


}
