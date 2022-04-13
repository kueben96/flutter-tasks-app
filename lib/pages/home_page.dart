import 'package:flutter/material.dart';
import 'package:task_manager/pages/calendar_page.dart';
import 'package:task_manager/pages/checked_page.dart';
import 'package:task_manager/pages/search_page.dart';
import 'package:task_manager/pages/tasks_screen.dart';
import 'package:task_manager/tasks_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKeyAddTask = GlobalKey<FormState>();
  var _selectedIndex = 0;

  final _stati = ["To-Do", "In Progress", "Done"];
  final _priorities = ["Normal", "Urgent"];
  var _priority;
  var _status;
  var _date;
  TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  final _pages = [TasksPage(), SearchPage(), CheckedPage(), CalendarPage()];

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2019, 8),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        var date =
            "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
        _dateController.text = date;
      });
  }

  Future<void> showAddTaskDialog(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              title: Align(
                alignment: Alignment.center,
                child: Text(
                  "Add Task",
                  style: TasksTheme.of(context).fontStyleHeader24,
                ),
              ),
              children: [
                Form(
                    key: _formKeyAddTask,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "What's to-do?",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: DropdownButtonFormField(
                            items: _stati.map((String status) {
                              return new DropdownMenuItem(
                                value: status,
                                child: Text(status),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              // do other stuff with _category
                              setState(() => _status = newValue);
                            },
                            value: _status,
                            decoration: InputDecoration(
                              labelText: "What's the status?",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: DropdownButtonFormField(
                            items: _priorities.map((String status) {
                              return new DropdownMenuItem(
                                value: status,
                                child: Text(status),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              // do other stuff with _category
                              setState(() => _priority = newValue);
                            },
                            value: _status,
                            decoration: InputDecoration(
                              labelText: "What's your priority?",
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _selectDate(context),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: AbsorbPointer(
                              child: TextFormField(
                                onSaved: (val) {
                                  _date = selectedDate;
                                },
                                controller: _dateController,
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  labelText: "Date",
                                  icon: Icon(Icons.calendar_today),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return "Please enter a date for your task";
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                              keyboardType: TextInputType.multiline,
                              minLines: 4,
                              maxLines: 5,
                              decoration: InputDecoration(
                                labelText: "More details?",
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton.icon(
                                  icon: Icon(Icons.add),
                                  style: TextButton.styleFrom(
                                      primary: TasksTheme.whiteColor,
                                      backgroundColor:
                                          TasksTheme.staticPurpleColor),
                                  label: Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Text("Add Task")),
                                  onPressed: () {},
                                ),
                                TextButton(
                                  child: Text("Cancel"),
                                  style: TextButton.styleFrom(
                                      primary: TasksTheme.staticPurpleColor),
                                  onPressed: () {},
                                ),
                              ]),
                        ),
                      ],
                    )),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showAddTaskDialog(context);
        },
        child: Icon(Icons.add_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 25.0,
        showUnselectedLabels: false,

        // unselectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Theme.of(context).accentColor,
        selectedIconTheme: IconThemeData(size: 27),
        selectedItemColor: Theme.of(context).accentColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: "Check"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_rounded), label: "Calendar"),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
