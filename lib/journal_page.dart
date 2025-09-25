import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  final TextEditingController _entryController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  DateTime _displayedMonth = DateTime.now();
  List<DateTime> _datesWithEntries = [];

  @override
  void initState() {
    super.initState();
    _loadEntry();
    _loadDatesWithEntries();
  }

  Future<void> _loadEntry() async {
    final prefs = await SharedPreferences.getInstance();
    final dateKey = _formatDateKey(_selectedDate);
    final entry = prefs.getString('journal_$dateKey') ?? '';

    setState(() {
      _entryController.text = entry;
    });
  }

  Future<void> _saveEntry() async {
    final prefs = await SharedPreferences.getInstance();
    final dateKey = _formatDateKey(_selectedDate);

    if (_entryController.text.trim().isNotEmpty) {
      await prefs.setString('journal_$dateKey', _entryController.text);

      if (!_datesWithEntries.any((date) => _isSameDay(date, _selectedDate))) {
        _datesWithEntries.add(_selectedDate);
        await _saveDatesWithEntries();
      }
    } else {
      await prefs.remove('journal_$dateKey');
      _datesWithEntries.removeWhere((date) => _isSameDay(date, _selectedDate));
      await _saveDatesWithEntries();
    }
  }

  Future<void> _loadDatesWithEntries() async {
    final prefs = await SharedPreferences.getInstance();
    final datesString = prefs.getStringList('journal_dates') ?? [];

    setState(() {
      _datesWithEntries = datesString
          .map((dateStr) => DateTime.parse(dateStr))
          .toList();
    });
  }

  Future<void> _saveDatesWithEntries() async {
    final prefs = await SharedPreferences.getInstance();
    final datesString = _datesWithEntries
        .map((date) => date.toIso8601String())
        .toList();
    await prefs.setStringList('journal_dates', datesString);
  }

  String _formatDateKey(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (picked != null && !_isSameDay(picked, _selectedDate)) {
      setState(() {
        _selectedDate = picked;
        _displayedMonth = DateTime(picked.year, picked.month, 1);
      });
      await _loadEntry();
    }
  }

  void _changeMonth(int monthDelta) {
    setState(() {
      _displayedMonth = DateTime(
        _displayedMonth.year,
        _displayedMonth.month + monthDelta,
        1,
      );
    });
  }

  Widget _buildCalendarGrid() {
    final firstDayOfMonth = DateTime(
      _displayedMonth.year,
      _displayedMonth.month,
      1,
    );
    final lastDayOfMonth = DateTime(
      _displayedMonth.year,
      _displayedMonth.month + 1,
      0,
    );
    final daysInMonth = lastDayOfMonth.day;
    final firstWeekday = firstDayOfMonth.weekday % 7;
    final now = DateTime.now();

    final calendarGradient = [
      Theme.of(context).primaryColor,
      Theme.of(context).primaryColor.withValues(alpha: 0.7),
    ];

    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: calendarGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withAlpha(255 ~/ (1 / 0.3)),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(
            context,
          ).colorScheme.surface.withAlpha(255 ~/ (1 / 0.95)),
        ),
        child: Column(
          children: [
            // Month navigation header
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: calendarGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(255 ~/ (1 / 0.2)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        onPressed: () => _changeMonth(-1),
                        icon: Icon(
                          Icons.chevron_left,
                          size: 28,
                          color: Colors.white,
                        ),
                        tooltip: 'Previous Month',
                      ),
                    ),
                    Text(
                      DateFormat('MMMM yyyy').format(_displayedMonth),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(255 ~/ (1 / 0.2)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        onPressed: () => _changeMonth(1),
                        icon: Icon(
                          Icons.chevron_right,
                          size: 28,
                          color: Colors.white,
                        ),
                        tooltip: 'Next Month',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
                  .map(
                    (day) => Expanded(
                      child: Center(
                        child: Text(
                          day,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: calendarGradient.first,
                              ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 8),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 1,
              ),
              itemCount: firstWeekday + daysInMonth,
              itemBuilder: (context, index) {
                if (index < firstWeekday) {
                  return Container();
                }

                final day = index - firstWeekday + 1;
                final date = DateTime(
                  _displayedMonth.year,
                  _displayedMonth.month,
                  day,
                );
                final hasEntry = _datesWithEntries.any(
                  (d) => _isSameDay(d, date),
                );
                final isSelected = _isSameDay(date, _selectedDate);
                final isToday = _isSameDay(date, now);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDate = date;
                    });
                    _loadEntry();
                  },
                  child: Container(
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      gradient: isSelected
                          ? LinearGradient(
                              colors: calendarGradient,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                          : null,
                      color: isToday && !isSelected
                          ? calendarGradient.first.withAlpha(255 ~/ (1 / 0.2))
                          : null,
                      border: hasEntry && !isSelected
                          ? Border.all(color: calendarGradient.first, width: 2)
                          : null,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            '$day',
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : Theme.of(context).colorScheme.onSurface,
                              fontWeight: isSelected || isToday
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                        if (hasEntry && !isSelected)
                          Positioned(
                            right: 4,
                            bottom: 4,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: calendarGradient.first,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final journalGradient = [
      Theme.of(context).colorScheme.tertiary,
      Theme.of(context).colorScheme.tertiary.withValues(alpha: 0.7),
    ];

    return Scaffold(
      body: ListView(
        children: [
          _buildCalendarGrid(),
          Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: journalGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: journalGradient.first.withAlpha(255 ~/ (1 / 0.3)),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(
                  context,
                ).colorScheme.surface.withAlpha(255 ~/ (1 / 0.95)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with date
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: journalGradient,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.edit_note, color: Colors.white, size: 24),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'How was your day?',
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                DateFormat(
                                  'EEEE, MMMM d, yyyy',
                                ).format(_selectedDate),
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: Colors.white.withAlpha(
                                        255 ~/ (1 / 0.8),
                                      ),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  // Text field
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: journalGradient.first.withAlpha(
                          255 ~/ (1 / 0.3),
                        ),
                        width: 1,
                      ),
                    ),
                    child: SizedBox(
                      height: 300,
                      child: TextField(
                        onChanged: (value) => _saveEntry(),
                        controller: _entryController,
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                          hintText:
                              'Write about your day, thoughts, feelings, or anything you want to remember...',
                          hintStyle: TextStyle(
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withAlpha(255 ~/ (1 / 0.5)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: journalGradient.first,
                              width: 2,
                            ),
                          ),
                          contentPadding: EdgeInsets.all(20),
                          filled: true,
                          fillColor: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Entry stats
                  if (_entryController.text.trim().isNotEmpty)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: journalGradient.first.withAlpha(
                          255 ~/ (1 / 0.1),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.text_fields,
                            size: 16,
                            color: journalGradient.first,
                          ),
                          SizedBox(width: 8),
                          Text(
                            '${_entryController.text.trim().split(' ').length} words',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: journalGradient.first,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _entryController.dispose();
    super.dispose();
  }
}
