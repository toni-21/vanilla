// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';
import 'package:vanilla/ui/bottom_sheets/confirm_price/confirm_price_sheet.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';

enum BottomSheetType {
  notice,
  confirmPrice,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.notice: (context, request, completer) =>
        NoticeSheet(request: request, completer: completer),
    BottomSheetType.confirmPrice: (context, request, completer) =>
        ConfirmPriceSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
