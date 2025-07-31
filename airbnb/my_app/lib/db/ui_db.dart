import 'package:flutter/material.dart';
import 'package:my_app/db/dao/user_dao.dart';
import 'package:my_app/db/table/user_table.dart';

class UiDb extends StatefulWidget {
  const UiDb({super.key});

  @override
  State<UiDb> createState() => _UiDbState();
}

class _UiDbState extends State<UiDb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 300),
          ElevatedButton(
            onPressed: () {
              createUserTable();
            },
            child: Text("Create Table"),
          ),
          ElevatedButton(
            onPressed: () async {
              var ket_qua = await getUsers();
              print(ket_qua);
            },
            child: Text("Delete Data"),
          ),
          ElevatedButton(
            onPressed: () {
              // insertUser(user);
            },
            child: Text("Select Data"),
          ),
        ],
      ),
    );
  }
}
