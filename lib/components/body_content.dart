import 'package:flutter/material.dart';
import 'package:spend_app/style/style.dart';

class BodyContent extends StatelessWidget {
  const BodyContent({
    Key? key,
    required this.title,
    this.child,
    this.isFloatButton = true,
    this.floatButtonOnClick,
    this.floatButtonColor,
    this.floatButtonIcon,
    this.floatButtonBg,
  }) : super(key: key);
  final String title;
  final Widget? child;
  final bool isFloatButton;
  final Function? floatButtonOnClick;
  final Color? floatButtonColor;
  final Color? floatButtonBg;
  final IconData? floatButtonIcon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(
            Icons.keyboard_arrow_left_rounded,
            size: 35,
          ),
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
          onPressed: () {
            Navigator.maybePop(context);
          },
        ),
        backgroundColor: const Color(0xFFF6F8FA),
      ),
      floatingActionButton: isFloatButton
          ? SizedBox(
              height: 50,
              width: 50,
              child: TextButton(
                onPressed: () {
                  if (floatButtonOnClick != null) {
                    floatButtonOnClick!();
                  }
                },
                child: Icon(
                  floatButtonIcon ?? Icons.post_add_rounded,
                  color: floatButtonColor ?? Colors.white,
                ),
                style: TextButton.styleFrom(
                    backgroundColor: floatButtonBg ?? const Color(0xFF3167FB),
                    shape: const StadiumBorder()),
              ),
            )
          : null,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                height: 65,
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
            Expanded(
                child: Container(
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: child,
              decoration: boxDecoration,
            ))
          ],
        ),
      ),
    );
  }
}
