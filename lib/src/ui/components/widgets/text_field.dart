library church_plugin;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class MNTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final String? helperText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final dynamic controller;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final ValueChanged<String>? onChanged;
  final Function()? onTap;
  final FormFieldSetter<String>? onSaved;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final bool? enabled;
  final bool? enableInteractiveSelection;
  final bool? autofocus;
  final bool? obscureText;
  final bool? maxLengthEnforced;
  final bool? readOnly;
  final bool? large;
  final TextCapitalization? textCapitalization;
  final String? counterText;
  final Color? color;
  final List<TextInputFormatter>? inputFormatters;
  final String? suffixText;
  final String? prefixText;
  final List<dynamic>? suggestionsList;
  final bool? ignoreAccentsOnSuggestion;
  final bool? caseSensitiveOnSuggestion;
  final bool? unfocusIfNoNextFocusNode;
  final List<FocusNode>? focusNodeList;
  final int? focusNodeIndex;
  final ValueChanged<String>? onSuggestionSelected;
  final bool? automaticFocusWithFocusNodeList;
  final bool? repeatItemsOnSuggestionList;
  final Iterable<String>? autofillHints;

  static const String assetMsgFocusNodeList = "If you pass 'focusNodeList', you need to pass its position with 'focusNodeIndex'";
  static const String assetMsgSuggestions = "'suggestionsList', can not be null";

  static const String currencySymbol = "R\$ "; // ! Passar pro inicializador

  MNTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.errorText,
    this.helperText,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.controller,
    this.validator,
    this.onFieldSubmitted,
    this.focusNode,
    this.nextFocusNode,
    this.onChanged,
    this.onTap,
    this.onSaved,
    this.maxLength,
    this.minLines = 1,
    this.maxLines = 1,
    this.margin,
    this.padding,
    this.enabled = true,
    this.enableInteractiveSelection = true,
    this.autofocus = false,
    this.large = false,
    this.obscureText = false,
    this.maxLengthEnforced = true,
    this.readOnly = false,
    this.textCapitalization = TextCapitalization.sentences,
    this.counterText,
    this.color,
    this.inputFormatters,
    this.suffixText,
    this.prefixText,
    this.suggestionsList,
    this.ignoreAccentsOnSuggestion,
    this.caseSensitiveOnSuggestion,
    this.unfocusIfNoNextFocusNode = true,
    this.focusNodeList,
    this.focusNodeIndex,
    this.onSuggestionSelected,
    this.automaticFocusWithFocusNodeList = true,
    this.repeatItemsOnSuggestionList,
    this.autofillHints,
  }) : assert(
        (focusNodeList == null && focusNodeIndex == null) || (focusNodeList != null && focusNodeIndex != null), 
          assetMsgFocusNodeList,
        ),
        super(key: key);

  MNTextField.withSuggestions({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.sentences,
    this.obscureText = false,
    this.enabled = true,
    this.maxLengthEnforced = true,
    this.onFieldSubmitted,
    this.focusNode,
    this.onChanged,
    this.onTap,
    this.counterText,
    this.maxLength,
    this.minLines = 1,
    this.maxLines = 1,
    this.margin,
    this.padding,
    this.prefixText,
    this.suffixText,
    this.enableInteractiveSelection = true,
    this.suffixIcon,
    this.color,
    this.suggestionsList,
    this.inputFormatters,
    this.autofocus = false,
    this.readOnly = false,
    this.large = false,
    this.nextFocusNode,
    this.ignoreAccentsOnSuggestion = true,
    this.caseSensitiveOnSuggestion = false,
    this.unfocusIfNoNextFocusNode = true,
    this.focusNodeList,
    this.focusNodeIndex,
    this.automaticFocusWithFocusNodeList = true,
    this.onSuggestionSelected,
    this.repeatItemsOnSuggestionList = false,
    this.autofillHints,
  })  : this.onSaved = null,
        this.validator = null,
        assert(
          suggestionsList != null, 
          assetMsgSuggestions,
        ),
        assert(
          (focusNodeList == null && focusNodeIndex == null) || (focusNodeList != null && focusNodeIndex != null), 
          assetMsgFocusNodeList,
        ),
        super(key: key);

  MNTextField.type({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.sentences,
    this.obscureText = false,
    this.readOnly = false,
    this.autofocus = false,
    this.enabled = true,
    this.maxLengthEnforced = true,
    this.large = false,
    this.onFieldSubmitted,
    this.focusNode,
    this.onChanged,
    this.onTap,
    this.counterText,
    this.maxLength,
    this.minLines = 1,
    this.maxLines = 1,
    this.margin,
    this.padding,
    this.prefixText,
    this.suffixText,
    this.nextFocusNode,
    this.enableInteractiveSelection = true,
    this.color,
    this.inputFormatters,
    this.suffixIcon,
    this.onSaved,
    this.validator,
    this.unfocusIfNoNextFocusNode = true,
    this.focusNodeList,
    this.focusNodeIndex,
    this.automaticFocusWithFocusNodeList = true,
    this.autofillHints,
  })  : this.suggestionsList = null,
        this.onSuggestionSelected = null,
        this.ignoreAccentsOnSuggestion = null,
        this.caseSensitiveOnSuggestion = null,
        this.repeatItemsOnSuggestionList = null,
        // assert(
        //   controller is MaskedTextController || controller is MoneyMaskedTextController,
        //   "'controller' is not MaskedTextController or MoneyMaskedTextController",
        // ),
        assert(
          (focusNodeList == null && focusNodeIndex == null) || (focusNodeList != null && focusNodeIndex != null), 
          assetMsgFocusNodeList,
        ),
        super(key: key);

  TextInputType? _keyboardType;
  List<TextInputFormatter>? _inputFormatters;
  Function? _goToNextFocusNode;
  TextInputAction? _textInputAction = TextInputAction.next;
  FocusNode? _focusNode;
  ValueChanged<String>? _changeMask;
  Widget? _suffixIcon;
  int? _minLines, _maxLines;
  String? _prefixText;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      margin: margin,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: _textField(context),
    );
  }

  Widget _textField(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
        fontSize: large == true ? 45 : null,
        fontWeight: FontWeight.w800,
      ),
      inputFormatters: inputFormatters ?? _inputFormatters,
      keyboardType: keyboardType ?? _keyboardType,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      minLines: minLines ?? _minLines,
      maxLines: maxLines ?? _maxLines,
      enabled: enabled,
      autofillHints: autofillHints,
      decoration: InputDecoration(
        filled: true,
        fillColor: color ?? Theme.of(context).cardColor,
        labelText: labelText,
        hintText: hintText,
        errorText: errorText,
        counterText: counterText,
        alignLabelWithHint: false,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: large == true ? Colors.transparent : Theme.of(context).cardColor,
            width: large == true ? 0 : 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: large == true ? Colors.transparent : Theme.of(context).cardColor,
            width: large == true ? 0 : 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: large == true ? Colors.transparent : Theme.of(context).cardColor,
            width: large == true ? 0 : 1,
          ),
        ),
        contentPadding: padding ?? const EdgeInsets.symmetric(
          horizontal: 20, 
          vertical: 18,
        ),
        errorBorder: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red),
        ),
        helperText: helperText,
        helperMaxLines: 3,
        errorStyle: const TextStyle(
          color: Colors.red,
        ),
        suffixText: suffixText,
        prefixText: prefixText ?? _prefixText,
        suffixIcon: suffixIcon ?? _suffixIcon,
        hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: large == true ? 45 : null,
          fontWeight: FontWeight.w800,
        ),
        labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: large == true ? 45 : null,
          fontWeight: FontWeight.w800,
        ),
      ),
      onTap: onTap,
      onSaved: onSaved,
      onChanged: (value) {
        if(onChanged != null) {
          onChanged!(value);
        }
        if(_changeMask != null) {
          _changeMask!(value);
        }
      },
      // onChanged: onChanged,
      maxLength: maxLength,
      readOnly: readOnly ?? false,
      validator: validator,
      controller: controller,
      textInputAction: textInputAction ?? _textInputAction,
      // onFieldSubmitted: onFieldSubmitted,
      onFieldSubmitted: (_) {
        if(onFieldSubmitted != null) {
          onFieldSubmitted!(_);
        }
        if(_goToNextFocusNode != null) {
          _goToNextFocusNode!();
        }
      },
      focusNode: _focusNode,
      obscureText: obscureText ?? false,
      autofocus: autofocus ?? false,
    );
  }
}
