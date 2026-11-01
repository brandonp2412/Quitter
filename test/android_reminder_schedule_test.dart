import 'package:flutter_test/flutter_test.dart';
import 'package:quitter/tasks.dart';
import 'package:quitter/utils.dart';

void main() {
  test('Android reminder dates keep local wall-clock time across DST', () {
    final dates = reminderDatesForYear(
      DateTime(2026, 9, 26, 8, 30),
      1,
    ).take(4).toList();

    expect(dates.map((date) => date.day), [26, 27, 28, 29]);
    expect(dates.every((date) => date.hour == 8 && date.minute == 30), isTrue);
  });

  test('Android reminder schedule follows the requested day interval', () {
    final dates = reminderDatesForYear(
      DateTime(2026, 11, 1, 17, 45),
      7,
    ).toList();

    expect(dates.length, 53);
    expect(dates[1], DateTime(2026, 11, 8, 17, 45));
    expect(dates.last.isBefore(DateTime(2027, 11, 1)), isTrue);
    expect(reminderDatesForYear(DateTime(2026, 11, 1), 0), isEmpty);
  });

  test('scheduled progress counts use the notification date', () {
    expect(daysCeilAt('2026-10-30T11:00:00', DateTime(2026, 11, 1)), 3);
    expect(daysCeilAt('2026-10-30T11:00:00', DateTime(2027, 1, 1)), 64);
  });
}
