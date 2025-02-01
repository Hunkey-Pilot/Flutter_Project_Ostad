import 'package:flutter/material.dart';
import 'main.dart';

class Homepage extends State<HomeActivity> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  alertDialog(context, index) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
              child: AlertDialog(
                title: Text("Confirmation"),
                content: Text("Are you sure for Delete?"),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.signal_cellular_no_sim_outlined,
                        color: Colors.blue,
                      )),
                  IconButton(
                      onPressed: () {
                        _removeContact(index);
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.blue,
                      ))
                ],
              ));
        });
  }

  List<Map<String, String>> _contactList = [];

  _addContact() {
    setState(() {
      if (_nameController.text.isNotEmpty &&
          _numberController.text.isNotEmpty) {
        _contactList.add(
            {"name": _nameController.text, "number": _numberController.text});
      }
      _nameController.clear();
      _numberController.clear();
    });
  }

  _removeContact(int index) {
    setState(() {
      _contactList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text(
            "Contact List",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),

        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    hintText: "Name", border: OutlineInputBorder()),
              ),

              SizedBox(height: 5),

              TextField(
                controller: _numberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Number", border: OutlineInputBorder()),
              ),

              SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    onPressed: () => _addContact(),
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    )),
              ),

              SizedBox(height: 40),

              Expanded(
                child: ListView.builder(
                    itemCount: _contactList.length,
                    itemBuilder: (context, index) {
                      Divider(color: Colors.black);
                      return Column(
                        children: [
                          Container(

                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(.3)),
                              child: ListTile(

                                title: Text(_contactList[index]["name"]!,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 20),
                                ),

                                subtitle: Text(
                                  _contactList[index]["number"]!,
                                  style: TextStyle(fontSize: 15),
                                ),

                                trailing: Icon(Icons.call,
                                    color: Colors.blue, size: 30),
                                leading: Icon(Icons.person,
                                    color: Colors.brown, size: 40),
                                onLongPress: () => alertDialog(context, index),
                              )),

                          Divider(
                            height: 7,
                          ),
                        ],
                      );
                    }),
              )
            ],
          ),
        ));
  }
}