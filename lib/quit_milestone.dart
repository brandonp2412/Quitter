class QuitMilestone {
  final int day;
  final String title;
  final String description;
  final String reference;
  final String link;
  final String? referenceContent;
  final String? referenceDate;

  const QuitMilestone({
    required this.day,
    required this.title,
    required this.description,
    required this.reference,
    required this.link,
    this.referenceContent,
    this.referenceDate,
  });
}
