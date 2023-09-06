// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_share_app/views/show_money_share_ui.dart';

class InputMoneyShareUI extends StatefulWidget {
  const InputMoneyShareUI({super.key});

  @override
  State<InputMoneyShareUI> createState() => _InputMoneyShareUIState();
}

class _InputMoneyShareUIState extends State<InputMoneyShareUI> {
  TextEditingController moneyCtrl = TextEditingController(text: '');
  TextEditingController personCtrl = TextEditingController(text: '');
  TextEditingController tipCtrl = TextEditingController(text: '');

  bool tipCheck = false;

  _showWarningDialog(context, msg) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Color.fromARGB(255, 224, 79, 95),
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
                style: GoogleFonts.itim(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
            textAlign: TextAlign.center,
            style: GoogleFonts.itim(
              color: Color.fromARGB(255, 224, 79, 95),
              fontSize: MediaQuery.of(context).size.width * 0.05,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 224, 79, 95),
                  ),
                  child: Text(
                    'ตกลง',
                    style: GoogleFonts.itim(),
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
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 246, 165, 165),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 246, 79, 95),
          title: Text(
            "แชร์เงินกันเถอะ",
            style: GoogleFonts.itim(
              fontSize: MediaQuery.of(context).size.width * 0.06,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                Image.asset(
                  'assets/images/wallet.png',
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.15,
                    right: MediaQuery.of(context).size.width * 0.15,
                    top: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: TextField(
                    controller: moneyCtrl,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.itim(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 246, 79, 95),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 246, 79, 95),
                        ),
                      ),
                      hintText: "ป้อนจำนวนเงิน (บาท)",
                      hintStyle: GoogleFonts.itim(
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.moneyBill1Wave,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.15,
                    right: MediaQuery.of(context).size.width * 0.15,
                    top: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: TextField(
                    controller: personCtrl,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.itim(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 246, 79, 95),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 246, 79, 95),
                        ),
                      ),
                      hintText: "ป้อนจำนวนคน (คน)",
                      hintStyle: GoogleFonts.itim(
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.person,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      onChanged: (value) {
                        setState(() {
                          tipCheck = value!;
                          if (value == false) {
                            tipCtrl.text = '';
                          }
                        });
                      },
                      value: tipCheck,
                      side: BorderSide(
                        color: Color.fromARGB(255, 246, 79, 95),
                      ),
                      checkColor: Colors.yellow,
                      activeColor: Color.fromARGB(255, 246, 79, 95),
                    ),
                    Text(
                      "เงินทิป (บาท)",
                      style: GoogleFonts.itim(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.15,
                    right: MediaQuery.of(context).size.width * 0.15,
                    top: MediaQuery.of(context).size.width * 0.03,
                  ),
                  child: TextField(
                    enabled: tipCheck,
                    controller: tipCtrl,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.itim(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 246, 79, 95),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 246, 79, 95),
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      hintText: "ป้อนจำนวนเงินทิป (บาท)",
                      hintStyle: GoogleFonts.itim(
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.moneyBills,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        if (moneyCtrl.text.isEmpty == true) {
                          _showWarningDialog(context, 'ป้อนจำนวนเงินด้วย...');
                        } else if (personCtrl.text.isEmpty == true) {
                          _showWarningDialog(context, 'ป้อนจำนวนคนด้วย...');
                        } else if (tipCheck == true) {
                          if (tipCtrl.text.isEmpty == true) {
                            _showWarningDialog(
                                context, 'ป้อนจำนวนเงินทิปด้วย...');
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowMoneyShareUI(
                                  money: moneyCtrl.text,
                                  person: personCtrl.text,
                                  tip: tipCtrl.text,
                                ),
                              ),
                            );
                          }
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShowMoneyShareUI(
                                money: moneyCtrl.text,
                                person: personCtrl.text,
                                tip: "0",
                              ),
                            ),
                          );
                        }
                      },
                      icon: Icon(
                        FontAwesomeIcons.calculator,
                      ),
                      label: Text(
                        "คำนวณ",
                        style: GoogleFonts.itim(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.3,
                          MediaQuery.of(context).size.width * 0.15,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          moneyCtrl.text = '';
                          personCtrl.text = '';
                          tipCtrl.text = '';
                          tipCheck = false;
                        });
                      },
                      icon: Icon(
                        FontAwesomeIcons.x,
                      ),
                      label: Text(
                        "ยกเลิก",
                        style: GoogleFonts.itim(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.3,
                          MediaQuery.of(context).size.width * 0.15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
