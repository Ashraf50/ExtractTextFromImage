import 'dart:io';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tesseract_ocr/android_ios.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' show basename;
part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitial());
  static ImageCubit get(context) => BlocProvider.of(context);
  File? imgPath;
  String? imgName;
  String? extractText;
  uploadImage(ImageSource cameraOrGallery) async {
    emit(ImageLoading());
    final pickedImg = await ImagePicker().pickImage(source: cameraOrGallery);
    try {
      if (pickedImg != null) {
        imgPath = File(pickedImg.path);
        imgName = basename(pickedImg.path);
        int random = Random().nextInt(9999999);
        imgName = "$random$imgName";
        extractText = await FlutterTesseractOcr.extractText(imgPath!.path);
        emit(ImageLoadingSuccess());
      } else {
        emit(ImageLoadingFailure());
      }
    } catch (e) {
      print("Error => $e");
    }
  }

  choosePhoto() async {
    await uploadImage(ImageSource.gallery);
  }

  takePhoto() async {
    await uploadImage(ImageSource.camera);
  }
}
