class MdUtils {
  static String formatToTextDate(DateTime date) {
    return '${date.year} ${months[date.month]} ${date.day}';
  }

  static String extractHourDate(DateTime date) {
    final auxHour = date.hour < 10 ? 0 : '';
    final auxMinute = date.minute < 10 ? 0 : '';
    return '$auxHour${date.hour}:$auxMinute${date.minute} hr';
  }

  static const months = {
    1: 'January',
    2: 'February',
    3: 'March',
    4: 'April',
    5: 'May',
    6: 'June',
    7: 'Jule',
    8: 'August',
    9: 'September',
    10: 'October',
    11: 'November',
    12: 'December',
  };
}
