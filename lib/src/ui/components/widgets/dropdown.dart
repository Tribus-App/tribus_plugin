library church_plugin;
import 'package:church_plugin/src/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MNDropdown extends StatelessWidget {
  final String? value;
  final bool expanded;
  final String? labelText;
  final bool readOnly;
  final ValueChanged<String?>? onChanged;
  final Function? onTap;
  final EdgeInsets? margin;
  final FocusNode? focusNode;
  final List<String> listaOpcoes;
  final Color? color;

  const MNDropdown({
    Key? key,
    this.labelText,
    this.readOnly = false,
    this.onChanged,
    this.onTap,
    this.margin,
    this.value = "Conta Corrente",
    this.focusNode,
    this.listaOpcoes = const <String>['Conta Corrente', 'Poupança'],
    this.color,
  })  : expanded = false,
        super(key: key);

  const MNDropdown.withExpanded({
    Key? key,
    this.labelText,
    this.readOnly = false,
    this.onChanged,
    this.onTap,
    this.margin,
    this.value = "Conta Corrente",
    this.focusNode,
    this.listaOpcoes = const <String>['Conta Corrente', 'Poupança'],
    this.color,
  })  : expanded = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: DropdownButtonFormField(
        dropdownColor: color ?? Theme.of(context).cardColor,
        focusNode: focusNode,
        isExpanded: expanded,
        style: Theme.of(context).textTheme.headline5,
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Theme.of(context).textTheme.bodyText1!.color,
        ),
        decoration: InputDecoration(
            filled: true,
            fillColor: color ?? Theme.of(context).cardColor,
            labelText: labelText,
            alignLabelWithHint: false,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).cardColor, width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Theme.of(context).cardColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Theme.of(context).cardColor)),
            contentPadding:
                const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 14),
            errorBorder: const UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppTheme.errorColor),
            ),
            errorStyle: const TextStyle(color: AppTheme.errorColor),
            hintStyle: Theme.of(context).textTheme.bodyText1,
            labelStyle: Theme.of(context).textTheme.bodyText1),
        value: value,
        onChanged: onChanged,
        items: listaOpcoes.map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
