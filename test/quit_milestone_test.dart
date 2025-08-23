import 'package:flutter_test/flutter_test.dart';
import 'package:quitter/quit_milestone.dart';

void main() {
  group('QuitMilestone', () {
    test('milestone properties are correctly assigned', () {
      final int day = 1;
      final String title = 'Day One';
      final String description = 'First day of quitting';
      final String reference = 'https://example.com/day1';

      final QuitMilestone milestone = QuitMilestone(
        day: day,
        title: title,
        description: description,
        reference: reference,
        link: reference,
      );

      expect(milestone.day, day);
      expect(milestone.title, title);
      expect(milestone.description, description);
      expect(milestone.reference, reference);
    });
  });
}
