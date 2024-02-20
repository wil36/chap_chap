// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double _kChoiceChipsHeight = 40.0;

class ChipData {
  const ChipData(this.label, [this.iconData]);
  final String label;
  final IconData? iconData;
}

class ChipStyle {
  const ChipStyle(
      {this.backgroundColor,
      this.textStyle,
      this.iconColor,
      this.iconSize,
      this.labelPadding,
      this.elevation});
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Color? iconColor;
  final double? iconSize;
  final EdgeInsetsGeometry? labelPadding;
  final double? elevation;
}

class ChoiceChipMizzup extends StatefulWidget {
  const ChoiceChipMizzup({
    Key? key,
    this.initialOption,
    required this.options,
    required this.onChanged,
    this.selectedChipStyle,
    this.unselectedChipStyle,
    this.chipSpacing,
  }) : super(key: key);

  final String? initialOption;
  final List<ChipData> options;
  final void Function(String?) onChanged;
  final ChipStyle? selectedChipStyle;
  final ChipStyle? unselectedChipStyle;
  final double? chipSpacing;

  @override
  State<ChoiceChipMizzup> createState() => _FlutterFlowChoiceChipsState();
}

class _FlutterFlowChoiceChipsState extends State<ChoiceChipMizzup> {
  String? choiceChipValue;

  @override
  void initState() {
    super.initState();
    choiceChipValue = widget.initialOption ?? widget.options.first.label;
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        height: _kChoiceChipsHeight,
        child: ListView.separated(
          padding: EdgeInsets.zero,
          itemCount: widget.options.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final option = widget.options[index];
            final selected = option.label == choiceChipValue;
            final style = selected
                ? widget.selectedChipStyle!
                : widget.unselectedChipStyle!;
            return ChoiceChip(
              selected: selected,
              onSelected: (isSelected) {
                if (isSelected) {
                  choiceChipValue = option.label;
                  widget.onChanged(choiceChipValue);
                  setState(() {});
                }
              },
              label: Text(
                option.label,
                style: style.textStyle,
              ),
              labelPadding: style.labelPadding,
              avatar: option.iconData != null
                  ? FaIcon(
                      option.iconData,
                      size: style.iconSize,
                      color: style.iconColor,
                    )
                  : null,
              elevation: style.elevation,
              selectedColor:
                  selected ? widget.selectedChipStyle!.backgroundColor : null,
              backgroundColor:
                  selected ? null : widget.unselectedChipStyle!.backgroundColor,
            );
          },
          separatorBuilder: (_, __) => SizedBox(width: widget.chipSpacing),
        ),
      );
}
