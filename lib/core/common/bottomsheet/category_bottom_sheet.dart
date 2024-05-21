import 'package:flutter/material.dart';
import 'package:tasky/core/styles/colors/colors_light.dart';

class CagegoryModalBottomSheet {
  CagegoryModalBottomSheet._();
  static void showModalCategoryBottomSheet({
    required BuildContext context,
    required Widget widget,
    Color? backgroundColor,
    VoidCallback? whencompleted,
  }) =>
      showModalBottomSheet<dynamic>(
        context: context,
        backgroundColor: backgroundColor ?? ColorsLight.blueLight,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        barrierColor: Colors.transparent,
        builder: (context) => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              padding:const EdgeInsets.all(16),
              child: widget,
            ),
          ),
        ),
      ).then((value) {
        whencompleted?.call();
      });
}
