import 'package:logger/logger.dart';
import 'dart:developer';

const String _tag = "ziwa --->>>";

Logger _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
  ),
);

logV(dynamic msg, {String tag = _tag}) {
  _logger.v("tag: $tag msg: $msg");
}

logD(dynamic msg, {String tag = _tag}) {
  _logger.d("tag: $tag msg:  $msg");
}

logI(dynamic msg, {String tag = _tag}) {
  _logger.i("tag: $tag msg: $msg");
}

logW(dynamic msg, {String tag = _tag}) {
  _logger.w("tag: $tag msg: $msg");
}

logE(dynamic msg, {String tag = _tag}) {
  _logger.e("tag: $tag msg: $msg");
}

logWTF(dynamic msg, {String tag = _tag}) {
  log(msg);
}