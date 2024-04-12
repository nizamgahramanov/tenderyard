import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tenderyard/common/constants.dart';
import 'package:tenderyard/feature/app/app_theme/color_utils.dart';
import 'package:tenderyard/feature/app/app_theme/style_utils.dart';
import 'package:tenderyard/feature/app/injection_container.dart';
import 'package:tenderyard/feature/register/data/models/text_form_field_params.dart';
import 'package:tenderyard/feature/register/presentation/bloc/bloc.dart';
import 'package:tenderyard/feature/register/presentation/widgets/custom_icon.dart';
import 'package:tenderyard/feature/register/presentation/widgets/location.dart';
import 'package:tenderyard/feature/register/presentation/widgets/shadow_text_form_field.dart';

class BottomPart extends StatefulWidget {
  const BottomPart({
    super.key,
    required this.flexValueOfBottom,
  });

  final int flexValueOfBottom;

  @override
  State<BottomPart> createState() => _BottomPartState();
}

class _BottomPartState extends State<BottomPart> {
  final List<FieldParams> textFormFieldParams = [
    FieldParams(
        id: 1,
        title: "Ad*",
        hintText: "Nizam",
        focusNode: FocusNode(),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.name,
        type: FieldType.textFormField),
    FieldParams(
        id: 2,
        title: "E-mail",
        hintText: "tenderyard@gmail.com",
        focusNode: FocusNode(),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        type: FieldType.textFormField),
    FieldParams(
        id: 3,
        title: "Telefon nömrəsi*",
        hintText: "050-000-00-00",
        focusNode: FocusNode(),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.phone,
        type: FieldType.textFormField),
    FieldParams(
      id: 4,
      title: "Faktiki ünvan*",
      hintText: "Babək prospekti 104",
      focusNode: FocusNode(),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.streetAddress,
      type: FieldType.textFormField,
      trailingIcon: const Location(),
    ),
    FieldParams(
      id: 5,
      title: "VÖEN",
      hintText: "00-000-00-00",
      focusNode: FocusNode(),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      type: FieldType.textFormField,
    ),
    FieldParams(
      id: 6,
      title: "Fəaliyyət sahəsi*",
      focusNode: FocusNode(),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      dropdownItems: ["Elektronika", "Fizika", "Komputer"],
      type: FieldType.dropdown,
      trailingIcon: const CustomIcon(),
    ),
    FieldParams(
      id: 7,
      title: "Maraqlandığınız kateqoriyalar*",
      focusNode: FocusNode(),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      dropdownItems: ["Elektronika", "Fizika", "Komputer"],
      type: FieldType.dropdown,
      trailingIcon: const CustomIcon(),
    ),
    FieldParams(
      id: 8,
      title: "Logo",
      focusNode: FocusNode(),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      type: FieldType.container,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final registerBloc = sl.get<RegisterBloc>();
    return BlocProvider(
      create: (context) => registerBloc,
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Expanded(
            flex: widget.flexValueOfBottom,
            child: Form(
              child: ListView.builder(
                itemCount: textFormFieldParams.length,
                padding: EdgeInsets.only(
                  left: 16.w,
                  top: 64.h,
                  right: 16.w,
                ),
                itemBuilder: (context, index) {
                  final fieldParam = textFormFieldParams[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            textFormFieldParams[index].title,
                            style: StyleUtils.bodyRegular(context)!.copyWith(
                                color: ColorUtils.secondaryColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (fieldParam.type == FieldType.textFormField)
                          Container(
                            decoration: state.selectedFieldIndex == index
                                ? BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  )
                                : null,
                            child: ShadowTextFormField(
                              focusNode: textFormFieldParams[index].focusNode!,
                              initialValue:
                                  state.fieldTexts[index.toString()] ?? '',
                              style: const TextStyle(
                                  color: ColorUtils.bodySecondaryTextColor),
                              decoration: InputDecoration(
                                filled: true,
                                hintText: textFormFieldParams[index].hintText,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8.h, horizontal: 12.w),
                                hintStyle:
                                    StyleUtils.bodyRegular(context)!.copyWith(
                                  color: ColorUtils.tertiaryColor,
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorUtils.tertiaryColor,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorUtils.primaryColor,
                                    width: 1,
                                  ),
                                ),
                                suffixIcon: state.fieldTexts.containsKey(
                                            textFormFieldParams[index].id) &&
                                        state
                                            .fieldTexts[
                                                textFormFieldParams[index].id]!
                                            .isNotEmpty
                                    ? IconButton(
                                        icon: const Icon(Icons.clear),
                                        onPressed: () {
                                          registerBloc.add(
                                            UpdateFieldEvent(
                                              textFormFieldParams[index].id,
                                              '',
                                            ),
                                          );
                                        },
                                      )
                                    : textFormFieldParams[index].trailingIcon,
                                suffixIconColor: ColorUtils.tertiaryColor,
                              ),
                              textInputAction:
                                  textFormFieldParams[index].textInputAction,
                              keyboardType:
                                  textFormFieldParams[index].keyboardType,
                              onChanged: (value) {
                                registerBloc.add(
                                  UpdateFieldEvent(
                                    textFormFieldParams[index].id,
                                    value,
                                  ),
                                );
                              },
                              /* onTap: () =>
                                  registerBloc.add(FieldSelecteEvent(index)), */
                            ),
                          ),
                        if (fieldParam.type == FieldType.dropdown)
                          Container(
                            decoration: state.selectedFieldIndex == index
                                ? BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  )
                                : null,
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                filled: true,
                                hintText: textFormFieldParams[index].hintText,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 8.h,
                                  horizontal: 12.w,
                                ),
                                hintStyle:
                                    StyleUtils.bodyRegular(context)!.copyWith(
                                  color: ColorUtils.tertiaryColor,
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorUtils.tertiaryColor,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorUtils.primaryColor,
                                    width: 1,
                                  ),
                                ),
                              ),
                              value: textFormFieldParams[index]
                                  .dropdownItems!
                                  .first,
                              items: textFormFieldParams[index]
                                  .dropdownItems!
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: StyleUtils.bodyRegular(context)!
                                        .copyWith(
                                      color: ColorUtils.tertiaryColor,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                textFormFieldParams[index]
                                    .dropdownItems!
                                    .first = newValue!;
                                registerBloc.add(
                                  UpdateFieldEvent(
                                    textFormFieldParams[index].id,
                                    newValue,
                                  ),
                                );
                              },
                              icon: textFormFieldParams[index].trailingIcon,
                            ),
                          ),
                        if (fieldParam.type == FieldType.container)
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SvgPicture.asset(Assets.downloadFieldAround),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(Assets.download),
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                  Text(
                                    "Faylı buradan əlavə edin",
                                    style: StyleUtils.bodyRegular(context)!
                                        .copyWith(
                                            color: ColorUtils.tertiaryColor,
                                            fontSize: 14,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor:
                                                ColorUtils.tertiaryColor,
                                            fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Icon get _buildIcon {
    return const Icon(
      Icons.keyboard_arrow_down,
      color: ColorUtils.tertiaryColor,
    );
  }

  Widget get _buildLocation {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: -2,
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: SvgPicture.asset(
            Assets.pin,
          ),
        ),
        Positioned(
          top: 6.h,
          child: Image.asset(
            Assets.map,
            fit: BoxFit.cover,
            height: 25,
            width: 33,
          ),
        ),
        Positioned(
          top: 8.h,
          child: SvgPicture.asset(Assets.location),
        ),
      ],
    );
  }
}
