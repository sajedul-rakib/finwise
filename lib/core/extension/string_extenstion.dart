extension StringExtension on String {
  String formatDate(String dateString) {
    final DateTime date = DateTime.parse(dateString);

    final String day = date.day.toString().padLeft(2, '0');
    String monthName = date.month.toString();
    final String hour = date.hour.toString().padLeft(2, '0');
    final String minute = date.minute.toString().padLeft(2, '0');

    switch (monthName) {
      case '1':
        monthName = 'Jan';
        break;
      case '2':
        monthName = 'Feb';
        break;
      case '3':
        monthName = 'Mar';
        break;
      case '4':
        monthName = 'Apr';
        break;
      case '5':
        monthName = 'May';
        break;
      case '6':
        monthName = 'Jun';
        break;
      case '7':
        monthName = 'Jul';
        break;
      case '8':
        monthName = 'Aug';
        break;
      case '9':
        monthName = 'Sep';
        break;
      case '10':
        monthName = 'Oct';
        break;
      case '11':
        monthName = 'Nov';
        break;
      case '12':
        monthName = 'Dec';
        break;
      default:
        monthName = '';
    }

    // 16:28 - April 15
    return '$hour:$minute - $monthName $day';
  }
}
