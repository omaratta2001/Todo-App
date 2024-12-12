import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const.dart';
import '../controller/NoteHelper.dart';
import '../model/TodoModel.dart';
import 'DescriptionScreen.dart';
import 'FormScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    Note().db.then((value) {
      print("value$value");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor,
      appBar: AppBar(
        title: const Text("ToDo",
            style: TextStyle(
              color: textcolor,
              fontSize: fontLarge,
            )),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(RadiusCircular),
          bottomLeft: Radius.circular(RadiusCircular),
        )),
        backgroundColor: primarydarkcolor,
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: FutureBuilder(
            future: Note().getdb(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
                return (snapshot.data.length == 0)
                    ? Center(
                        child: Text(
                        "Your ToDo List is Empty😒😒",
                        style: TextStyle(color: textcolor, fontSize: fontLarge),
                      ))
                    : ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Expanded(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(RadiusCircular),
                                bottomLeft: Radius.circular(RadiusCircular),
                                topRight: Radius.circular(RadiusCircular),
                                topLeft: Radius.circular(RadiusCircular),
                              )),
                              color: Colors.transparent,
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(context, CupertinoPageRoute(
                                      builder: (BuildContext context) {
                                    return DescriptionScreen(
                                      description:
                                          "${snapshot.data[index].description}",
                                      title: "${snapshot.data[index].title}",
                                      done: "${snapshot.data[index].done}",
                                      date: "${snapshot.data[index].date}",
                                      id: "${snapshot.data[index].id}",
                                    );
                                  }));
                                },
                                title: Text(
                                  "${snapshot.data[index].title}",
                                  style: TextStyle(
                                      fontSize: fonttitel, color: textcolor),
                                ),
                                subtitle: Text(
                                  "${snapshot.data[index].date}",
                                  style: TextStyle(color: textcolor),
                                ),
                                trailing: IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: red,
                                  ),
                                  onPressed: () {
                                    Note()
                                        .deletedb(snapshot.data[index].id)
                                        .then((value) {
                                          setState(() {
                                            print("value$value");

                                          });
                                    });
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: primarycolor,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                );
              }
            },
          )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (BuildContext context) {
              return FormScreen();
            }));
          },
          child: const Icon(
            Icons.add,
            color: textcolor,
          )),
    );
  }
}
