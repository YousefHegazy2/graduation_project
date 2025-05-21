import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';

class ManagementWidget extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const ManagementWidget({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  State<ManagementWidget> createState() => _ManagementWidgetState();
}

class _ManagementWidgetState extends State<ManagementWidget> {
  bool isActive = false;
  bool isDeleted = false;

  @override
  Widget build(BuildContext context) {
    return isDeleted
        ? SizedBox.shrink()
        : Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(widget.imageUrl),
                  ),
                  title: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    widget.subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
               
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          shadowColor: Colors.grey,
                          backgroundColor: kPrimaryColorBlue,
                        ),
                        onPressed: () {
                          print('Show button pressed');
                        },
                        child: Text(
                          'Show',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Nunito",
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          shadowColor: Colors.grey,
                          backgroundColor: isActive ? Colors.green : Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            isActive = !isActive;
                          });
                        },
                        child: Text(
                          isActive ? "Active" : "Inactive",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Nunito",
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          shadowColor: Colors.grey,
                          backgroundColor: kPrimaryColorBlue,
                        ),
                        onPressed: () {
                          _showDeleteConfirmationDialog();
                        },
                        child: Text(
                          'Delete',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Nunito",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                 Padding(
                   padding: const EdgeInsets.only(top: 10),
                   child: Divider(),
                 ),
              ],
            ),
          );
  }

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Do you want to delete?'),
          content: Text('This action cannot be undone.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  isDeleted = true;
                });
                Navigator.of(context).pop();
              },
              child: Text('Done'),
            ),
          ],
        );
      },
    );
  }
}
