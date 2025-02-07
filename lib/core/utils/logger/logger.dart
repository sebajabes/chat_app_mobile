import 'package:logger/logger.dart';

final pLogger = Logger(
    printer: PrettyPrinter(
  methodCount: 2,
  errorMethodCount: 8,
  lineLength: 120,
  colors: true,
  printEmojis: true,
  dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
));

final vLog = pLogger.t;
final wLog = pLogger.w;
final eLog = pLogger.e;
final iLog = pLogger.i;
final dLog = pLogger.d;
final wtfLog = pLogger.f;
