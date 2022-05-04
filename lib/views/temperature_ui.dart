import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TemperatureUI extends StatefulWidget {
  const TemperatureUI({Key? key}) : super(key: key);

  @override
  State<TemperatureUI> createState() => _TemperatureUIState();
}

class _TemperatureUIState extends State<TemperatureUI> {
  // ตัวแปรที่ใช้อ้้างอิงกับ radio ที่สัมพันธ์กัน ที่อยู่ groupValue เดียวกัน
  int tmpGroup = 1;

  //สร้างตัวแปรเก็บผลลัพธ์ที่ได้จากการคำนวณ
  String result = '0.00';

  //สร้างออฟเจ็กค์ควบคุม TextField
  TextEditingController tmpCtrl = TextEditingController(text: '');

  //แสดง dialog/msg/alert เตือน
  showWarningDialog(context, msg) {
//เรียกใช้งานฟังก์ชัน showDialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.deepPurple,
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ตกลง',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          'Temperature',
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap:() {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 70.0,
                ),
                Icon(
                  FontAwesomeIcons.temperatureHigh,
                  size: 100.0,
                  color: Colors.brown,
                ),
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50.0,
                  ),
                  child: TextField(
                    controller: tmpCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'อุณหภูมิ',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'ป้อนอุณหภูมิ (Cel หรือ Fah)',
                      labelStyle: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black45,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      activeColor: Colors.blue,
                      onChanged: (value) {
                        setState(() {
                          tmpGroup = int.parse(value.toString());
                        });
                      },
                      value: 1,
                      groupValue: tmpGroup,
                    ),
                    Text(
                      'แปลง Celcius เป็น Farenhite',
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      activeColor: Colors.blue,
                      onChanged: (value) {
                        setState(() {
                          tmpGroup = int.parse(value.toString());
                        });
                      },
                      value: 2,
                      groupValue: tmpGroup,
                    ),
                    Text(
                      'แปลง Farenhite เป็น Celcius ',
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    //Algorithm+logic
                    //ตรวจสอบว่าป้อนรึยัง
                    if (tmpCtrl.text.length == 0) {
                      //แสดง dialog/msg/alert เตือน
                      showWarningDialog(context, 'ป้อนอุณหภูมิด้วยนะ...!!');
                    } else {
                      //พร้อมคำนวณโดยต้องตรวจสอบว่าเลือก rasio ตัวไหน
                      if (tmpGroup == 1) {
                        //คำนวณ cel to fah สูตร f = (9/5*c)+ 32
                        double c = double.parse(tmpCtrl.text);
                        double f = (9 / 5 * c) + 32;
                        setState(() {
                          result = f.toStringAsFixed(2);
                        });
                      } else {
                        //คำนวณ fah to cel สูตร c = (f - 32)* 5/9
                        double f = double.parse(tmpCtrl.text);
                        double c = (f - 32) * 5 / 9;
                        setState(() {
                          result = c.toStringAsFixed(2);
                        });
                      }
                    }
                  },
                  child: Text(
                    'คำนวณ',
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width - 100.0,
                      50.0,
                    ),
                    primary: Colors.brown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        50.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  result,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
