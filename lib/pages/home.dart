import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
              )),
          centerTitle: true,
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              receiverSms();
            },
            color: Colors.lightBlueAccent,
            elevation: 10,
            child: Text('Status', style: TextStyle(fontSize: 20)),
          ),
        ));
  }

  void receiverSms() {
    SmsReceiver receiver = new SmsReceiver();
    receiver.onSmsReceived.listen((SmsMessage msg) => print(msg.body));
  }
}
