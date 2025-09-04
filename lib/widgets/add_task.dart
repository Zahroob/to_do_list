import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key, required this.onTaskAdded});
  final void Function(String) onTaskAdded;

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController _taskController = TextEditingController();

  void _handleTaskSubmit(BuildContext context, String task) {
    if (task.isNotEmpty) {
      widget.onTaskAdded(task);
      _taskController.clear();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Task added successfully')));
      
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            style: TextStyle(color: Colors.red),
            'Please enter a task',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                insetPadding: EdgeInsets.symmetric(horizontal: 10),
                content: Container(
                  constraints: const BoxConstraints(
                    minHeight: 200,
                    minWidth: 250,
                    maxHeight: 250,
                    maxWidth: 300,
                  ),
                  padding: const EdgeInsets.all(16),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _bottomSheetHeader(),
                          const Flexible(
                            fit: FlexFit.loose,
                            child: SizedBox(height: 10),
                          ),
                          _taskInputField(),
                          const Flexible(
                            fit: FlexFit.loose,
                            child: SizedBox(height: 10),
                          ),
                          _buildTaskDialogButtons(context),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: _buildOpenAddDialogButton(),
      ),
    );
  }

  CircleAvatar _buildOpenAddDialogButton() {
    return CircleAvatar(
      radius: 12,
      backgroundColor: Colors.redAccent,
      child: CircleAvatar(
        radius: 10,
        backgroundColor: Colors.white,
        child: const Icon(Icons.add, color: Color(0xFFB85124), size: 16),
      ),
    );
  }

  Row _buildTaskDialogButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
          style: TextButton.styleFrom(backgroundColor: Color(0xFFD32F2F)),
          onPressed: () {
            _taskController.clear();
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close),
          label: const Text('Cancel'),
        ),
        SizedBox(width: 8),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFF7043)),
          onPressed: () {
            final task = _taskController.text.trim();
            _handleTaskSubmit(context, task);
          },
          icon: const Icon(Icons.save),
          label: const Text('Save'),
        ),
      ],
    );
  }

  TextFormField _taskInputField() {
    return TextFormField(
      controller: _taskController,
      decoration: const InputDecoration(
        labelText: 'Enter your task',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
    );
  }

  Row _bottomSheetHeader() {
    return Row(
      children: const [
        Icon(Icons.add_task, color: Color(0xFFD32F2F)),
        SizedBox(width: 8),
        Text(
          'Add Task',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFF7043),
          ),
        ),
      ],
    );
  }
}
