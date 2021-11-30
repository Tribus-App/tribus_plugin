// ignore_for_file: must_be_immutable

library church_plugin;
import 'package:flutter/material.dart';

class MNButton extends StatelessWidget {
  final String? labelText;
  final bool? autoFocus;
  final bool? enable;
  final bool? center;
  final bool? outline;
  final bool? secondary;
  final bool? hideRadius;
  final bool? mainButton;
  final bool? enableFeedback;
  final Function()? onPressed;
  final Function()? onLongPressed;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  Color? color;
  final Color? foregroundColor;
  final Widget? child;
  final double? elevation;
  final double? radius;
  final double? height;
  final Size? minimumSize;
  final TextStyle? textStyle;
  final IconData? leading;
  final IconData? trailing;

  MNButton({
    Key? key,
    this.labelText,
    this.autoFocus = false,
    this.hideRadius = false,
    this.enable = true,
    this.enableFeedback = false,
    this.center = true,
    this.onPressed,
    this.onLongPressed,
    this.margin,
    this.foregroundColor,
    this.padding,
    this.child,
    this.elevation = 0,
    this.radius = 10,
    this.height = 50,
    this.minimumSize,
    this.textStyle,
    this.leading,
    this.trailing,
  })  : outline = false,
        mainButton = true,
        secondary = false,
        color = null,
        super(key: key);

  MNButton.secondary({
    Key? key,
    this.labelText,
    this.autoFocus = false,
    this.hideRadius = false,
    this.enable = true,
    this.enableFeedback = false,
    this.center = true,
    this.onPressed,
    this.onLongPressed,
    this.margin,
    this.padding,
    this.foregroundColor,
    this.color,
    this.child,
    this.elevation = 0,
    this.radius = 10,
    this.height = 50,
    this.minimumSize,
    this.textStyle,
    this.leading,
    this.trailing,
  })  : outline = false,
        mainButton = false,
        secondary = true,
        super(key: key);

  MNButton.outline({
    Key? key,
    this.labelText,
    this.autoFocus = false,
    this.hideRadius = false,
    this.enable = true,
    this.enableFeedback = false,
    this.center = true,
    this.onPressed,
    this.onLongPressed,
    this.margin,
    this.padding,
    this.color,
    this.foregroundColor,
    this.child,
    this.elevation = 0,
    this.radius = 10,
    this.height = 50,
    this.minimumSize,
    this.textStyle,
    this.leading,
    this.trailing,
  })  : outline = true,
        mainButton = false,
        secondary = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if(color == null) {
      color = Theme.of(context).colorScheme.secondary;
    }
    return Container(
      key: key,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            hideRadius ?? false
              ? 0 
              : radius ?? 0,
          ),
        ),
        color: Colors.transparent,
      ),
      child: ElevatedButton(
        autofocus: autoFocus ?? false,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leading != null
                ? Container(
                    margin: const EdgeInsets.only(
                      right: 20,
                    ),
                    child: Icon(leading),
                  )
                : const SizedBox(),
              labelText != null && labelText!.isNotEmpty
                ? Expanded(
                    child: center ?? false
                      ? Center(
                          child: _text()
                        )
                      : _text(),
                  )
                : Expanded(
                  child: center ?? false
                    ? Center(
                        child: _getChild(),
                      )
                    : _getChild(),
                ),
              trailing != null
                ? Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Icon(trailing),
                  )
                : const SizedBox(),
            ],
          ),
        ),
        style: ButtonStyle(
          foregroundColor: mainButton ?? false
            ? MaterialStateProperty.all(Theme.of(context).floatingActionButtonTheme.foregroundColor)
            : MaterialStateProperty.all(
              foregroundColor ?? color ?? Theme.of(context).colorScheme.secondary,
            ),
          padding: MaterialStateProperty.all(padding),
          backgroundColor: MaterialStateProperty.all(
            outline ?? false 
              ? Colors.transparent 
              : secondary ?? false
                ? Theme.of(context).cardColor.withOpacity(.6)
                : color ?? Theme.of(context).colorScheme.secondary,
          ),
          elevation: MaterialStateProperty.all(elevation),
          minimumSize: MaterialStateProperty.all(minimumSize),
          textStyle: MaterialStateProperty.all(textStyle),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 10),
              side: BorderSide(
                color: color ?? Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          enableFeedback: enableFeedback,
        ),
        onPressed: enable ?? false ? onPressed : null,
        onLongPress: enable ?? false ? onLongPressed : null,
      ),
    );
  }

  Widget _text() {
    return Text(
      labelText!.toUpperCase(),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _getChild() {
    if(leading != null || trailing != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leading != null
            ? Icon(leading)
            : const SizedBox(),
          child ?? const SizedBox(),
          trailing != null
            ? Icon(trailing)
            : const SizedBox(),
        ],
      );
    } else {
      return child ?? const SizedBox();
    }
  }
}
