import 'package:flutter/material.dart';

import 'enum_class.dart';

Widget buildDropDown2<T>(Icon icon, String labelText,
    Map<T, String> definitions, T value, void Function(T) setValue) {
  var items = definitions.entries
      .map((e) => DropdownMenuItem<T>(value: e.key, child: Text(e.value)))
      .toList();

  return DropdownButtonFormField<T>(
    decoration: InputDecoration(icon: icon, labelText: labelText),
    value: value,
    dropdownColor: Colors.white,
    items: items,
    onChanged: setValue,
  );
}

Widget buildDropDown3(Icon icon, String labelText, EnumClass value,
    void Function(EnumClass) setValue) {
  var items = value
      .values()
      .map((e) =>
          DropdownMenuItem<EnumClass>(value: e, child: Text(e.toString())))
      .toList();

  return DropdownButtonFormField<EnumClass>(
      decoration: InputDecoration(icon: icon, labelText: labelText),
      value: value,
      dropdownColor: Colors.white,
      items: items,
      onChanged: setValue);
}

TextFormField buildTextFormField(Icon icon, String hint, String label,
    String init, void Function(String) setValue) {
  return TextFormField(
      decoration: InputDecoration(
        icon: icon,
        hintText: hint,
        labelText: label,
      ),
      initialValue: init,
      onFieldSubmitted: setValue);
}
