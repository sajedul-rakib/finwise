import 'dart:developer';

void errorLogger({
  String where = '',
  String whichPlace = '',
  String extraMessage = '',
}) {
  log(
    "An error happened in $where from $whichPlace function.The message is $extraMessage",
  );
}
