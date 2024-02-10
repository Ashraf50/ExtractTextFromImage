import 'package:extract_text_and_translate/feature/home/presentation/view/widget/custom_button.dart';
import 'package:extract_text_and_translate/feature/home/presentation/view/widget/custom_photo.dart';
import 'package:extract_text_and_translate/feature/home/presentation/view/widget/dark_mode_widget.dart';
import 'package:extract_text_and_translate/feature/home/presentation/view_model/cubit/image_cubit.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ImageCubit.get(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color(0xff086390),
          title: const Text(
            "All Scans",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        drawer: const Drawer(
            backgroundColor: Color(0xff086390),
            child: Column(
              children: [
                DarkModeWidget(),
              ],
            )),
        body: ListView(
          children: const [
            SizedBox(
              height: 10,
            ),
            CustomPhoto(),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              onPressed: () async {
                await cubit.choosePhoto();
              },
              icon: const Icon(
                Icons.photo,
              ),
            ),
            CustomButton(
              onPressed: () async {
                await cubit.takePhoto();
              },
              icon: const Icon(
                Icons.camera_alt_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
