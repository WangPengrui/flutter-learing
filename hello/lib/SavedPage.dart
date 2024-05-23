// SavedPage.dart , used demo02
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SavedPage extends StatelessWidget {
  final Set<WordPair> saved;
  final TextStyle biggerFont;

  SavedPage({required this.saved, required this.biggerFont});

  @override
  Widget build(BuildContext context) {
    final tiles = saved.map(
          (pair) => ListTile(
            // 返回一个ListTile小部件，显示单词对的标题
            title: Text(
            pair.asPascalCase, // 使用驼峰命名方式显示单词
            style: biggerFont, // 使用指定的文本样式
        ),
      ),
    );
    // 将ListTile列表分割为更小的部分，并放入列表中
    final divided = ListTile.divideTiles(
      context: context, // 上下文对象，用于查找Scaffold的父级
      tiles: tiles, // 要分割的ListTile列表
    ).toList();
    // 构建新页面的Scaffold，显示列表视图和标题栏
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Suggestions'), // 设置标题
        // 自定义返回按钮
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // 返回按钮的图标
          onPressed: () {
            // 返回上一页
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(children: divided), // 在页面主体显示分割后的列表视图
    );
  }
}