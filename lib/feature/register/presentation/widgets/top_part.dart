import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/constants.dart';

class TopPart extends StatelessWidget {
  const TopPart({
    super.key,
    required this.flexValueOfTop,
  });

  final int flexValueOfTop;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexValueOfTop,
    child: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            Assets.juridicalPersonPage,
            fit: BoxFit.fitWidth,
          ),
          Positioned(
            top: (MediaQuery.of(context).size.height/flexValueOfTop)/2.7,
            left: 0,
            right: 0,
            child: FractionallySizedBox(
              widthFactor: 0.5, 
              child: Image.asset(
                Assets.tenderyard,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
