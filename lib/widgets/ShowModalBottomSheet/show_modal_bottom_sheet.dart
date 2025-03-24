import "package:flutter/material.dart";
import "package:timothy/widgets/ShowModalBottomSheet/widget_for_bottom_modal_sheet.dart";

Future<void> bottomSheetForMessage({required BuildContext context, required String type, required Map data, required Function(List msgs) handleAddMsg}){

  bool seleted = false;

  handleChange() {
    seleted = !seleted;
  }

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return WidgetForBottomModalSheet(data: data, seleted: seleted, handleAddMsg: handleAddMsg, type: type,);
    }
  );
}