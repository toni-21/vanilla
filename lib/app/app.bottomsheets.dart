// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';
import 'package:vanilla/ui/bottom_sheets/action_warning/action_warning_sheet.dart';
import 'package:vanilla/ui/bottom_sheets/add_location/add_location_sheet.dart';
import 'package:vanilla/ui/bottom_sheets/confirm_price/confirm_price_sheet.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';

enum BottomSheetType {
  notice,
  confirmPrice,
  actionWarning,
  addLocation,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.notice: (context, request, completer) =>
        NoticeSheet(request: request, completer: completer),
    BottomSheetType.confirmPrice: (context, request, completer) =>
        ConfirmPriceSheet(request: request, completer: completer),
    BottomSheetType.actionWarning: (context, request, completer) =>
        ActionWarningSheet(request: request, completer: completer),
    BottomSheetType.addLocation: (context, request, completer) =>
        AddLocationSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
