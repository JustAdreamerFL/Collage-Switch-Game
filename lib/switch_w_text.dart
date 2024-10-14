import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchAndText extends StatelessWidget {
  final bool value;
  final dynamic onChanged;
  final String text;
  const SwitchAndText({
    super.key,
    required this.value,
    required this.text,
    required this.onChanged,
  });

  double _getTextWidth(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size.width;
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.w500,
      letterSpacing: 2,
    );
    final textWidth = _getTextWidth(text, textStyle);

    return Row(
      children: [
        CupertinoSwitch(value: value, onChanged: onChanged),
        Container(
          height: 50,
          width: 243,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: const Color.fromARGB(255, 127, 154, 60), width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: textWidth + 70,
                margin: const EdgeInsets.all(2),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Text(
                  text.toUpperCase(),
                  style: textStyle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
