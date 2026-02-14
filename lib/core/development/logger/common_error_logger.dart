import 'dart:developer';

void commonErrorHappened({String where = '', String whichPlace = ''}) {
  log("An unexpected error from $whichPlace function in $where");
}
