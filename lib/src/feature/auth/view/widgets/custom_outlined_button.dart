import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      minWidth: MediaQuery.of(context).size.width,
      height: 48,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black45),
        borderRadius: BorderRadius.circular(10),
      ),
      disabledColor: CupertinoColors.quaternaryLabel,
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black45,
        ),
      ),
    );
  }
}
