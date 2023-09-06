// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ShowMoneyShareUI extends StatefulWidget {
  String? money;
  String? person;
  String? tip;

  ShowMoneyShareUI({super.key, this.money, this.person, this.tip});

  @override
  State<ShowMoneyShareUI> createState() => _ShowMoneyShareUIState();
}

class _ShowMoneyShareUIState extends State<ShowMoneyShareUI> {
  var nf = NumberFormat('###,##0.00',"en_US");
  double? moneyShare = 0;
  @override
  void initState() {
    double money = double.parse(widget.money!);
    int person = int.parse(widget.person!);
    double tip = double.parse(widget.tip!);

    moneyShare = (money + tip) / person;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                height: MediaQuery.of(context).size.width * 0.13,
              ),
              Image.asset(
                'assets/images/wallet.png',
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.06,
              ),
              Text(
                'จำนวนเงินที่จะแชร์กัน',
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Color.fromARGB(255, 246, 79, 95),
                ),
              ),
              Text(
                nf.format(double.parse(widget.money!)),
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  color: Colors.white,
                ),
              ),
              Text(
                'บาท',
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Color.fromARGB(255, 246, 79, 95),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.06,
              ),
              Text(
                'จำนวนคนที่จะแชร์กัน',
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Color.fromARGB(255, 246, 79, 95),
                ),
              ),
              Text(
                widget.person!,
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  color: Colors.white,
                ),
              ),
              Text(
                'คน',
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Color.fromARGB(255, 246, 79, 95),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.06,
              ),
              Text(
                'จำนวนเงินทิป',
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Color.fromARGB(255, 246, 79, 95),
                ),
              ),
              Text(
                nf.format(double.parse(widget.tip!)),
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  color: Colors.white,
                ),
              ),
              Text(
                'บาท',
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Color.fromARGB(255, 246, 79, 95),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.06,
              ),
              Text(
                'แชร์เงินกันคนละ',
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Color.fromARGB(255, 246, 79, 95),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.width * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromARGB(255, 246, 79, 95),
                ),
                child: Center(
                  child: Text(
                    nf.format(moneyShare),
                    style: GoogleFonts.itim(
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              Text(
                'บาท',
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Color.fromARGB(255, 246, 79, 95),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
