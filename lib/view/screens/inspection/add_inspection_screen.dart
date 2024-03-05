import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iskaan_inspections_mobile/bloc/inspection/add_edit/add_edit_inspection_cubit.dart';
import 'package:iskaan_inspections_mobile/model/association/association_model.dart';
import 'package:iskaan_inspections_mobile/model/inspection/inspection_template_response_model.dart';
import 'package:iskaan_inspections_mobile/res/constants/app_colors.dart';
import 'package:iskaan_inspections_mobile/res/globals.dart';
import 'package:iskaan_inspections_mobile/view/helper/ui_helper.dart';
import 'package:iskaan_inspections_mobile/view/screens/inspection/components/inspection_category_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/app_bar/appbar_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/custom_loader.dart';
import 'package:iskaan_inspections_mobile/view/widgets/dropdown/dropdown_widget.dart';
import 'package:iskaan_inspections_mobile/view/widgets/empty_widget.dart';

class AddInspectionScreen extends StatefulWidget {
  const AddInspectionScreen({super.key});

  @override
  State<AddInspectionScreen> createState() => _AddInspectionScreenState();
}

class _AddInspectionScreenState extends State<AddInspectionScreen> {
  Association? _selectedCommunity;
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
        context
            .read<AddEditInspectionCubit>().onChangeCommunityId(_selectedCommunity?.id);
        context
            .read<AddEditInspectionCubit>()
            .getInspectionTemplate();
        context
            .read<AddEditInspectionCubit>()
            .getInspectors(communityId: _selectedCommunity!.id!);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Add Inspection',
        isNotificationEnabled: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownWidget<Association>(
              enabled: _isCommunityEnabled,
              hint: 'Select a Community',
              selectedItem: _selectedCommunity,
              items: Globals().profileRecord?.associations ?? [],
              itemAsString: (community) => community.name ?? '',
              compareFn: (community, item) => community.id == item.id,
              onChanged: (value) {
                _selectedCommunity = value;
                if (value?.id != null) {
                  context
                      .read<AddEditInspectionCubit>().onChangeCommunityId(value?.id);
                  context
                      .read<AddEditInspectionCubit>()
                      .getInspectionTemplate();
                  context
                      .read<AddEditInspectionCubit>()
                      .getInspectors(communityId: value!.id!);
                }
              },
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.lightGrey,
              ),
            ),
            UIHelper.verticalSpace(10.0),
            Expanded(
              child:
                  BlocBuilder<AddEditInspectionCubit, AddEditInspectionState>(
                builder: (ctx, state) {
                  if (state.isLoading == true) {
                    return const CustomLoader();
                  }
                  if (state.inspectionTemplateRecord?.categories?.isEmpty ??
                      true) {
                    return const EmptyWidget(
                      text: 'No Categories found',
                    );
                  }
                  return ListView.separated(
                    itemCount:
                        state.inspectionTemplateRecord?.categories?.length ?? 0,
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      InspectionTemplateCategory? item =
                          state.inspectionTemplateRecord?.categories?[index];
                      return InspectionCategoryWidget(
                        communityId:
                            state.inspectionTemplateRecord!.associationId!,
                        inspectors: state.inspectors,
                        inspectionTemplateCategory: item!,
                        onSavePressed: (formData) async {
                          await context
                              .read<AddEditInspectionCubit>()
                              .addInspection(context, data: formData);
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return UIHelper.verticalSpace(16.0);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
