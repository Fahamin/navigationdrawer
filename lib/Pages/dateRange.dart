
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateRange extends StatefulWidget {
  const DateRange({Key? key}) : super(key: key);

  @override
  State<DateRange> createState() => _DateRangeState();
}

class _DateRangeState extends State<DateRange> {
  DateTimeRange? _selectedDateRange;

  // This function will be triggered when the floating button is pressed

  void _show() async {
    final DateTimeRange? result = await showDateRangePicker(
      initialDateRange: _selectedDateRange,
      context: context,
      firstDate: DateTime(2022, 1, 1),
      lastDate: DateTime(2030, 12, 31),
      currentDate: DateTime.now(),
      saveText: 'Done',
    );

    if (result != null) {
      // Rebuild the UI
      print(result.start.toString());
      setState(() {
        _selectedDateRange = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.red,
        ),
        title: Text("Date Picker"),
        centerTitle: true,
      ),
      body: _selectedDateRange == null
          ? Center(
              child: Text("Press the button to show the picker"),
            )
          : Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Star date : ${_selectedDateRange?.start.toString().split(' ')[0]}",
                    style: TextStyle(fontSize: 24, color: Colors.blue),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Star date : ${_selectedDateRange?.start.toString().split(' ')[0]}",
                    style: TextStyle(fontSize: 24, color: Colors.red),
                  )
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _show,
        child: Icon(Icons.date_range),
      ),
    );
  }
}
