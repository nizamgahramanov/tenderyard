import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tenderyard/common/constants.dart';
import 'package:tenderyard/feature/app/app_theme/color_utils.dart';
import 'package:tenderyard/feature/app/app_theme/style_utils.dart';
import 'package:tenderyard/feature/register/data/models/register_list_tile_params.dart';
import 'package:tenderyard/feature/register/presentation/widgets/bottom_part.dart';
import 'package:tenderyard/feature/register/presentation/widgets/intersection_part.dart';
import 'package:tenderyard/feature/register/presentation/widgets/top_part.dart';

import '../../../app/injection_container.dart';
import '../bloc/bloc.dart';

class JuridicalPersonScreen extends StatefulWidget {
  static const routeName = '/login';

  JuridicalPersonScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<JuridicalPersonScreen> createState() => _JuridicalPersonScreenState();
}

class _JuridicalPersonScreenState extends State<JuridicalPersonScreen> {
  final _registerBloc = sl<RegisterBloc>();
  final List<RegisterListTileParams> registerListTileParams = [
    RegisterListTileParams(
      title: "Fiziki şəxs",
      description: "Bütün fəaliyyətlərinizi idarə etmək üçün şəxsi hesab.",
      onTapScreen: Screens.registerAsIndividual,
      leadingIconPath: Assets.individual,
    ),
    RegisterListTileParams(
      title: "Fərdi sahibkar",
      description: "Bütün fəaliyyətlərinizi idarə etmək üçün şəxsi hesab.",
      onTapScreen: Screens.registerAsIndividualOwner,
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
              body: LayoutBuilder(
                builder: (context, constraints) {
                  double intersectionHeight = 100.0;
                  int flexValueOfTop = 6;
                  int flexValueOfBottom = 11;
                  double topPosition = (constraints.maxHeight *
                          flexValueOfTop /
                          (flexValueOfTop + flexValueOfBottom)) -
                      intersectionHeight / 2;
                  return Stack(
                    children: [
                      Column(
                        children: [
                          TopPart(
                            flexValueOfTop: flexValueOfTop,
                          ),
                          BottomPart(
                            flexValueOfBottom: flexValueOfBottom,
                          ),
                          SizedBox(
                            height: 72.h,
                          )
                        ],
                      ),
                      Positioned(
                        top: topPosition-30,
                        left: 0,
                        right: 0,
                        child: IntersectionPart(
                          intersectionHeight: intersectionHeight,
                        ),
                      ),
                    ],
                  );
                },
              ),
              floatingActionButton: GestureDetector(
                onTap: () =>
                    _registerBloc..add(RegisterAsJuridicalPersonClicked()),
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: ColorUtils.primaryColor,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(1, 3),
                      ),
                    ],
                  ),
                  height: 43,
                  margin: const EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      "Qeydiyyatı tamamla",
                      style: StyleUtils.bodyRegular(context)!.copyWith(
                        color: ColorUtils.bodyWhiteColor,
                      ),
                    ),
                  ),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
            );
          },
        ),
      ),
    );
  }
}
