import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateDialogs {
  static void showDate(
      BuildContext context, final Function(DateTime dateTime) onSelected) {
    showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      elevation: 0,
      backgroundColor: Colors.amber,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Start Date',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 16),
                SfDateRangePicker(
                  onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
                    onSelected(dateRangePickerSelectionChangedArgs.value);
                    Navigator.pop(context);
                  },
                  onSubmit: (p0) {
                    Navigator.pop(context);
                  },
                  onCancel: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
