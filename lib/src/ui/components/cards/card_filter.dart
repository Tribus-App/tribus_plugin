library church_plugin;
import 'package:flutter/material.dart';

class CardFilter extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final String? group;
  final String? value;
  final bool? selected;
  final bool down;
  final bool outline;
  final EdgeInsets? padding;
  final Color? color;
  final ValueChanged<String?>? onChanged;

  CardFilter(
    {this.title, 
    this.icon,
    this.group,
    this.value,
    this.onChanged,
    this.padding,
    this.selected,
    this.color,
  }) : down = false, outline = false;

  CardFilter.down(
    {this.title, 
    this.icon, 
    this.group,
    this.value,
    this.onChanged,
    this.padding,
    this.selected,
    this.color,
  }) : down = false, outline = false;

  CardFilter.outline(
    {this.title, 
    this.icon,
    this.group,
    this.value,
    this.onChanged,
    this.padding,
    this.selected,
    this.color,
    this.down = false,
  }) : outline = true;


  @override
  Widget build(BuildContext context) {
    bool? _selected = selected;
    if(value == null) {
      _selected = _selected ?? group == title;
    } else {
      _selected = _selected ?? group == value;
    }

    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: _selected
            ? Theme.of(context).colorScheme.secondary 
            : color != null
              ? color
              : Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(50,),
          ),
          border: Border.all(
            width: outline ? 3 : 0,
            color: outline 
              ? Theme.of(context).colorScheme.secondary
              : Colors.transparent,
          )
        ),
        margin: const EdgeInsets.only(),
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Center(
          child: title != null && title.toString() != ""
            ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon == null
                  ? SizedBox()
                  : Container(
                    margin: EdgeInsets.only(
                      right: 10,
                    ),
                    child: _icon(
                      context, 
                      _selected,
                    ),
                  ),
                title == null
                  ? SizedBox()
                  : Text(
                      title!,
                      style: TextStyle(
                        color: _selected 
                          ? Theme.of(context).floatingActionButtonTheme.foregroundColor
                          : Theme.of(context).textTheme.bodyText1!.color,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                down
                  ? Row(
                    children: [
                      Container(
                        height: 21,
                        width: 1,
                        margin: EdgeInsets.only(left: 8, right: 5),
                        color: _selected 
                          ? Theme.of(context).appBarTheme.titleTextStyle!.color 
                          : Theme.of(context).textTheme.bodyText1!.color!.withOpacity(.4)
                      ),
                      Icon(
                        Icons.keyboard_arrow_down, 
                        size: 21, 
                        color: _selected 
                          ? Theme.of(context).appBarTheme.titleTextStyle!.color 
                          : Theme.of(context).textTheme.bodyText1!.color
                      )
                    ],
                  )
                  : SizedBox(),
              ],
            )
            : Center(
                child: _icon(
                  context, 
                  _selected
                ),
              ),
        ),
      ),
      onTap: onChanged != null
        ? () {
          if(onChanged != null) {
            if(value != null) {
              onChanged!(value);
            } else {
              onChanged!(title);
            }
          }
        }
        : null,
    );
  }

  Widget _icon(BuildContext context, bool selected) {
    return Icon(
      icon, 
      size: 21, 
      color: selected 
        ? Theme.of(context).floatingActionButtonTheme.foregroundColor
        : Theme.of(context).textTheme.bodyText1!.color,
    );
  }
}
