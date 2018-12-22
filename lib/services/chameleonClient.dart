import 'dart:typed_data';
import 'dart:convert';
import 'dart:async';
import 'package:usb_serial/usb_serial.dart';

class ChameleonClient {
  final asciiCodec = AsciiCodec();
  UsbPort port;
  StreamSubscription<Uint8List> subcription;

  ChameleonClient([this.port]);

  _emptyEvent(Uint8List data) { }

  Future close() async {
    await port?.close();
    port = null;
    subcription = null;
  }

  Future<String> sendCommand(String cmd) async {
    var data = asciiCodec.encode('$cmd\r\n');
    var c = new Completer<String>();
    if (subcription == null)
      subcription = port.inputStream.listen(_emptyEvent);
    subcription.onData((bytes) {
      var str = asciiCodec.decode(bytes);
      var strs = str.split('\r\n').where((s) => s.isNotEmpty).toList();
      if (strs.length == 1 &&
          str[0] != '100:OK' &&
          str[0] != '101:OK WITH TEXT') {
        c.completeError(str[0]);
      } else {
        c.complete(strs[strs.length - 1]);
      }
      subcription.onData(_emptyEvent);
    });
    await port.write(data);
    return await c.future;
  }

  Future<String> version() => sendCommand('VERSIONMY?');

  Future<void> active(int index) async => await sendCommand('SETTINGMY=$index');

  Future<int> getActive() async {
    var result = await sendCommand('SETTINGMY?');
    return int.parse(result[result.length - 1]);
  }

  Future<List<String>> getAvailableCommands() async {
    var result = await sendCommand('HELPMY');
    return result.split(',');
  }

  Future<List<String>> getButtonModes() async {
    var result = await sendCommand('BUTTONMY');
    return result.split(',');
  }

  Future<List<String>> getLongPressButtonModes() async {
    var result = await sendCommand('BUTTON_LONGMY');
    return result.split(',');
  }

  Future<String> getMemorySize() => sendCommand('MEMSIZEMY?');

  Future<String> getUid() => sendCommand('UIDMY?');

  Future<void> setUid(String uid) => sendCommand('UIDMY=$uid');

  Future<String> getMode() => sendCommand('CONFIGMY?');

  Future<void> setMode(String mode) => sendCommand('CONFIGMY=$mode');

  Future<String> getButton() => sendCommand('BUTTONMY?');

  Future<void> setButton(String mode) => sendCommand('BUTTONMY=$mode');

  Future<String> getLongPressButton() => sendCommand('BUTTON_LONG?');

  Future<void> setLongPressButton(String mode) => sendCommand('BUTTON_LONG=$mode');
}