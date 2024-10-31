import 'package:accounting/features/home/domain/entites/topic_model.dart';
import 'package:accounting/features/home/presentation/screens/pageviewer.dart';
import 'package:accounting/shared/utils/spacers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Topiclist extends StatelessWidget {
  const Topiclist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Topics"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView.separated(
          itemCount: mytopics.length,
          itemBuilder: (BuildContext context, int index) {
            Topic data = mytopics[index];
            return TopicTile(
              onTap: (){
                Get.to(()=>PageViewer(topic: data));
              },
                title: data.title, subtitle: data.bookid, index: index+1);
          }, separatorBuilder: (BuildContext context, int index)  =>kSizedbox10,
        ),
      ),
    );
  }
}

class TopicTile extends StatelessWidget {
  Function()? onTap;
  String title;
  String subtitle;
  Color bgColor;
  int index;
  TopicTile({
    this.bgColor = Colors.blue,
    required this.title,
    this.onTap,
    required this.subtitle,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundColor: Colors.black54,
          child:  Text(index.toString(),style: TextStyle(color: Colors.white),),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        // subtitle: Text(
        //   subtitle,
        //   style: TextStyle(color: Colors.grey),
        //   maxLines: 1,
        //   overflow: TextOverflow.ellipsis,
        // ),
        trailing: Icon(Icons.chevron_right),
      ),
    );
  }
}
