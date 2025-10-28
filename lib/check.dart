import 'package:flutter/material.dart';
import 'package:to_dolist/addtask.dart';
import 'package:to_dolist/tasks.dart';

class CheckScreen extends StatefulWidget {
  const CheckScreen({Key? key}) : super(key: key);

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

int selectindex = 0;

class _CheckScreenState extends State<CheckScreen> {
  List<bool> isCheckedList = List.filled(Tasks.Task.length, false);

  double get progress {
    int completedTasks = isCheckedList.where((checked) => checked).length;
    return completedTasks / isCheckedList.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16, top: 50),
                child: const Text(
                  "Good Morning , Ali",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 16, top: 5),
                child: const Text(
                  "Monday, July 14",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xff999999),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 24),
                margin: const EdgeInsets.only(left: 16),
                child: const Text(
                  "My day progress",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 24),
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: LinearProgressIndicator(
                  value: progress,
                  color: const Color(0xff007AFF),
                  backgroundColor: const Color(0xffE0E0E0),
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                margin: const EdgeInsets.only(left: 35),
                child: Text(
                  "${isCheckedList.where((e) => e).length}/${isCheckedList.length} Tasks Completed",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xff999999),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(13),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.3),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectindex == 1 ? "Completed Tasks" : "Tasks",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (selectindex == 1 &&
                        isCheckedList.where((e) => e).isEmpty)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "No completed tasks yet 🎉",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      )
                    else
                      SizedBox(
                        height: 300,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            if (selectindex == 1 && !isCheckedList[index]) {
                              return const SizedBox.shrink();
                            }
                            return Row(
                              children: [
                                Checkbox(
                                  value: isCheckedList[index],
                                  onChanged: (value) {
                                    setState(() {
                                      isCheckedList[index] = value!;
                                    });
                                  },
                                ),
                                Expanded(
                                  child: Text(
                                    Tasks.Task[index].text,
                                    style: TextStyle(
                                      fontSize: 18,
                                      decoration: isCheckedList[index]
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemCount: Tasks.Task.length,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (val) {
          setState(() {
            selectindex = val;
          });
        },
        currentIndex: selectindex,
        selectedItemColor: const Color(0xff007AFF),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline_sharp),
            label: 'Completed',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff007AFF),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(25)),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: const AddTask(),
              ),
            ),
          );
        },
      ),
    );
  }
}
