import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemicates_machine_task/src/feature/auth/controller/auth_controller.dart';
import 'package:provider/provider.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (context, value, child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.red.withOpacity(0.15),
                spreadRadius: 5,
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
            ],
          ),
          child: MaterialButton(
            elevation: 0,
            minWidth: MediaQuery.of(context).size.width,
            height: 48,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: CupertinoColors.systemBrown,
            disabledColor: CupertinoColors.quaternaryLabel,
            onPressed: onPressed,
            child: value.isLoading
                ? const CupertinoActivityIndicator(color: Colors.white)
                : Text(
                    text,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
