import 'package:boyaci_kapida/constants.dart';
import 'package:flutter/material.dart';

class AppFormDropDownButtonFormField extends StatefulWidget {
  AppFormDropDownButtonFormField({
    super.key, 
    this.customIcon = const Icon(
      Icons.location_city,
      color: Colors.amber,
    ), 
    required this.labelTextInfo, 
    required this.hintTextInfo, 
    required this.items, 
  });

  final String labelTextInfo;
  final String hintTextInfo;
  final Icon customIcon;
  final List<DropdownMenuItem> items;

  @override
  State<AppFormDropDownButtonFormField> createState() => _AppFormDropDownButtonFormFieldState();
}

class _AppFormDropDownButtonFormFieldState extends State<AppFormDropDownButtonFormField> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppTheme.dPadding - 5),
      child: Container(
        height: 60,
        child: DropdownButtonFormField(
          /* If There Is A State There Must Be value: '' */
          icon: Icon(Icons.keyboard_arrow_down_sharp),
          onChanged: (v) {},
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(AppTheme.dPadding / 2),
              ),
              borderSide: BorderSide(
                color: AppTheme.black
              ),
            ),
            hintText: widget.hintTextInfo,
            hintStyle: TextStyle(
              color: AppTheme.amber,
              fontSize: 17,
              fontWeight: FontWeight.w400
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(AppTheme.dPadding / 2),
              ),
              borderSide: BorderSide(
                color: AppTheme.black
              ),
            ),
            labelText: widget.labelTextInfo,
              labelStyle: TextStyle(
                color: AppTheme.black,
                fontSize: 17,
                fontWeight: FontWeight.w400
              ),
            prefixIcon: widget.customIcon,
          ),
          items: [...widget.items],
        ),
      ),
    );
  }
}

class AppFormTextField extends StatelessWidget {
  const AppFormTextField({
    super.key, 
    required this.hintTextInfo, 
    required this.labelTextInfo, 
    this.customIcon = const Icon(
      Icons.location_city,
      color: Colors.amber,
    ),
  });
  final String hintTextInfo;
  final String labelTextInfo;
  final Icon customIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppTheme.dPadding - 5),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppTheme.dPadding / 2),
            ),
            borderSide: BorderSide(
              color: AppTheme.black
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppTheme.dPadding / 2),
            ),
            borderSide: BorderSide(
              color: AppTheme.black
            ),
          ),
          hintText: hintTextInfo,
          hintStyle: const TextStyle(
            color: AppTheme.amber,
            fontSize: 17,
            fontWeight: FontWeight.w400
          ),
          labelText: labelTextInfo,
          labelStyle: const TextStyle(
            color: AppTheme.black,
            fontSize: 17,
            fontWeight: FontWeight.w400
          ),
          prefixIcon: customIcon,
          suffixStyle: const TextStyle(
            color: AppTheme.black
          ),
        ),
      ),
    );
  }
}

class AppFormTextArea extends StatelessWidget {
  const AppFormTextArea({
    super.key, 
    required this.hintTextInfo, 
    required this.customIcon, 
    required this.labelTextInfo,
  });
  final String labelTextInfo;
  final String hintTextInfo;
  final Icon customIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppTheme.dPadding - 5),
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: 3,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppTheme.dPadding / 2),
            ),
            borderSide: BorderSide(
              color: AppTheme.black
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppTheme.dPadding / 2),
            ),
            borderSide: BorderSide(
              color: AppTheme.black
            ),
          ),
          hintText: hintTextInfo,
          hintStyle: TextStyle(
            color: AppTheme.black,
            fontSize: 17,
            fontWeight: FontWeight.w400
          ),
          labelText: labelTextInfo,
            labelStyle: TextStyle(
              color: AppTheme.black,
              fontSize: 17,
              fontWeight: FontWeight.w400
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(bottom: AppTheme.dPadding * 2),
            child: customIcon,
          ),
          suffixStyle: TextStyle(
            color: AppTheme.black
          ),
        ),
      ),
    );
  }
}


