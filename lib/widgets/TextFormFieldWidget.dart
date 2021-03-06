import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String labelText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final bool isPassword;

  const TextFormFieldWidget({
    this.labelText,
    this.onSaved,
    this.validator,
    this.isPassword,
  });

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  //--------------------------------variables-----------------------------------
  bool _obscureText = true;

  //----------------------------------build-------------------------------------

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'beINNormal',
            fontSize: 14.0,
          ),
          obscureText: widget.isPassword ? _obscureText : false,
          onSaved: widget.onSaved,
          validator: widget.validator,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 0.5,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
            ),
            filled: true,
            labelText: widget.labelText,
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            suffixIcon: !widget.isPassword
                ? null
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
