

import 'package:accounting/features/home/presentation/screens/topiclist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/utils/spacers.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 10),
        child: ListView(
          children: [
            kSizedbox10,
            HomeTileBig(
              onTap: ()async {
                Get.to(()=>Topiclist());
              },
              bgColor: Colors.purple,
              title: 'Financial Accounting',
              subtitle: "Collection and recording of financial data",
              icon: Icons.account_balance,
            ),
            kSizedbox10,
            HomeTileBig(
              onTap: () {},
              title: 'Cost Accounting',
              subtitle: 'ascertainment of cost',
              icon: Icons.money_rounded,
              bgColor: Colors.pink,

            ),
            kSizedbox10,
            HomeTileBig(
              onTap: () {},
              title: 'Financial Reporting',
              subtitle: 'Accounting presentation',
              icon: Icons.report_outlined,
              bgColor: Colors.green,

            ),


          ],
        ),
      ),
    );
  }
}

class HomeTileBig extends StatelessWidget {
  Function() onTap;
  String title;
  String subtitle;
  Color bgColor;
  IconData icon;
  HomeTileBig({
    required this.bgColor,
    required this.title,
    required this.onTap,
    required this.subtitle,
    required this.icon,
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: bgColor.withOpacity(0.4)
            ),
            child: Icon(
              icon,
              color: bgColor,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(subtitle,style: TextStyle(color: Colors.grey),maxLines: 1,overflow: TextOverflow.ellipsis,),
        ),
      ),
    );
  }
}
