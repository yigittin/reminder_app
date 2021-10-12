import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:reminder_app/ui/theme.dart';

import 'widgets/input_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 5,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add Task", style: headingStyle),
              const MyInputField(hint: "Enter your title", title: "Title"),
              MyInputField(hint: "Enter your note", title: "Note"),
              MyInputField(
                hint: DateFormat.yMd().format(_selectedDate),
                title: "Date",
                widget: IconButton(
                  onPressed: () {
                    _getDateFromUser();
                  },
                  icon: Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage("images/profile.png"),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2121),
    );
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {}
  }
}