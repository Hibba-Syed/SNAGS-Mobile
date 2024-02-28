import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_editor_plus/options.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/constants/constants.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/widgets/app_bar/appbar_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/custom_button.dart';
import 'package:iskaan_inspections_mobile/view/widgets/dropdown/dropdown_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/text_field_widget.dart';

class AddSnagScreen extends StatefulWidget {
  AddSnagScreen({super.key});

  @override
  State<AddSnagScreen> createState() => _AddSnagScreenState();
}

class _AddSnagScreenState extends State<AddSnagScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ImagePicker _imagePicker = ImagePicker();
  final List<File> _selectedFiles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Add Snag',
        isNotificationEnabled: false,
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10.0)),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownWidget<String>(
                  label: 'Community *',
                  hint: 'Select Community',
                  selectedItem: null,
                  items: const ['Hello', 'To', 'The', 'Future'],
                  onChanged: (value) {},
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'required';
                    }
                    return null;
                  },
                ),
                TextFieldWidget(
                  label: 'Description *',
                  hint: 'Add a description',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'required';
                    }
                    return null;
                  },
                ),
                UIHelper.verticalSpace(10.0),
                DropdownWidget<String>(
                  label: 'Risk *',
                  hint: 'Select Risk',
                  selectedItem: null,
                  items: AppConstants.snagRisks,
                  onChanged: (value) {},
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'required';
                    }
                    return null;
                  },
                ),
                UIHelper.verticalSpace(10.0),
                TextFieldWidget(
                  label: 'Location *',
                  hint: 'Write the location of the snag',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'required';
                    }
                    return null;
                  },
                ),
                UIHelper.verticalSpace(10.0),
                const TextFieldWidget(
                  label: 'Additional Notes',
                  hint: 'Give additional notes for the snag',
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
                      itemCount: _selectedFiles.length+1,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if(index==_selectedFiles.length){
                          return InkWell(
                            onTap: () async {
                              XFile? pickedImage = await _imagePicker.pickImage(
                                source: ImageSource.camera,
                              );
                              if(pickedImage!=null){
                                final bytes = await File(pickedImage.path).readAsBytes();
                                // final img.Image? image = img.decodeImage(bytes);
                                final Uint8List? editedImage = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>  ImageEditor(
                                      image: bytes,
                                      imagePickerOption: const ImagePickerOption(
                                      ),
                                    ),
                                  ),
                                );
                                if(editedImage!=null){
                                  final tempDir = await getTemporaryDirectory();
                                  File file = await File('${tempDir.path}/image.png').create();
                                  file.writeAsBytesSync(editedImage);
                                  _selectedFiles.add(file,);
                                  setState(() {
                                  });
                                }
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width/4,
                              height: MediaQuery.of(context).size.width/4,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: AppColors.primary,
                                ),
                              ),
                              child: const Icon(Icons.add_a_photo_outlined,color: AppColors.primary,),
                            ),
                          );
                        }
                        return Container(
                          width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.width / 4,
                          margin: const EdgeInsets.only(right: 10.0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: AppColors.primary,
                            ),
                          ),
                          child: Image.file(
                            _selectedFiles[index],
                            fit: BoxFit.fill,
                          ),
                        );
                      }),
                ),
                // CustomButton(
                //   text: 'Add Images',
                //   invert: true,
                //   icon: const Icon(
                //     Icons.photo_outlined,
                //     color: AppColors.primary,
                //   ),
                //   onPressed: () async {
                //     XFile? pickedImage = await _imagePicker.pickImage(
                //       source: ImageSource.camera,
                //     );
                //     if(pickedImage!=null){
                //       final bytes = await File(pickedImage.path).readAsBytes();
                //       // final img.Image? image = img.decodeImage(bytes);
                //       final Uint8List editedImages = await Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) =>  ImageEditor(
                //             image: bytes,
                //             imagePickerOption: const ImagePickerOption(
                //             ),
                //           ),
                //         ),
                //       );
                //       print(editedImages);
                //     }
                //   },
                // ),
                UIHelper.verticalSpace(2.0),
                const Text(
                  '• Maximum image size should be 2MB',
                  style: AppTextStyles.style10LightGrey400,
                ),
                UIHelper.verticalSpace(20.0),
                CustomButton(
                  text: 'Submit',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
