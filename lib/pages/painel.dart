import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

class Painel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Painel',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            )),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Ações',
              style: TextStyle(fontSize: 16),
            ),
            RaisedButton(
              onPressed: () {
                sendsms('0094I');
              },
              color: Colors.lightBlueAccent,
              elevation: 10,
              child: Text('Status', style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 30),
            Text(
              'Ações',
              style: TextStyle(fontSize: 16),
            ),
            RaisedButton(
              color: Colors.lightBlueAccent,
              elevation: 10,
              onPressed: () {
                sendsms('0094A');
              },
              child: const Text('Ativar', style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 30),
            Text(
              'Ações',
              style: TextStyle(fontSize: 16),
            ),
            RaisedButton(
              color: Colors.lightBlueAccent,
              elevation: 10,
              onPressed: () {
                sendsms('0094D');
              },
              child: const Text('Desativar', style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  void sendsms(String action) {
    SmsSender sender = new SmsSender();
    String address = "031984313951";
    SmsMessage message = new SmsMessage(address, action);
    message.onStateChanged.listen((state) {
      if (state == SmsMessageState.Sent) {
        print("SMS is sent!" + action);
      } else if (state == SmsMessageState.Delivered) {
        print("SMS is delivered!");
      }
    });
    sender.sendSms(message);
  }
}
