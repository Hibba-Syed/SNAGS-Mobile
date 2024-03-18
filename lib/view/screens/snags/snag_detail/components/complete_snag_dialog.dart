import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iskaan_inspections_mobile/bloc/snags/snag_detail/snag_detail_cubit.dart';
import 'package:iskaan_inspections_mobile/model/custom_snag_image_model.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/custom_button.dart';
import 'package:iskaan_inspections_mobile/view/widgets/image/network_image_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/text_field_widget.dart';

class CompleteSnagDialog extends StatefulWidget {
  const CompleteSnagDialog({super.key});

  @override
  State<CompleteSnagDialog> createState() => _CompleteSnagDialogState();
}

class _CompleteSnagDialogState extends State<CompleteSnagDialog> {
  final ImagePicker _imagePicker = ImagePicker();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _noteController = TextEditingController();
  final List<CustomSnagImageModel> _selectedFiles = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.info_outline,
              color: AppColors.primary,
              size: 50,
            ),
            UIHelper.verticalSpace(16.0),
            const Text(
              'Are you sure you want to mark this snag as completed?',
              style: AppTextStyles.style16Grey600,
            ),
            UIHelper.verticalSpace(10.0),
            TextFieldWidget(
              controller: _noteController,
              label: 'Add a Note*',
              hint: 'Write note here',
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'required';
                }
                return null;
              },
            ),
            UIHelper.verticalSpace(10.0),
            const Text(
              'Add Images',
              style: AppTextStyles.style16LightGrey400,
            ),
            UIHelper.verticalSpace(8.0),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 4,
              child: ListView.builder(
                itemCount: _selectedFiles.length + 1,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (index == _selectedFiles.length) {
                    return InkWell(
                      onTap: () async {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomButton(
                                    text: 'Choose from Gallery',
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      XFile? pickedImage =
                                          await _imagePicker.pickImage(
                                        source: ImageSource.gallery,
                                      );
                                      if (pickedImage != null) {
                                        File? editedFile =
                                            await editImageAndGetFile(
                                                pickedImage);
                                        if (editedFile != null) {
                                          _selectedFiles.add(
                                            CustomSnagImageModel(
                                                filePath: editedFile.path),
                                          );
                                          setState(() {});
                                        }
                                      }
                                    },
                                  ),
                                  UIHelper.verticalSpace(20.0),
                                  CustomButton(
                                    text: 'Capture Image',
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      XFile? pickedImage =
                                          await _imagePicker.pickImage(
                                        source: ImageSource.camera,
                                      );
                                      if (pickedImage != null) {
                                        File? editedFile =
                                            await editImageAndGetFile(
                                                pickedImage);
                                        if (editedFile != null) {
                                          _selectedFiles.add(
                                            CustomSnagImageModel(
                                                filePath: editedFile.path),
                                          );
                                          setState(() {});
                                        }
                                      }
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.width / 4,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: AppColors.primary,
                          ),
                        ),
                        child: const Icon(
                          Icons.add_a_photo_outlined,
                          color: AppColors.primary,
                        ),
                      ),
                    );
                  }
                  return Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomButton(
                                      text: 'Choose from Gallery',
                                      onPressed: () async {
                                        Navigator.pop(context);
                                        XFile? pickedImage =
                                            await _imagePicker.pickImage(
                                          source: ImageSource.gallery,
                                        );
                                        if (pickedImage != null) {
                                          File? editedFile =
                                              await editImageAndGetFile(
                                                  pickedImage);
                                          if (editedFile != null) {
                                            _selectedFiles[index].filePath =
                                                editedFile.path;
                                            setState(() {});
                                          }
                                        }
                                      },
                                    ),
                                    UIHelper.verticalSpace(20.0),
                                    CustomButton(
                                      text: 'Capture Image',
                                      onPressed: () async {
                                        Navigator.pop(context);
                                        XFile? pickedImage =
                                            await _imagePicker.pickImage(
                                          source: ImageSource.camera,
                                        );
                                        if (pickedImage != null) {
                                          File? editedFile =
                                              await editImageAndGetFile(
                                                  pickedImage);
                                          if (editedFile != null) {
                                            _selectedFiles[index].filePath =
                                                editedFile.path;
                                            setState(() {});
                                          }
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.width / 4,
                          margin: const EdgeInsets.only(right: 10.0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: _selectedFiles[index].filePath?.isNotEmpty ??
                                  false
                              ? Image.file(
                                  File(_selectedFiles[index].filePath!),
                                  fit: BoxFit.cover,
                                )
                              : NetworkImageWidget(
                                  url: _selectedFiles[index].url,
                                ),
                        ),
                      ),
                      Positioned(
                        top: 0.0,
                        right: 6.0,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedFiles.removeAt(index);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(1.0),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.red,
                            ),
                            child: const Icon(
                              Icons.close,
                              color: AppColors.white,
                              size: 12.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            UIHelper.verticalSpace(2.0),
            const Text(
              '• Maximum image size should be 2MB',
              style: AppTextStyles.style10LightGrey400,
            ),
            UIHelper.verticalSpace(20.0),
            Row(
              children: [
                Flexible(
                  child: CustomButton(
                    text: 'Complete',
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        Navigator.pop(context);
                        context.read<SnagDetailCubit>().completeSnag(
                              context,
                              note: _noteController.text,
                              filesPaths: _selectedFiles
                                  .map((e) => e.filePath!)
                                  .toList(),
                            );
                      }
                    },
                  ),
                ),
                UIHelper.horizontalSpace(10.0),
                Flexible(
                  child: CustomButton(
                    text: 'Cancel',
                    invert: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _noteController.dispose();
  }

  Future<File?> editImageAndGetFile(XFile pickedImage) async {
    File? file;
    await convertFileToUint8List(pickedImage.path).then((bytes) async {
      Uint8List? editedImage = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImageEditor(
            image: bytes,
            blurOption: null,
          ),
        ),
      );
      if (editedImage != null) {
        file = await File(pickedImage.path).create();
        file?.writeAsBytesSync(editedImage);
      }
    });
    return file;
  }

  Future<Uint8List> convertFileToUint8List(String path) async {
    Uint8List bytes = await File(path).readAsBytes();
    return bytes;
  }
}
