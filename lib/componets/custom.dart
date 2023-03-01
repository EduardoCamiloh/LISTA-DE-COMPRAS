import 'package:flutter/material.dart';

class Custom extends StatefulWidget {
  final IconData icon;
  final String label;
  final String helperText;
  final bool isSecrety;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;

  const Custom({
    super.key,
    required this.icon,
    required this.label,
    this.isSecrety = false,
    required this.helperText,
    this.validator,
    this.controller,
    ed,
    this.textInputAction,
  });

  @override
  State<Custom> createState() => _CustomState();
}

class _CustomState extends State<Custom> {
  bool isObscure = false;
  @override
  void initState() {
    super.initState();
    isObscure = widget.isSecrety;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 15,
      ),
      child: TextFormField(
        textInputAction: widget.textInputAction,
        validator: widget.validator,
        controller: widget.controller,
        obscureText: isObscure,
        decoration: InputDecoration(
          suffixIcon: widget.isSecrety
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: Icon(
                    isObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : null,
          prefixIcon: Icon(widget.icon),
          isDense: true,
          border: OutlineInputBorder(),
          labelText: widget.label,
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          helperText: widget.helperText,
          helperStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
