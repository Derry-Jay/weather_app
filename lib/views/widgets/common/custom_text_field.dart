import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/extensions/extensions.dart';
import 'package:weather_app/utils/values.dart';

import '../../../utils/methods.dart';

class CustomTextField extends StatelessWidget {
  final Widget? prefix;
  final Color? cursorColor;
  final Radius? cursorRadius;
  final FocusNode? focusNode;
  final TextAlign? textAlign;
  final StrutStyle? strutStyle;
  final BoxDecoration? cupertino;
  final MouseCursor? mouseCursor;
  final InputDecoration? material;
  final EdgeInsets? scrollPadding;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? padding;
  final TextDirection? textDirection;
  final ScrollPhysics? scrollPhysics;
  final Brightness? keyboardAppearance;
  final void Function(String?)? onSaved;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final double? cursorWidth, cursorHeight;
  final TextEditingController? controller;
  final ScrollController? scrollController;
  final TextStyle? style, placeholderStyle;
  final AutovalidateMode? autovalidateMode;
  final int? minLines, maxLength, maxLines;
  final String? Function(String?)? validator;
  final TextAlignVertical? textAlignVertical;
  final VoidCallback? onTap, onEditingComplete;
  final TextCapitalization? textCapitalization;
  final TextSelectionControls? selectionControls;
  final List<TextInputFormatter>? inputFormatters;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final void Function(String)? onChanged, onFieldSubmitted;
  final String? initialValue, placeholder, restorationId, obscuringCharacter;
  final Widget Function(BuildContext, EditableTextState)? contextMenuBuilder;
  final Widget? Function(BuildContext,
      {required int currentLength,
      required bool isFocused,
      required int? maxLength})? buildCounter;
  final bool? enabled,
      expands,
      readOnly,
      autofocus,
      showCursor,
      obscureText,
      isFormField,
      autocorrect,
      withoutBorder,
      enableSuggestions,
      enableInteractiveSelection,
      enableIMEPersonalizedLearning;

  const CustomTextField(
      {super.key,
      this.style,
      this.onTap,
      this.prefix,
      this.onSaved,
      this.padding,
      this.expands,
      this.enabled,
      this.material,
      this.minLines,
      this.maxLines,
      this.readOnly,
      this.autofocus,
      this.cupertino,
      this.focusNode,
      this.maxLength,
      this.onChanged,
      this.textAlign,
      this.validator,
      this.controller,
      this.strutStyle,
      this.showCursor,
      this.mouseCursor,
      this.isFormField,
      this.autocorrect,
      this.obscureText,
      this.cursorColor,
      this.cursorWidth,
      this.placeholder,
      this.keyboardType,
      this.initialValue,
      this.cursorHeight,
      this.cursorRadius,
      this.buildCounter,
      this.withoutBorder,
      this.scrollPadding,
      this.scrollPhysics,
      this.autofillHints,
      this.textDirection,
      this.restorationId,
      this.textInputAction,
      this.smartDashesType,
      this.smartQuotesType,
      this.inputFormatters,
      this.placeholderStyle,
      this.autovalidateMode,
      this.onFieldSubmitted,
      this.scrollController,
      this.textAlignVertical,
      this.enableSuggestions,
      this.onEditingComplete,
      this.selectionControls,
      this.keyboardAppearance,
      this.contextMenuBuilder,
      this.obscuringCharacter,
      this.textCapitalization,
      this.maxLengthEnforcement,
      this.enableInteractiveSelection,
      this.enableIMEPersonalizedLearning});

  @override
  Widget build(BuildContext context) {
    final isFF = isFormField ?? false;
    final wob = withoutBorder ?? false;
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return isFF
            ? CupertinoTextFormFieldRow(
                onTap: onTap,
                style: style,
                prefix: prefix,
                onSaved: onSaved,
                enabled: enabled,
                padding: padding,
                minLines: minLines,
                focusNode: focusNode,
                onChanged: onChanged,
                maxLength: maxLength,
                validator: validator,
                decoration: cupertino,
                showCursor: showCursor,
                controller: controller,
                strutStyle: strutStyle,
                maxLines: maxLines ?? 1,
                cursorColor: cursorColor,
                placeholder: placeholder,
                expands: expands ?? false,
                cursorHeight: cursorHeight,
                initialValue: initialValue,
                keyboardType: keyboardType,
                readOnly: readOnly ?? false,
                textDirection: textDirection,
                scrollPhysics: scrollPhysics,
                autofillHints: autofillHints,
                autofocus: autofocus ?? false,
                autocorrect: autocorrect ?? true,
                smartDashesType: smartDashesType,
                smartQuotesType: smartQuotesType,
                textInputAction: textInputAction,
                inputFormatters: inputFormatters,
                obscureText: obscureText ?? false,
                onFieldSubmitted: onFieldSubmitted,
                textAlignVertical: textAlignVertical,
                onEditingComplete: onEditingComplete,
                selectionControls: selectionControls,
                keyboardAppearance: keyboardAppearance,
                textAlign: textAlign ?? TextAlign.start,
                cursorWidth: cursorWidth ?? measurements.xs4,
                enableSuggestions: enableSuggestions ?? true,
                obscuringCharacter: obscuringCharacter ?? '•',
                scrollPadding: scrollPadding ?? measurements.xl2.allPadding,
                enableInteractiveSelection: enableInteractiveSelection ?? true,
                autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
                textCapitalization:
                    textCapitalization ?? TextCapitalization.none,
                placeholderStyle: placeholderStyle ?? css.applePlaceHolderStyle,
                contextMenuBuilder:
                    contextMenuBuilder ?? getAppleContextMenuBuilder)
            : (wob
                ? CupertinoTextField.borderless(
                    onTap: onTap,
                    style: style,
                    prefix: prefix,
                    minLines: minLines,
                    focusNode: focusNode,
                    onChanged: onChanged,
                    maxLength: maxLength,
                    decoration: cupertino,
                    showCursor: showCursor,
                    controller: controller,
                    strutStyle: strutStyle,
                    maxLines: maxLines ?? 1,
                    cursorColor: cursorColor,
                    placeholder: placeholder,
                    enabled: enabled ?? true,
                    expands: expands ?? false,
                    cursorHeight: cursorHeight,
                    keyboardType: keyboardType,
                    readOnly: readOnly ?? false,
                    textDirection: textDirection,
                    scrollPhysics: scrollPhysics,
                    autofillHints: autofillHints,
                    autofocus: autofocus ?? false,
                    autocorrect: autocorrect ?? true,
                    smartDashesType: smartDashesType,
                    smartQuotesType: smartQuotesType,
                    textInputAction: textInputAction,
                    inputFormatters: inputFormatters,
                    obscureText: obscureText ?? false,
                    textAlignVertical: textAlignVertical,
                    onEditingComplete: onEditingComplete,
                    selectionControls: selectionControls,
                    keyboardAppearance: keyboardAppearance,
                    textAlign: textAlign ?? TextAlign.start,
                    cursorWidth: cursorWidth ?? measurements.xs4,
                    enableSuggestions: enableSuggestions ?? true,
                    obscuringCharacter: obscuringCharacter ?? '•',
                    padding: padding ?? (measurements.medium / 2).allPadding,
                    scrollPadding: scrollPadding ?? measurements.xl2.allPadding,
                    enableInteractiveSelection:
                        enableInteractiveSelection ?? true,
                    textCapitalization:
                        textCapitalization ?? TextCapitalization.none,
                    placeholderStyle:
                        placeholderStyle ?? css.applePlaceHolderStyle,
                    contextMenuBuilder:
                        contextMenuBuilder ?? getAppleContextMenuBuilder)
                : CupertinoTextField(
                    onTap: onTap,
                    style: style,
                    prefix: prefix,
                    minLines: minLines,
                    focusNode: focusNode,
                    onChanged: onChanged,
                    maxLength: maxLength,
                    decoration: cupertino,
                    showCursor: showCursor,
                    controller: controller,
                    strutStyle: strutStyle,
                    maxLines: maxLines ?? 1,
                    enabled: enabled ?? true,
                    cursorColor: cursorColor,
                    placeholder: placeholder,
                    expands: expands ?? false,
                    cursorHeight: cursorHeight,
                    keyboardType: keyboardType,
                    readOnly: readOnly ?? false,
                    textDirection: textDirection,
                    scrollPhysics: scrollPhysics,
                    autofillHints: autofillHints,
                    autofocus: autofocus ?? false,
                    autocorrect: autocorrect ?? true,
                    smartDashesType: smartDashesType,
                    smartQuotesType: smartQuotesType,
                    textInputAction: textInputAction,
                    inputFormatters: inputFormatters,
                    obscureText: obscureText ?? false,
                    textAlignVertical: textAlignVertical,
                    onEditingComplete: onEditingComplete,
                    selectionControls: selectionControls,
                    keyboardAppearance: keyboardAppearance,
                    textAlign: textAlign ?? TextAlign.start,
                    cursorWidth: cursorWidth ?? measurements.xs4,
                    enableSuggestions: enableSuggestions ?? true,
                    obscuringCharacter: obscuringCharacter ?? '•',
                    padding: padding ?? (measurements.medium / 2).allPadding,
                    scrollPadding: scrollPadding ?? measurements.xl2.allPadding,
                    enableInteractiveSelection:
                        enableInteractiveSelection ?? true,
                    textCapitalization:
                        textCapitalization ?? TextCapitalization.none,
                    placeholderStyle:
                        placeholderStyle ?? css.applePlaceHolderStyle,
                    contextMenuBuilder:
                        contextMenuBuilder ?? getAppleContextMenuBuilder));
      default:
        return isFF
            ? TextFormField(
                onTap: onTap,
                style: style,
                onSaved: onSaved,
                enabled: enabled,
                minLines: minLines,
                focusNode: focusNode,
                maxLength: maxLength,
                decoration: material,
                validator: validator,
                onChanged: onChanged,
                controller: controller,
                strutStyle: strutStyle,
                showCursor: showCursor,
                maxLines: maxLines ?? 1,
                cursorColor: cursorColor,
                mouseCursor: mouseCursor,
                expands: expands ?? false,
                buildCounter: buildCounter,
                cursorHeight: cursorHeight,
                initialValue: initialValue,
                keyboardType: keyboardType,
                cursorRadius: cursorRadius,
                readOnly: readOnly ?? false,
                restorationId: restorationId,
                scrollPhysics: scrollPhysics,
                autofillHints: autofillHints,
                textDirection: textDirection,
                autofocus: autofocus ?? false,
                autocorrect: autocorrect ?? true,
                smartDashesType: smartDashesType,
                smartQuotesType: smartQuotesType,
                textInputAction: textInputAction,
                inputFormatters: inputFormatters,
                obscureText: obscureText ?? false,
                autovalidateMode: autovalidateMode,
                scrollController: scrollController,
                onFieldSubmitted: onFieldSubmitted,
                textAlignVertical: textAlignVertical,
                onEditingComplete: onEditingComplete,
                selectionControls: selectionControls,
                keyboardAppearance: keyboardAppearance,
                textAlign: textAlign ?? TextAlign.start,
                maxLengthEnforcement: maxLengthEnforcement,
                cursorWidth: cursorWidth ?? measurements.xs4,
                enableSuggestions: enableSuggestions ?? true,
                obscuringCharacter: obscuringCharacter ?? '•',
                scrollPadding: scrollPadding ?? measurements.xl2.allPadding,
                enableInteractiveSelection: enableInteractiveSelection ?? true,
                contextMenuBuilder: contextMenuBuilder ?? getContextMenuBuilder,
                textCapitalization:
                    textCapitalization ?? TextCapitalization.none,
                enableIMEPersonalizedLearning:
                    enableIMEPersonalizedLearning ?? true)
            : TextField(
                onTap: onTap,
                style: style,
                enabled: enabled,
                minLines: minLines,
                focusNode: focusNode,
                maxLength: maxLength,
                decoration: material,
                onChanged: onChanged,
                controller: controller,
                strutStyle: strutStyle,
                showCursor: showCursor,
                maxLines: maxLines ?? 1,
                cursorColor: cursorColor,
                mouseCursor: mouseCursor,
                expands: expands ?? false,
                buildCounter: buildCounter,
                cursorHeight: cursorHeight,
                keyboardType: keyboardType,
                cursorRadius: cursorRadius,
                readOnly: readOnly ?? false,
                restorationId: restorationId,
                scrollPhysics: scrollPhysics,
                autofillHints: autofillHints,
                textDirection: textDirection,
                autofocus: autofocus ?? false,
                autocorrect: autocorrect ?? true,
                smartDashesType: smartDashesType,
                smartQuotesType: smartQuotesType,
                textInputAction: textInputAction,
                inputFormatters: inputFormatters,
                obscureText: obscureText ?? false,
                scrollController: scrollController,
                textAlignVertical: textAlignVertical,
                onEditingComplete: onEditingComplete,
                selectionControls: selectionControls,
                keyboardAppearance: keyboardAppearance,
                textAlign: textAlign ?? TextAlign.start,
                maxLengthEnforcement: maxLengthEnforcement,
                cursorWidth: cursorWidth ?? measurements.xs4,
                enableSuggestions: enableSuggestions ?? true,
                obscuringCharacter: obscuringCharacter ?? '•',
                scrollPadding: scrollPadding ?? measurements.xl2.allPadding,
                enableInteractiveSelection: enableInteractiveSelection ?? true,
                contextMenuBuilder: contextMenuBuilder ?? getContextMenuBuilder,
                enableIMEPersonalizedLearning:
                    enableIMEPersonalizedLearning ?? true,
                textCapitalization:
                    textCapitalization ?? TextCapitalization.none);
    }
  }
}
