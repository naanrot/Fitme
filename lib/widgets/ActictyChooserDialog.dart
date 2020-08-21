import 'package:flutter/material.dart';

class ActivityChooserDialog extends StatelessWidget {
  final value;
  ActivityChooserDialog(this.value);

  final Map<int, String> activityMap = {1:"No Exercise", 2:"Less Exercise", 3:"Moderate Exercise", 4:"Daily"};

  @override
  Widget build(BuildContext context) {
    return Dialog (
      child: buildDialog(context, value),
    );
  }

  buildDialog(context, value) {
    String initial = activityMap[value];

    return DropdownButton<String>(
      value: initial,
      icon: Icon(Icons.directions_bike),
      onChanged: (val) {
        int index = activityMap.keys.firstWhere((k) => activityMap[k] == val, orElse: () => 1);
        Navigator.pop(context, index);
      },
      items: <String>[
        'No Exercise',
        'Less Exercise',
        'Moderate Exercise',
        'Daily'
      ].map<DropdownMenuItem<String>>(
          (val) {
            return DropdownMenuItem (
              value: val,
              child: Text (
                val,
              ),
            );
          }
      ).toList(),
    );
  }

  backPressed(context, val) {
    Navigator.pop(context, val);
  }
}
