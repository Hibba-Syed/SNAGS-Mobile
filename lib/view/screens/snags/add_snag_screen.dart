import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iskaan_inspections_mobile/bloc/snags/add_edit_snag/add_edit_snag_cubit.dart';
import 'package:iskaan_inspections_mobile/model/association/association_model.dart';
import 'package:iskaan_inspections_mobile/model/custom_snag_image_model.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/constants/constants.dart';
import 'package:iskaan_inspections_mobile/res/globals.dart';
import 'package:iskaan_inspections_mobile/res/styles/styles.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/widgets/app_bar/appbar_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/button/custom_button.dart';
import 'package:iskaan_inspections_mobile/view/widgets/custom_loader.dart';
import 'package:iskaan_inspections_mobile/view/widgets/dropdown/dropdown_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/image/network_image_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/textfield/text_field_widget.dart';

class AddSnagScreen extends StatefulWidget {
  final Association? community;
  const AddSnagScreen({super.key, this.community});

  @override
  State<AddSnagScreen> createState() => _AddSnagScreenState();
}

class _AddSnagScreenState extends State<AddSnagScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ImagePicker _imagePicker = ImagePicker();
  final List<CustomSnagImageModel> _selectedFiles = [];
  Association? _selectedCommunity;
  String? _selectedRisk;
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _additionalNotesController =
      TextEditingController();
  bool _isCommunityEnabled = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      // Access arguments here
      final arguments = ModalRoute.of(context)?.settings.arguments;
      _selectedCommunity = arguments as Association?;
      if (_selectedCommunity != null) {
        _isCommunityEnabled = false;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Add Snag',
        isNotificationEnabled: false,
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(16.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10.0)),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownWidget<Association>(
                      enabled: _isCommunityEnabled,
                      label: 'Community *',
                      hint: 'Select Community',
                      selectedItem: _selectedCommunity,
                      items: Globals().profileRecord?.associations ?? [],
                      onChanged: (value) {
                        _selectedCommunity = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'required';
                        }
                        return null;
                      },
                      compareFn: (community, item) => community.id == item.id,
                      itemAsString: (community) => community.name ?? '',
                    ),
                    TextFieldWidget(
                      controller: _descriptionController,
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
                      selectedItem: _selectedRisk,
                      items: AppConstants.snagRisks,
                      onChanged: (value) {
                        _selectedRisk = value;
                      },
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'required';
                        }
                        return null;
                      },
                    ),
                    UIHelper.verticalSpace(10.0),
                    TextFieldWidget(
                      controller: _locationController,
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
                    TextFieldWidget(
                      controller: _additionalNotesController,
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
                                                        filePath:
                                                            editedFile.path),
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
                                                        filePath:
                                                            editedFile.path),
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
                                                    await _imagePicker
                                                        .pickImage(
                                                  source: ImageSource.gallery,
                                                );
                                                if (pickedImage != null) {
                                                  File? editedFile =
                                                      await editImageAndGetFile(
                                                          pickedImage);
                                                  if (editedFile != null) {
                                                    _selectedFiles[index]
                                                            .filePath =
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
                                                    await _imagePicker
                                                        .pickImage(
                                                  source: ImageSource.camera,
                                                );
                                                if (pickedImage != null) {
                                                  File? editedFile =
                                                      await editImageAndGetFile(
                                                          pickedImage);
                                                  if (editedFile != null) {
                                                    _selectedFiles[index]
                                                            .filePath =
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
                                  child: _selectedFiles[index]
                                              .filePath
                                              ?.isNotEmpty ??
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
                    CustomButton(
                      text: 'Submit',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (_selectedFiles.isNotEmpty) {
                            /// here i am sending description in title and notes in description because the backend required data in this way
                            context.read<AddEditSnagCubit>().addSnag(
                                  context,
                                  data: {
                                    'association_id': 126,
                                    'risk': _selectedRisk,
                                    'title': _descriptionController.text,
                                    'description':
                                        _additionalNotesController.text,
                                    'location': _locationController.text,
                                  },
                                  filesPaths: _selectedFiles
                                      .map((e) => e.filePath!)
                                      .toList(),
                                );
                          } else {
                            Fluttertoast.showToast(msg: 'Please add image');
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          BlocBuilder<AddEditSnagCubit, AddEditSnagState>(
            builder: (context, state) {
              return Visibility(
                visible: state.isLoading,
                child: const CustomLoader(),
              );
            },
          ),
        ],
      ),
    );
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


