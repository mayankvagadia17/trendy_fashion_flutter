import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helper/Color.dart';
import '../../helper/Constant.dart';

class AppBtn extends StatelessWidget {
  final String? title;
  final VoidCallback? onBtnSelected;
  final bool? paddingRequired;
  final double? height;

  const AppBtn({
    Key? key,
    this.title,
    this.onBtnSelected,
    this.paddingRequired,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Container(
        width: double.infinity,
        height: height ?? 45,
        alignment: FractionalOffset.center,
        decoration: const BoxDecoration(
          color: primaryBrown,
          borderRadius: BorderRadius.all(
            Radius.circular(
              circularBorderRadius10,
            ),
          ),
        ),
        child: Text(
          title!,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: white,
                fontFamily: 'SourceSans',
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
        ),
      ),
      onPressed: () {
        onBtnSelected!();
      },
    );
  }
}
