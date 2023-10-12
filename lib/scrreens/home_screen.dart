import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../riverpodProvider/provider_handler.dart';
import '../route/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          final playlistPro = ref.watch(providerAllNews("General".toLowerCase()));
          return playlistPro.when(
              error: (error, str) => Text(playlistPro.asData.toString()),
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
              });
        }),
      ),
    );
  }
}
