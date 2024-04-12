import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tenderyard/common/constants.dart';
import 'package:tenderyard/feature/app/app_theme/color_utils.dart';
import 'package:tenderyard/feature/app/app_theme/style_utils.dart';
import 'package:tenderyard/feature/register/data/models/register_list_tile_params.dart';

import '../../../app/injection_container.dart';
import '../bloc/bloc.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/login';

  RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _registerBloc = sl<RegisterBloc>();
  final List<RegisterListTileParams> registerListTileParams = [
    RegisterListTileParams(
      title: "Fiziki şəxs",
      description: "Bütün fəaliyyətlərinizi idarə etmək üçün şəxsi hesab.",
      onTapScreen: Screens.registerAsJuridicalPerson,
      leadingIconPath: Assets.individual,
    ),
    RegisterListTileParams(
      title: "Fərdi sahibkar",
      description: "Bütün fəaliyyətlərinizi idarə etmək üçün şəxsi hesab.",
      onTapScreen: Screens.registerAsJuridicalPerson,
      leadingIconPath: Assets.individualOwner,
    ),
    RegisterListTileParams(
      title: "Hüquqi şəxs",
      description:
          "Hüquqi şəxs olaraq fəaliyyətlərinizi idarə etmək üçün şirkət hesabınız.",
      onTapScreen: Screens.registerAsJuridicalPerson,
      leadingIconPath: Assets.juridicalPerson,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _registerBloc,
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {},
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return Scaffold(
              resizeToAvoidBottomInset: true,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      Assets.registerPage,
                      fit: BoxFit.cover,
                      height: 280.h,
                    ),
                    Image.asset(
                      Assets.logo,
                      fit: BoxFit.cover,
                      height: 40.h,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Bizə qoşulun !",
                        style: StyleUtils.boldTitle(context)!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Kim olaraq qeydiyyatdan keçirsiniz ?",
                        style: StyleUtils.bodyMedium(context)!,
                      ),
                    ),
                    Flexible(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 8),
                        itemCount: registerListTileParams.length,
                        itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: state.selectedIndex == index
                                ? ColorUtils.selectedTileColor
                                : ColorUtils.bodyWhiteColor,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 14,
                                offset: const Offset(0, 2),
                              ),
                            ],
                            border: Border.all(
                              color: state.selectedIndex == index
                                  ? ColorUtils.primaryColor
                                  : Colors.transparent,
                            ),
                          ),
                          child: ListTile(
                            splashColor: Colors.transparent,
                            contentPadding: const EdgeInsets.all(8),
                            onTap: () {
                              _registerBloc.add(TileSelectedEvent(index));
                              _navigateToNextScreen(context,
                                  registerListTileParams[index].onTapScreen);
                            },
                            title: Text(
                              registerListTileParams[index].title,
                              style: StyleUtils.boldTitle(context)!.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                              registerListTileParams[index].description,
                            ),
                            titleTextStyle:
                                StyleUtils.bodyRegular(context)!.copyWith(
                              fontSize: 16,
                              color: ColorUtils.bodyPrimaryTextColor,
                            ),
                            leading: Container(
                              width: 50.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: state.selectedIndex == index
                                    ? ColorUtils.primaryColor
                                    : ColorUtils.bodyWhiteColor,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  registerListTileParams[index].leadingIconPath,
                                  colorFilter: ColorFilter.mode(
                                    state.selectedIndex == index
                                        ? ColorUtils.bodyWhiteColor
                                        : ColorUtils.primaryColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "Qeydiyyatdan keçmisiniz ?",
                          style: StyleUtils.bodyMedium(context)!
                              .copyWith(fontSize: 16),
                        ),
                        Text(
                          " Giriş edin",
                          style: StyleUtils.bodyMedium(context)!.copyWith(
                              fontSize: 16,
                              color: ColorUtils.primaryColor,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context, String onTapScreen) {
    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.pushNamed(context, onTapScreen);
    });
  }
}
