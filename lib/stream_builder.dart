import 'dart:async';

import 'package:flutter/material.dart';

class StreamBuilderSecreen extends StatefulWidget {
  const StreamBuilderSecreen({super.key});

  @override
  State<StreamBuilderSecreen> createState() => _StreamBuilderSecreenState();
}

class _StreamBuilderSecreenState extends State<StreamBuilderSecreen> {
  List<String> list = [];
  StreamSocket streamSocket = StreamSocket();
  TextEditingController _messageController = TextEditingController();
  Stream<DateTime> generateNumber() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 3));
      yield DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("stream builder")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // StreamBuilder(
          //     stream: streamSocket.getResponse,
          //     builder:
          //         (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         // return CircleAvatar();
          //         return CircularProgressIndicator();
          //       } else if (snapshot.connectionState == ConnectionState.active ||
          //           snapshot.connectionState == ConnectionState.done) {
          //         if (snapshot.hasError) {
          //           return Text(snapshot.error.toString());
          //         } else if (snapshot.hasData) {
          //           return Text(
          //             snapshot.data.toString(),
          //             style: TextStyle(color: Colors.teal, fontSize: 36),
          //           );
          //         } else {
          //           return const Text('Empty data');
          //         }
          //       } else {
          //         return Text('State: ${snapshot.connectionState}');
          //       }
          //     }),
          Expanded(
            child: StreamBuilder(
              stream: streamSocket.getResponse,
              initialData: ['No data'],
              builder:
                  (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text('No data'));
                } else if (snapshot.hasError) {
                  return Text('error' + snapshot.error.toString());
                } else if (snapshot.connectionState == ConnectionState.active) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Text(snapshot.data![index].toString());
                        }),
                  );
                } else {
                  return Text('some thing went wrong');
                }
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: "Eenter message",
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    list.add(_messageController.text);
                    streamSocket.addResponse(list);
                    _messageController.clear();
                  },
                  icon: Icon(Icons.send))
            ],
          )
        ],
      ),
    );
  }
}

class StreamSocket {
  final _stream = StreamController<List<String>>.broadcast();
  void Function(List<String>) get addResponse => _stream.sink.add;
  Stream<List<String>> get getResponse => _stream.stream.asBroadcastStream();
}
