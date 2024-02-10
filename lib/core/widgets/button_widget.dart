import 'package:flutter/material.dart';
import 'package:movieapp/core/styles/colors.dart';

/// Widget that renders a [Button] with transparent or fill background
/// Exposes [onPressed] function
class ButtonWidget extends StatefulWidget {
  final void Function()? onPressed;
  final String text;
  final TextStyle? textStyle;
  final Color? color;
  final EdgeInsetsGeometry margin;
  final bool isLoading;
  final ButtonType buttonType;
  final dynamic icon;
  final double height;
  final double? width;
  final double radius;
  final bool expand;

  const ButtonWidget(
      {Key? key,
        this.onPressed,
        required this.text,
        this.textStyle,
        this.color,
        this.margin = EdgeInsets.zero,
        required this.buttonType,
        this.isLoading = false,
        this.icon,
        this.width,
        this.expand = true,
        this.radius = 12.0,
        this.height = 50.0})
      : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  // LoadingState buttonLoadingState = LoadingState.loaded;

  // bool get isButtonLoadingState => buttonLoadingState == LoadingState.loading;

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        backgroundColor: MaterialStateProperty.all(getBackgroundColor()),
        foregroundColor: MaterialStateProperty.all(getForegroundColor()),
        side: MaterialStateProperty.all(
          BorderSide(
            width: 2,
              color: widget.color ?? Theme.of(context).colorScheme.onPrimaryContainer),
        ),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).colorScheme.onPrimaryContainer),
          borderRadius: BorderRadius.circular(widget.radius),
        )));

    return Container(
        height: widget.height,
        margin: widget.margin,
        width: widget.width,
        //   width: width ?? (expand ? double.infinity : null),
        child: ElevatedButton.icon(
            icon: widget.icon ?? const SizedBox(),
            style: buttonStyle,
            onPressed: () async {
              // setState(() {
              //   buttonLoadingState = LoadingState.loading;
              // });

              widget.onPressed!();

              // setState(() {
              //   buttonLoadingState = LoadingState.loaded;
              // });
            },
            label: widget.isLoading
                ? SizedBox(
              height: 30.0,
              width: 30.0,
              child: CircularProgressIndicator(
                color: getProgressIndicatorColor(),
              ),
            )
                : Text(
              widget.text,
              style: widget.textStyle,
              textAlign: TextAlign.center,
            )));
  }

  getForegroundColor() {
    return widget.buttonType == ButtonType.fill
        ? Colors.white
        : widget.color ?? Theme.of(context).colorScheme.onPrimaryContainer;
  }

  getBackgroundColor() {
    return widget.buttonType == ButtonType.transparent
        ? Colors.transparent
        : widget.buttonType == ButtonType.white
        ? Colors.transparent
        : widget.buttonType == ButtonType.fill
        ? widget.color ?? Theme.of(context).colorScheme.onPrimaryContainer
        : Colors.white;
  }

  getProgressIndicatorColor() {
    return widget.buttonType == ButtonType.fill
        ? Colors.white
        : (widget.color ?? AppColors.primaryColor);
  }
}

enum ButtonType { transparent, fill, white }
