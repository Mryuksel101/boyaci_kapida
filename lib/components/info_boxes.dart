import 'package:boyaci_kapida/constants.dart';
import 'package:flutter/material.dart';

Widget renderInfoUI(String text1, String txt2) {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.dPadding - 12),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.amber,
          borderRadius: const BorderRadius.all(
            Radius.circular(AppTheme.dPadding / 2),
          ),
          border: Border.all(
            color: AppTheme.black,
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppTheme.black.withOpacity(0.5),
              offset: const Offset(1.1, 1.1),
              blurRadius: 10.0
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: AppTheme.dPadding - 2, 
            right: AppTheme.dPadding - 2, 
            top: AppTheme.dPadding - 8, 
            bottom: AppTheme.dPadding - 8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                text1,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  letterSpacing: 0.27,
                  color: AppTheme.black,
                ),
              ),
              Text(
                txt2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  letterSpacing: 0.27,
                  color: AppTheme.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  