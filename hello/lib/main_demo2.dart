import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'SavedPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: Colors.black, //主题颜色
            onPrimary: Colors.white, //主题字体颜色
          ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  createState() => _HomePageState();
// State<StatefulWidget> createState() => RandomWordsState();
}

class _HomePageState extends State<HomePage> {
  final _suggestions = <WordPair>[]; // 推荐的单词列表
  final _saved = Set<WordPair>(); // 收藏的单词集合
  final _biggerFont = const TextStyle(fontSize: 18.0); // 文本样式

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'), // AppBar标题
        actions: <Widget>[
          // 定义AppBar右侧的操作按钮集合
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(), // 主体内容
    );
  }

  // 构建推荐单词列表，返回一个 ListView.builder Widget
  Widget _buildSuggestions() {
    return ListView.builder(
      // 返回Widget
      padding: const EdgeInsets.all(16.0), // 设置列表的内边距
      itemBuilder: (context, i) {
        // 定义如何构建每一个子项
        if (i.isOdd) return Divider(); // 如果索引是奇数，返回一个分割线
        final index = i ~/ 2;
        // 计算实际的单词对索引（因为还有一半的i对应的是分割线）
        if (index >= _suggestions.length) {
          // 检查索引是否超出已有单词对列表的长度
          // 如果超出，则生成更多的单词对并添加到列表中
          _suggestions.addAll(generateWordPairs().take(10));
        }
        // 传入传入WordPair，返回构建的单词对子项👇
        return _buildItem(_suggestions[index]);
      },
    );
  }

  // 构建单词列表项，返回一个 ListTile Widget，用于在列表中显示单词对。传入WordPair
  Widget _buildItem(WordPair pair) {
    final alreadySaved = _saved.contains(pair); // 检查单词是否已被收藏
    return ListTile(
      title: Text(
        pair.asPascalCase, // 显示单词（驼峰命名）
        style: _biggerFont, // 使用指定的文本样式
      ),
      trailing: Icon(
        // 用trailing在列表项的右侧放置一个Icon，用来显示收藏图标
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null, // 选择和不选中，选择不同的形状和颜色
      ),
      onTap: () {
        // 点击事件：收藏/取消收藏单词
        setState(() {
          if (alreadySaved)
            _saved.remove(pair);
          else
            _saved.add(pair);
        });
      },
    );
  }

  // 定义一个方法，用于处理点击右侧操作按钮时的事件
  void _pushSaved() {
    Navigator.of(context).push(
      // 使用导航器将新路由推送到导航栈中，以便导航到新页面
      MaterialPageRoute(
        // 创建一个Material路由页面
        builder: (context) => SavedPage(saved: _saved, biggerFont: _biggerFont),
      ),
    );
  }
}