import 'package:intl/intl.dart';
import 'package:timezone/browser.dart';

import 'extensions.dart';

extension StrUt on String? {
  NumberFormat get fromPattern => NumberFormat(this);

  NumberFormat get fromLocale => NumberFormat(null, this);

  Location getLocation(List<TimeZone> zones, List<int> transitionAt,
          List<int> transitionZone) =>
      Location(this?.trimmed ?? '', transitionAt, transitionZone, zones);
}

extension IntUt on int? {
  TimeZone offsetToTimeZone(bool isDst, String abbreviation) =>
      TimeZone(this ?? 0, isDst: isDst, abbreviation: abbreviation);
}
