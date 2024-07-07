

import 'package:accounting/features/home/domain/entites/topic_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

class PageViewer extends StatefulWidget {

  final Topic topic;
  const PageViewer({super.key, required this.topic});

  @override
  State<PageViewer> createState() => _PageViewerState();
}

class _PageViewerState extends State<PageViewer> {
  double _scale = 1.0;
  double _scalep = 1.0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text(widget.topic.title),),
      body: GestureDetector(
        onScaleStart: (g){
          print(g);
          _scalep = _scale;
        },
        onScaleUpdate: (d){
          setState(() {
            _scale = d.scale*_scalep;
          });
        },
        onScaleEnd: (d){
          _scalep=1;
        },
        child: Markdown(
          //shrinkWrap: true,
          selectable: true,
          data: widget.topic.content,
          styleSheet: MarkdownStyleSheet.fromTheme(Get.theme).copyWith(
            p: TextStyle(fontSize: 18*_scale),
            h1: TextStyle(fontSize: 30*_scale),
            h2: TextStyle(fontSize: 26*_scale),
              h3: TextStyle(fontSize: 24*_scale)
          ),

        ),
      ),
    );
  }
}

