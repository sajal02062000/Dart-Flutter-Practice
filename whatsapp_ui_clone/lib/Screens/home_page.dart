import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui_clone/Constants/custom_colors.dart';
import 'package:whatsapp_ui_clone/Providers/api_provider.dart';

import '../Helpers/dbhelper.dart';
import '../Widgets/styled_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override
  // void initState() {
  //   super.initState();
  //   context.read<ApiProvider>().getApiData(context: context);
  // }

  final dbhelper = Databasehelper.instance;

  void insertData() async {
    Map<String, dynamic> row = {
      Databasehelper.columnName: "Sajal",
      Databasehelper.columnAge: 21,
    };
    final id = await dbhelper.insert(row);
    print(id);
  }

  void queryAllData() async {
    var allRows = await dbhelper.queryAll();
    // allRows.forEach((element) {
    print(allRows.toString());
    // });
  }

  void querySpecificData() async {
    var allRows = await dbhelper.querySpecific(3);
    allRows.forEach((element) {
      print(allRows.toString());
    });
  }

  void deleteData() async {
    var reply = await dbhelper.deleteData(3);
    print(reply);
  }

  void updateData() async {
    var reply = await dbhelper.update(1);
    print(reply);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.darkGreen,
        title: StyledText(
          text: "Whatsapp UI Clone",
          fontSize: 18,
          fontColor: CustomColors.white,
        ),
      ),
      body: Visibility(
        replacement: Center(child: CircularProgressIndicator()),
        visible: !context.watch<ApiProvider>().isLoading,
        child: ListView(
          shrinkWrap: true,
          children: [
            ElevatedButton(
              onPressed: () {
                insertData();
              },
              child: Text("Insert"),
            ),
            ElevatedButton(
              onPressed: () {
                queryAllData();
              },
              child: Text("Query"),
            ),
            ElevatedButton(
              onPressed: () {
                querySpecificData();
              },
              child: Text("Query Specific"),
            ),
            ElevatedButton(
              onPressed: () {
                updateData();
              },
              child: Text("Update"),
            ),
            ElevatedButton(
              onPressed: () {
                deleteData();
              },
              child: Text("Delete"),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     context.read<ApiProvider>().loginWithGoogle(context: context);
            //   },
            //   child: StyledText(text: "Login with google"),
            // ),
            // ...context.watch<ApiProvider>().apiData.map(
            //   (e) => Container(
            //     decoration: BoxDecoration(border: Border.all()),
            //     child: Row(
            //       children: [
            //         Expanded(child: StyledText(text: e.title, maxLines: 4)),
            //         Icon(
            //           e.completed ? Icons.check : Icons.check_box_outline_blank,
            //           color: e.completed
            //               ? CustomColors.darkGreen
            //               : CustomColors.red,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
