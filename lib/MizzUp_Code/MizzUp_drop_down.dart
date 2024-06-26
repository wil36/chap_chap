// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MizzUpDropDown extends StatefulWidget {
  const MizzUpDropDown({
    Key? key,
    this.initialOption,
    required this.options,
    required this.onChanged,
    this.icon,
    this.width,
    this.height,
    this.fillColor,
    this.textStyle,
    this.elevation,
    this.borderWidth,
    this.borderRadius,
    this.borderColor,
    this.margin,
    this.hidesUnderline = false,
  }) : super(key: key);

  final String? initialOption;
  final List<String> options;
  final Function(String?) onChanged;
  final Widget? icon;
  final double? width;
  final double? height;
  final Color? fillColor;
  final TextStyle? textStyle;
  final double? elevation;
  final double? borderWidth;
  final double? borderRadius;
  final Color? borderColor;
  final EdgeInsetsGeometry? margin;
  final bool hidesUnderline;

  @override
  State<MizzUpDropDown> createState() => _MizzUpDropDownState();
}

class _MizzUpDropDownState extends State<MizzUpDropDown> {
  String? dropDownValue;
  List<String> get effectiveOptions =>
      widget.options.isEmpty ? ['[Option]'] : widget.options;

  @override
  void initState() {
    super.initState();
    dropDownValue = widget.initialOption ?? widget.options.first;
  }

  @override
  Widget build(BuildContext context) {
    final dropdownWidget = DropdownButton<String>(
      value: effectiveOptions.contains(dropDownValue) ? dropDownValue : null,
      items: effectiveOptions
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                  style: widget.textStyle,
                ),
              ))
          .toList(),
      elevation: widget.elevation!.toInt(),
      onChanged: (value) {
        dropDownValue = value;
        widget.onChanged(value);
      },
      icon: widget.icon,
      isExpanded: true,
      dropdownColor: widget.fillColor,
    );
    final childWidget = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 28),
        border: Border.all(
          color: widget.borderColor!,
          width: widget.borderWidth!,
        ),
        color: widget.fillColor,
      ),
      child: Padding(
        padding: widget.margin!,
        child: widget.hidesUnderline
            ? DropdownButtonHideUnderline(child: dropdownWidget)
            : dropdownWidget,
      ),
    );
    if (widget.height != null || widget.width != null) {
      return SizedBox(
          width: widget.width, height: widget.height, child: childWidget);
    }
    return childWidget;
  }
}
