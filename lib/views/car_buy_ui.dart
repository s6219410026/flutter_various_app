import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CarBuyUI extends StatefulWidget {
  const CarBuyUI({Key? key}) : super(key: key);

  @override
  State<CarBuyUI> createState() => _CarBuyUIState();
}

class _CarBuyUIState extends State<CarBuyUI> {
  //ประกาศหรือสร้างตัวแปรเพื่อใช้อ้างอิง groupValue ของ Radio ที่สัมพันธ์
  int downValue = 1;

  //สร้างตัวแปรเพื่อเก็บข้อมูลรายการที่จะเอาไปใช้กับ Dropdown
  List<DropdownMenuItem<String>> items = [
    '1 ปี (12 งวด)',
    '2 ปี (24 งวด)',
    '3 ปี (36 งวด)',
    '4 ปี (48 งวด)',
    '5 ปี (60 งวด)',
    '6 ปี (72 งวด)',
  ]
      .map((e) => DropdownMenuItem<String>(
            value: e,
            child: Text(e),
          ))
      .toList();

  //  สร้างตัวแปรเก็บค่าของ Dropdown ที่ถูกเลือก
  String yearSep = '1 ปี (12 งวด)';

  //สร้างตัวแปรเก็บข้อมูลที่จะแสดงผล เงินดาวน์ ยอดจัด ค่างวด
  String moneyDown = '0.00';
  String moneyJud = '0.00';
  String payPerMonth = '0.00';

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

  //สร้างออฟเจ็กต์ที่เป็นตัวคอนโทรลเลอร์ควบคุม TextField
  TextEditingController carPriceCtrl = TextEditingController(text:'');
  TextEditingController interestPerYearCtrl = TextEditingController(text:'');



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Car Buy',
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  'คำนวณค่างวดรถ',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Icon(
                  FontAwesomeIcons.car,
                  color: Colors.black,
                  size: 120.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 5.0,
                  width: MediaQuery.of(context).size.width - 80.0,
                  color: Colors.blue,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'ข้อมูลรถ',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'ราคารถ (บาท)',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                  ),
                  child: TextField(
                    controller: carPriceCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      hintText: '0.00',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'เงินดาว (%)',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  child: Row(
                    children: [
                      Radio(
                        onChanged: (value) {
                          setState(() {
                            downValue = int.parse(value.toString());
                          });
                        },
                        value: 1,
                        groupValue: downValue,
                        activeColor: Colors.blue,
                      ),
                      Text(
                        '10%',
                      ),
                      Radio(
                        onChanged: (value) {
                          setState(() {
                            downValue = int.parse(value.toString());
                          });
                        },
                        value: 2,
                        groupValue: downValue,
                        activeColor: Colors.blue,
                      ),
                      Text(
                        '20%',
                      ),
                      Radio(
                        onChanged: (value) {
                          setState(() {
                            downValue = int.parse(value.toString());
                          });
                        },
                        value: 3,
                        groupValue: downValue,
                        activeColor: Colors.blue,
                      ),
                      Text(
                        '30%',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'จำนวนปีที่ผ่อน',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    items: items,
                    onChanged: (value) {
                      setState(() {
                        yearSep = value.toString();
                      });
                    },
                    value: yearSep,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'ดอกเบี้ย (%) ต่อปี',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                  ),
                  child: TextField(
                    controller: interestPerYearCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      hintText: '0.00',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  height: 5.0,
                  width: MediaQuery.of(context).size.width - 80.0,
                  color: Colors.blue,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'ผลลัพธ์',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            //ตรวจสอบว่าป้อนครบหรือยัง
                            //if(carPriceCtrl.text.isEmpty)
                            if(carPriceCtrl.text.length == 0) {
                              showWarningDialog(context, "ป้อนราคารถด้วยนะครับ");
                            }else if (interestPerYearCtrl.text.isEmpty) {
                              showWarningDialog(context, "ป้อนดอกเบี้ยด้วยนะครับ");
                            }else{
                              //พร้อมคำนวณ
                              //คำนวณเงินดาวน์ = ราคารถ * เงินดาวน์(%) / 100
                              double downMoneyPay = 0;
                              if( downValue == 1){
                                downMoneyPay = double.parse(carPriceCtrl.text) * 10 / 100;
                                setState(() {
                                  moneyDown = downMoneyPay.toString();
                                });
                              }else if(downValue == 2){
                                downMoneyPay = double.parse(carPriceCtrl.text) * 20 / 100;
                                setState(() {
                                  moneyDown = downMoneyPay.toString();
                                });
                              }else{
                                downMoneyPay = double.parse(carPriceCtrl.text) * 30 / 100;
                                setState(() {
                                  moneyDown = downMoneyPay.toString();
                                });
                              }
                              //คำนวณยอดจัด = ราคารถ - เงินดาวน์
                              double judMnoeyPay = double.parse(carPriceCtrl.text) - downMoneyPay;
                              setState(() {
                                moneyJud = judMnoeyPay.toString();
                              });
                              //คำนวณค่างวดต่อเดือน = (ราคารถ + (ยอดจัด * ดอกเบี้ย % ต่อปี / 100 * จำนวนปี)) / จำนวนงวด
                              double calPayMoneyParMonth = 0;
                              if( yearSep == '1 ปี (12 งวด)' ){
                                double cp = double.parse(carPriceCtrl.text);
                                double inpy = double.parse(interestPerYearCtrl.text);
                                calPayMoneyParMonth = (cp + (judMnoeyPay * inpy / 100 * 1)) / 12;
                              }else if (yearSep == '2 ปี (24 งวด)'){
                                double cp = double.parse(carPriceCtrl.text);
                                double inpy = double.parse(interestPerYearCtrl.text);
                                calPayMoneyParMonth = (cp + (judMnoeyPay * inpy / 100 * 2)) / 24;
                              }else if (yearSep == '3 ปี (36 งวด)'){
                                double cp = double.parse(carPriceCtrl.text);
                                double inpy = double.parse(interestPerYearCtrl.text);
                                calPayMoneyParMonth = (cp + (judMnoeyPay * inpy / 100 * 3)) / 36;
                              }else if (yearSep == '4 ปี (48 งวด)'){
                                double cp = double.parse(carPriceCtrl.text);
                                double inpy = double.parse(interestPerYearCtrl.text);
                                calPayMoneyParMonth = (cp + (judMnoeyPay * inpy / 100 * 4)) / 48;
                              }else if (yearSep == '5 ปี (60 งวด)'){
                                double cp = double.parse(carPriceCtrl.text);
                                double inpy = double.parse(interestPerYearCtrl.text);
                                calPayMoneyParMonth = (cp + (judMnoeyPay * inpy / 100 * 5)) / 60;
                              }else {
                                 double cp = double.parse(carPriceCtrl.text);
                                double inpy = double.parse(interestPerYearCtrl.text);
                                calPayMoneyParMonth = (cp + (judMnoeyPay * inpy / 100 * 6)) / 72;
                              }
                              setState(() {
                                payPerMonth = calPayMoneyParMonth.toStringAsFixed(2);
                              });

                            }
                          },
                          child: Text(
                            'คำนวณ',
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'รีเซ็ต',
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'เงินดาวน์ (บาท)',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        moneyDown,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 40.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'ยอดจัดไฟแนนช์ (บาท)',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        moneyJud,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 40.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'ค่างวดต่อเดือน (บาท)',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        payPerMonth,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 40.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 70.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
