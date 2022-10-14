import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:recesslibpjt/ignorethese/core/constants/app_colors.dart';
import 'package:recesslibpjt/ignorethese/products/component/custom_slider.dart';

class SliderColumnWidget extends StatefulWidget {
  final String text;
  final double num;
  const SliderColumnWidget({
    Key? key,
    required this.text,
    required this.num,
  }) : super(key: key);

  @override
  State<SliderColumnWidget> createState() => _SliderColumnWidgetState();
}

class _SliderColumnWidgetState extends State<SliderColumnWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.text,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          width: context.dynamicWidth(0.02),
        ),
        CustomSlider(
          percentage: widget.num,
        ),
      ],
    );
  }
}
