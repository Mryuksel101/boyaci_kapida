import 'package:boyaci_kapida/constants.dart';
import 'package:flutter/material.dart';

class AppFormButton extends StatelessWidget {
  const AppFormButton({
    super.key, 
    required this.buttonTitle,
    required this.fontSizeTitle, 
    required this.width, 
    required this.fontWeightTitle, 
  });

  final String buttonTitle;
  final FontWeight fontWeightTitle;
  final double fontSizeTitle;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppTheme.dPadding),
      child: Container(
        width: width,
        height: 48,
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.black,
            borderRadius: const BorderRadius.all(
              Radius.circular(AppTheme.dPadding / 2)
            ),
            border: Border.all(
              color: AppTheme.black
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppTheme.black.withOpacity(0.5),
                offset: const Offset(1.1, 1.1),
                blurRadius: 10.0
              ),
            ],
          ),
          child: Center(
            child: Text(
              buttonTitle,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: fontWeightTitle,
                fontSize: fontSizeTitle,
                letterSpacing: 0.0,
                color: AppTheme.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}