import 'package:app_1/Widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../Widgets/spacing.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacing(),
            CustomButton(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("hbdsjahsdashbdjhabdjhabdjh")),
                );
              },
              text: "Show Toast/ Sbackbar",
              buttonColor: Colors.amber,
            ),
            Spacing(),
            CustomButton(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("alert hai"),
                    content: Text("This is connten"),
                    actions: [
                      CustomButton(
                        onTap: () => Navigator.pop(context),
                        text: "Close",
                      ),
                    ],
                  ),
                );
              },
              text: "Show Alert",
              textColor: Colors.white,
              buttonColor: Colors.black,
            ),
            Spacing(),
            CustomButton(
              onTap: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime(2021, 7, 25),
                  firstDate: DateTime(2021),
                  lastDate: DateTime(2022),
                );
                print(pickedDate);
              },
              text: "Show Picker",
              buttonColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
