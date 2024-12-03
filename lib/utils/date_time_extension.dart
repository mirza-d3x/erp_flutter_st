import 'package:intl/intl.dart';

extension DateTimeFormatedString on DateTime {
  String formatDateTimeToHoursRange(DateTime endDate) {
    final dateFormat = DateFormat('dd-M-yyyy');
    final timeFormat = DateFormat('hh:mm a');

    String formattedDate = dateFormat.format(this);
    String startTime = timeFormat.format(this);
    String endTime = timeFormat.format(endDate);

    return '$formattedDate ($startTime to $endTime)';
  }

  String formatDateTimeRange(DateTime endDate) {
    final dateFormat = DateFormat('dd-M-yyyy');
    final startDateFormatted = dateFormat.format(this);
    final endDateFormatted = dateFormat.format(endDate);

    return '$startDateFormatted to $endDateFormatted';
  }

  String toFormattedString() {
    return '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  }
}
