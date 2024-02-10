import 'package:extract_text_and_translate/core/constant/text_style.dart';
import 'package:extract_text_and_translate/feature/home/presentation/view_model/cubit/image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomPhoto extends StatelessWidget {
  const CustomPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
        var cubit = ImageCubit.get(context);
        return Column(
          children: [
            cubit.imgPath == null
                ? const Padding(
                    padding: EdgeInsets.only(top: 200),
                    child: Center(
                      child: Text(
                        "Tap camera / gallery icon to start scan",
                        style: Styles.textStyle16,
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Image.file(
                      cubit.imgPath!,
                      fit: BoxFit.cover,
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SelectableText(
                cubit.extractText ?? "",
                style: Styles.textStyle16,
              ),
            )
          ],
        );
      },
    );
  }
}
