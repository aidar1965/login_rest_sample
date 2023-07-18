import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_rest_sample/presentation/theme/context_extension.dart';

import '../values/palette.dart';
import '../values/values.dart';

class CommonAppBar<T> extends StatefulWidget
    implements ObstructingPreferredSizeWidget {
  const CommonAppBar({
    Key? key,
    this.returnValue,
    this.title,
  })  : preferredSize = const Size.fromHeight(Values.appbarHeight),
        super(key: key);

  final T? returnValue;

  // заголовок (опционально)
  final String? title;

  // ---------------------------------------------------------------------------
  @override
  final Size preferredSize;

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }
}

// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
class _CommonAppBarState<T> extends State<CommonAppBar<T>> {
  // отступ сверху у всех элементов аппбара
  // чтобы визуально было красиво )
  static const _topPaddingSize = 8.0;
  static const _topPaddingInsets = EdgeInsets.only(top: _topPaddingSize);

  // ---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      border: const Border(bottom: BorderSide(color: Colors.transparent)),
      middle: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: widget.title != null
            ? Padding(
                padding: _topPaddingInsets,
                child: Text(
                  widget.title!,
                  maxLines: 2,
                  style: context.style15w400body?.copyWith(
                    color: Palette.text,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            : null,
      ),
      backgroundColor: Palette.whiteBackground,
      automaticallyImplyLeading: false,
    );
  }
}

// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
class _BackButton<T> extends StatelessWidget {
  const _BackButton({Key? key, this.resultValue}) : super(key: key);

  final T? resultValue;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        Navigator.of(context).pop(resultValue);
      },
      child: const SizedBox.square(
        dimension: 42,
        child: Center(
          child: Icon(
            Icons.chevron_left,
            size: 20,
            color: Palette.textLight,
          ),
        ),
      ),
    );
  }
}
