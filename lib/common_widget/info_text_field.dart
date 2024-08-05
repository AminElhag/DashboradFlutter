import 'package:flutter/material.dart';

class InfoTextField extends StatefulWidget {
  const InfoTextField({
    super.key,
    required this.textEditorController,
    required this.hintText,
    required this.inputType,
    required this.validator,
    this.hasPrefixIcon = false,
    this.prefixIcon,
    this.suffixIcon,
    this.hasSuffixIcon = false,
    this.hasSuffixActions = false,
    this.suffixOnIcon,
    this.suffixOffIcon,
    this.width = 300,
  });

  final TextEditingController textEditorController;
  final String hintText;
  final TextInputType inputType;
  final bool hasPrefixIcon;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool hasSuffixIcon;
  final bool hasSuffixActions;
  final IconData? suffixOnIcon;
  final IconData? suffixOffIcon;

  final String? Function(String?) validator;
  final double width;

  @override
  State<InfoTextField> createState() => _InfoTextFieldState();
}

class _InfoTextFieldState extends State<InfoTextField> {
  bool _suffixAction = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        width: widget.width,
        child: TextFormField(
          controller: widget.textEditorController,
          keyboardType: widget.inputType,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade50,
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
            prefixIcon: (!widget.hasPrefixIcon)
                ? const SizedBox()
                : Icon(
                    widget.prefixIcon,
                    color: Colors.black.withAlpha(80),
                    size: 20,
                  ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            suffixIcon: (!widget.hasSuffixIcon)
                ? const SizedBox()
                : (!widget.hasSuffixActions)
                    ? Icon(
                        widget.suffixIcon,
                        color: Colors.black.withAlpha(80),
                        size: 20,
                      )
                    : (_suffixAction)
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                _suffixAction = !_suffixAction;
                              });
                            },
                            icon: Icon(
                              widget.suffixOffIcon,
                              color: Colors.black.withAlpha(80),
                              size: 20,
                            ))
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                _suffixAction = !_suffixAction;
                              });
                            },
                            icon: Icon(
                              widget.suffixOnIcon,
                              color: Colors.black.withAlpha(80),
                              size: 20,
                            )),
          ),
          obscureText: (!widget.hasSuffixActions)?false:!_suffixAction,
          validator: widget.validator,
        ),
      ),
    );
  }
}
