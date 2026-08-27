import 'package:flutter_test/flutter_test.dart';
import 'package:quitter/quit_milestone.dart';

void main() {
  test('directly supported claims keep their specific copy', () {
    const milestone = QuitMilestone(
      day: 7,
      title: 'One week',
      description: 'Specific supported claim',
      reference:
          'Clinical Management of Psychostimulant Withdrawal: Review of the Evidence (Addiction)',
      link: 'https://pmc.ncbi.nlm.nih.gov/articles/PMC10069411/',
      referenceContent: 'Specific evidence content',
    );

    expect(milestone.isEvidenceQualified, isFalse);
    expect(milestone.description, 'Specific supported claim');
    expect(milestone.referenceContent, 'Specific evidence content');
  });

  test('unsupported day-specific claims are evidence-qualified', () {
    const milestone = QuitMilestone(
      day: 180,
      title: 'Six months',
      description: 'Your immune system is back to full strength.',
      reference:
          'Effects of Opioid Tolerance and Withdrawal on the Immune System (PubMed)',
      link: 'https://pubmed.ncbi.nlm.nih.gov/18040801/',
      referenceContent: 'Overconfident content',
    );

    expect(milestone.isEvidenceQualified, isTrue);
    expect(milestone.description, contains('does not establish'));
    expect(milestone.description, isNot(contains('full strength')));
    expect(milestone.referenceContent, contains('Evidence note'));
    expect(
      milestone.referenceContent,
      isNot(contains('Overconfident content')),
    );
  });

  test('stale source URLs are normalized to current sources', () {
    const samhsa = QuitMilestone(
      day: 1,
      title: 'Day one',
      description: 'Description',
      reference: 'SAMHSA - Treating Sleep Problems of People in Recovery',
      link: 'https://store.samhsa.gov/sites/default/files/sma14-4859.pdf',
    );
    const mayo = QuitMilestone(
      day: 30,
      title: 'One month',
      description: 'Description',
      reference: 'Mayo Clinic - How Opioid Use Disorder Occurs',
      link:
          'https://www.mayoclinic.org/diseases-conditions/opioid-use-disorder/symptoms-causes/syc-20375440',
    );

    expect(
      samhsa.link,
      'https://library.samhsa.gov/sites/default/files/sma14-4859.pdf',
    );
    expect(
      mayo.link,
      'https://www.mayoclinic.org/diseases-conditions/prescription-drug-abuse/in-depth/how-opioid-addiction-occurs/art-20360372',
    );
  });

  test(
    'evidence-qualified copy follows Japanese and Chinese milestone titles',
    () {
      const japanese = QuitMilestone(
        day: 30,
        title: '30日目の回復',
        description: '元の説明',
        reference: 'Unsupported source',
        link: 'https://example.com',
      );
      const chinese = QuitMilestone(
        day: 30,
        title: '第30天恢复',
        description: '原说明',
        reference: 'Unsupported source',
        link: 'https://example.com',
      );

      expect(japanese.description, contains('30日目'));
      expect(chinese.description, contains('第30天'));
    },
  );
}
