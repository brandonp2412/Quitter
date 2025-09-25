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
  DateTime _displayedMonth =
      DateTime.now(); // Add this to track displayed month
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
        _displayedMonth = DateTime(
          picked.year,
          picked.month,
          1,
        ); // Update displayed month
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

    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => _changeMonth(-1),
                icon: Icon(Icons.chevron_left, size: 30),
                tooltip: 'Previous Month',
              ),
              Text(
                DateFormat('MMMM yyyy').format(_displayedMonth),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              IconButton(
                onPressed: () => _changeMonth(1),
                icon: Icon(Icons.chevron_right, size: 30),
                tooltip: 'Next Month',
              ),
            ],
          ),
          SizedBox(height: 16),
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
                child: Stack(
                  children: [
                    if (isSelected)
                      Positioned(
                        right: 4,
                        top: 4,
                        child: Icon(Icons.check_circle, size: 16),
                      ),
                    if (isToday)
                      Positioned(
                        right: 4,
                        top: 4,
                        child: Icon(Icons.circle_outlined, size: 16),
                      ),
                    if (hasEntry)
                      Positioned(
                        right: 4,
                        bottom: 4,
                        child: Icon(
                          Icons.memory,
                          color: Theme.of(context).colorScheme.primary,
                          size: 16,
                        ),
                      ),
                    Container(
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.onSurface,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(child: Text('$day')),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.calendar_today, size: 30),
          onPressed: () => _selectDate(context),
          tooltip: 'Select Date',
        ),
        title: const Text('Journal', style: TextStyle(fontSize: 32)),
      ),
      body: ListView(
        children: [
          _buildCalendarGrid(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'How was your day?',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 16),
                SizedBox(
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        ),
                      ),
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
                ),
              ],
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
