import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "单词配对",
      home: RandomWords()
    );
  }
}

class RandomWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final TextStyle _biggerFront = const TextStyle(fontSize:18.0);
  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('单词配对'),
        actions: <Widget>[
          new IconButton(onPressed: _pushSaved, icon: Icon(Icons.list))
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions(){
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i){
        if(i.isOdd) return Divider();
        final idx = i~/2;
        if(idx >= _suggestions.length) _suggestions.addAll(generateWordPairs().take(10));
        return _buildRow(_suggestions[idx]);
      }
    );
  }

  Widget _buildRow(WordPair pair){
    final alreadySaver = _saved.contains(pair);
    return new ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFront,
      ),
      trailing: Icon(
        alreadySaver ? Icons.favorite : Icons.favorite_border,
        color: alreadySaver ? Colors.pink : null,
      ),
      onTap: () {
        setState(() {
          alreadySaver ? _saved.remove(pair) : _saved.add(pair);
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map((pair) {
            return ListTile(
              title: Text(
                pair.asPascalCase,
                style: _biggerFront,
              ),
            );
          });
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }

}