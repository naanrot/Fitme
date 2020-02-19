import 'package:flutter/material.dart';

import 'build_bottom_view.dart';
import 'build_sliver_app_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Stack(
            children: <Widget>[
              CustomScrollView(
                slivers: <Widget>[
                  BuildSliverAppBar(),
                  BuildSliverList(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}