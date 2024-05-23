# wpr的flutter快速实战

由于本人之前未曾接触过flutter，两天完成demo也算一个小的挑战了，接下来开始这段短途冲刺吧。



## 环境配置

根据[flutter官网](https://doc.flutterchina.club/setup-windows/)指引进配置，贴心的配备了中文站，更省时省力一些。

### 1. 系统要求

已经配备了 Git for Windows (2.45.1)

已经安装配置了JDK 22

### 2. 使用镜像

将Flutter官方为中国开发者搭建的临时镜像，添加到用户变量：

- PUB_HOSTED_URL，其值为https://pub.flutter-io.cn

- FLUTTER_STORAGE_BASE_URL， 其值为https://storage.flutter-io.cn

### 3. 获取Flutter SDK

1. 获取Flutter SDK 3.22.0，解压缩到低权限路径

2. 配置环境变量：PATH中new，D:\W-PAPP\flutter\bin
3. 终端运行`flutter --version`查看是否安装成功。

### 4. 配置环境

- 终端运行`flutter doctor`检测平台相关依赖，缺少Android Studio，并且报错cmdline-tools component is missing  
- 配置Android环境：
  - 安装Android Studio，配置Android SDK
  - 添加虚拟机，配置系统R（Android 11）。
  - 安装相关插件：dart，flutter
  - 安装Android SDK cmdline-tools：SDK manager中进行

- 终端设置android sdk路径flutter config --android-sdk "(新路径)"，并接受所有协议flutter doctor --android-licenses 。

## 初认Flutter

### 1. Dart快速入门

感觉很类似java等语言，快速浏览，记录不同点

- 变量定义

  ```dart
  var name = 'liuwangshu';	// 定义一个String
  String name = 'liuwangshu' ; // 也可显示声明
  final name = 'liuwangshu'	// final形变量，类似java，该变量只能设置一次
  const pi = 3.1415926;		// 定义常量
  var foo = const []; final bar = const []; const baz = [];//相当于`const []` 
  ```

- 基本数据类型：Number、String、Boolean、List、Set、Map、 Symbol、Runes。

  - String：单双引号都可定义`var s1 = '单引号适用于字符串文字';`
  - Boolean：强bool类型检查，只有true对象才被认为是true。
  - List：定义方式`var list = [1, 2, 3];`基本方法比如`list.length`...
  - Set：定义方式`Set<int> mySet = {1, 2, 3, 4, 5};` 

- 函数：

  ```dart
  void printInfo(String name, [int age = 0], {int salary}) {
    print('Name: $name, Age: $age, Salary: $salary');
  }	// name,age可选位置参数，Salary可选命名参数，[]指定默认值
  printInfo('Alice', 30, salary: 50000); // 传递了所有参数
  printInfo('Bob'); 			// 只传递了必需参数
  printInfo('Charlie', 25); 	// 传递了必需参数和可选位置参数
  ```

  ```dart
  void main(){
   void printName(String name) {
    print('name is $name');
   }	//每个应用都需要有个顶级的main() 函数来作为入口才能执行。
  } //  main()函数的返回值为void且有个可选的 List<String> 参数.
  ```

- 流程控制

  - for、switch、if：和java一样。

### 2. Flutter目录 

认识创建的Flutter项目

| 文件夹                | 作用                                                         |
| --------------------- | ------------------------------------------------------------ |
| android               | android平台相关代码                                          |
| ios                   | ios平台相关代码                                              |
| linux                 | Linux平台相关的代码                                          |
| macos                 | macos平台相关的代码                                          |
| web                   | web相关的代码                                                |
| windows               | windows相关的代码                                            |
| lib                   | flutter相关代码，我们编写的代码就在这个文件夹                |
| test                  | 用于存放测试代码                                             |
| pubspec.yaml          | 配置文件，一般存放一些第三方库的依赖。                       |
| analysis_options.yaml | 分析dart语法的文件，老项目升级成新项目有警告信息的话可以删掉此文件 |

### 3. Flutter

在实际的demo中边写边学。

## [Hello World](https://github.com/WangPengrui/flutter-learing/blob/main/hello/lib/main_demo1.dart)

<img src="https://github.com/WangPengrui/flutter-learing/assets/104671485/0dd10c2f-2705-4c36-9c26-6a2f28e915c6" alt="image" style="width:33%">

### 1. 导入flutter包

Flutter的material库，包含了构建UI所需的各种组件和工具

```dart
import 'package:flutter/material.dart';
```

### 2. Flutter入口文件、入口方法  

flutter项目lib目录中main.dart，是flutter的入口文件。该文件中的main方法是dart的入口方法。

MyApp是自定义的一个组件。  runApp方法是flutter的入口方法。

Mian函数告知 Flutter 运行 `MyApp` 中定义的应用。

```dart
void main(){
	runApp(const MyApp()); // 常量构造减少资源消耗
}
// 可以简写为
void main() => runApp(MyApp());
// =>：简化的语法，用于编写只有一行代码的函数或方法，将箭头右侧的表达式的结果返回给函数或方法的调用者。
```

### 3. MyApp类

整个应用程序的顶层Widget。

实现我的第一个Flutter页面，Hello world。

```dart
class MyApp extends StatelessWidget { // MyApp类继承自StatelessWidget类
  const MyApp({super.key}); // {}表示这是一个命名参数列表。super.key表示这个构造函数会调用父类(StatelessWidget)的构造函数，并传递一个名为key的参数。Flutter中，key参数用于在Widget树中标识和区分不同的Widget，对性能优化和状态管理很重要。
  @override
  Widget build(BuildContext context) { // 覆写build方法，返回一个Widget，描述UI外观
    return MaterialApp( // 返回一个MaterialApp对象，用于配置应用程序的基本属性
      title: 'Welcome to Flutter', // 设置应用程序的标题
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold( // 使用Scaffold作为应用程序的主要布局结构
        appBar: AppBar( // 设置AppBar，作为Scaffold的顶部栏
          title: Text('Welcome to Flutter'), // AppBar中显示的标题文本，传入的是Text
        ),
        body: Center( // 设置Scaffold的主体部分，传入Center使其内容居中显示
          child: Text(	// 在居中的位置显示文本'Hello World'
            'Hello World',
            style: Theme.of(context).textTheme.headlineLarge ,), 	// 定义字体
        ),
      ),
    );
  }
}
```

### 4. 知识PLUS

1. **Widget：**使用Widget构建UI，Widget根据其当前配置和状态来描述视图，当Widget的状态发生更改时，Widget会重建其描述。framework将根据前面的描述进行对比，以确定底层渲染树从一个状态转换到下一个状态所需的最小更改。		在Flutter中，除了基础控件（文本、图片、卡片、输入框这些），布局方式和动画等也都是由Widget组成的。通过使用不同类型的Widget，就可以实现复杂的界面。

2. StatelessWidget：当需要一个静态，无需改变的Widget将其继承StatelessWidget

3. 创建一个类，需要覆写build方法，用来创建自己的视图。

   在其中我们需要直接返回一个返回一个MaterialApp（Material Design风格的Widget）

   ```dart
   class MyApp extends StatelessWidget {
     const MyApp({super.key});
     @override
     Widget build(BuildContext context) {
         return MaterialApp(
         title ： 在任务管理窗口中所显示的应用名字
   	  theme ： 应用各种 UI 所使用的主题颜色
   	  color ： 应用的主要颜色值（primary color），也就是安卓任务管理窗口中所显示的应用颜色
   	  home ： 应用默认所显示的界面 Widget
             ...
   ```

   

4. Scaffold：是界面的主体，组件的展示都依附于它。每个界面一个脚手架，通过它来进行架构实现，布局。

![image-20240521171825117](https://github.com/WangPengrui/flutter-learing/assets/104671485/ec368a74-68ce-40e4-ad9b-52e9716ced17)


## [FlutterDemo](https://github.com/WangPengrui/flutter-learing/blob/main/hello/lib/main_demo2.dart)

基于官方Demo的改进：生成建议的名称，提供互动功能，用户可以选中将其加入清单。

<img src="https://github.com/WangPengrui/flutter-learing/assets/104671485/779b0435-76f3-4704-b540-1ff207f3cb95" alt="image" style="width:25%">
<img src="https://github.com/WangPengrui/flutter-learing/assets/104671485/25f26774-7c9f-4f7d-ba6e-df4d365711f5" alt="image" style="width:25%">
<img src="https://github.com/WangPengrui/flutter-learing/assets/104671485/5ec8430c-3be2-43d2-9d5a-5275c63b00f8" alt="image" style="width:25%">

```dart
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'SavedPage.dart'; // 后续构建的路由页面

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: Colors.black, 		//主题颜色
            onPrimary: Colors.white, 	//主题字体颜色
          ),
      ),
      home: HomePage(),	 // 设置应用程序的主页
    );
  }
}
```

### 1. Stateful widget

State*ful* widgets 持有的状态可能在widget生命周期中发生变化. 实现一个 stateful widget 至少需要两个类:

- 一个 StatefulWidget类。

- 一个 State类。 StatefulWidget类本身是不变的，但是其关联的State类在widget生命周期中始终存在，不断地创建、销毁和重建。当StatefulWidget的状态发生变化时，Flutter框架会调用StatefulWidget的`createState()`方法来创建一个新的State对象，并与该widget关联起来。这个新的State对象会在widget的生命周期中持续存在，直到该widget被从widget树中移除或销毁。

1. 添加Stateful Widget类RandomWords

   ```dart
   class HomePage extends StatefulWidget {
     @override
     createState() => _HomePageState();
     // State<StatefulWidget> createState() => RandomWordsState();
   }
   ```

2. 添加对应State类

   ```dart
   class _HomePageState extends State<HomePage> {
     final _suggestions = <WordPair>[];	// 推荐的单词列表
     final _saved = Set<WordPair>();		// 收藏的单词集合
     final _biggerFont = const TextStyle(fontSize: 18.0);  	// 文本样式
   
     @override
     Widget build(BuildContext context) {
       return Scaffold(	// 基于Scaffold构建界面
         appBar: AppBar(
           title: Text('Startup Name Generator'), // AppBar标题
           actions: <Widget>[	// 定义AppBar右侧的操作按钮集合
             IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
           ],
         ),
         body: _buildSuggestions(), // 主体内容
       );
     }
   
     // 构建推荐单词列表，返回一个 ListView.builder Widget
     Widget _buildSuggestions() {
       return ListView.builder(	// 返回Widget
         padding: const EdgeInsets.all(16.0), 	// 设置列表的内边距
         itemBuilder: (context, i) { 		// 定义如何构建每一个子项
           if (i.isOdd) return Divider(); 	// 如果索引是奇数，返回一个分割线
           final index = i ~/ 2;	// 计算实际的单词对索引（因为还有一半的i对应的是分割线）
           if (index >= _suggestions.length) {	// 检查索引是否超出已有单词对列表的长度
             // 如果超出，则生成更多的单词对并添加到列表中
             _suggestions.addAll(generateWordPairs().take(10));
           }	// 传入传入WordPair，返回构建的单词对子项👇
           return _buildItem(_suggestions[index]);	 
         },
       );
     }
   
     // 构建单词列表项，返回一个 ListTile Widget，用于在列表中显示单词对。传入WordPair
     Widget _buildItem(WordPair pair) {
       final alreadySaved = _saved.contains(pair); // 检查单词是否已被收藏
       return ListTile(v
         title: Text(
           pair.asPascalCase, 	// 显示单词（驼峰命名）
           style: _biggerFont, // 使用指定的文本样式
         ),
         trailing: Icon(	// 用trailing在列表项的右侧放置一个Icon，用来显示收藏图标
           alreadySaved ? Icons.favorite : Icons.favorite_border,
           color: alreadySaved ? Colors.red : null,  // 选择和不选中，选择不同的形状和颜色
         ),
         onTap: () {	// 点击事件：收藏/取消收藏单词
           setState(() {
             if (alreadySaved)   _saved.remove(pair);
             else  _saved.add(pair);
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
   ```

3. 存放喜爱列表的路由页面

   ```dart
   // demo
   import 'package:flutter/material.dart';
   import 'package:english_words/english_words.dart';
   
   class SavedPage extends StatelessWidget {
     final Set<WordPair> saved;
     final TextStyle biggerFont;
     //  SavedPage({})是该类的构造函数，使用了 Dart 的语法糖 this.saved 和 this.biggerFont 来自动将传入的参数赋值给实例变量。
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
         ),
         body: ListView(children: divided), // 在页面主体显示分割后的列表视图
       );
     }
   }
   ```

### 知识PLUS

- pubspec.yaml

  ```dart
  # 项目名和项目描述
  name: hello
  description: "A new Flutter project."
  publish_to: 'none' # 定义发布到哪里，默认为'none'，表示不发布
  version: 1.0.0+1 # 项目版本号，通常采用语义化版本规范
  # 环境版本
  environment:
    sdk: '>=3.4.0 <4.0.0' # 定义项目所需的Dart SDK版本范围
  # 运行依赖
  dependencies:
    flutter: # Flutter框架依赖
      sdk: flutter
  
    cupertino_icons: ^1.0.6 # 提供iOS风格图标的Flutter插件依赖
    # 新的依赖加在这下面，点击右上角Pub get就可以自动下载依赖
    english_words: ^4.0.0 # 用于生成随机英文单词的Flutter插件依赖
    provider: ^6.1.2 # Flutter状态管理库Provider的依赖
  # 调试依赖
  dev_dependencies:
    flutter_test: # Flutter测试框架依赖
      sdk: flutter
  
    flutter_lints: ^3.0.0 # Flutter代码规范检查工具的依赖
  
  flutter:
    uses-material-design: true # 指定Flutter应用使用Material Design风格
  ```

- Scaffold中appBar中的actions：

  ```dart
  actions: <Widget>[  // 定义了 AppBar 右侧的操作按钮集合
    IconButton( // IconButton 是一个 Material Design 风格的按钮，主要用来展示图标并响应点击
      icon: Icon(Icons.list),  // icon 属性定义了按钮上显示的图标
      onPressed: _pushSaved    // 点击时，触发_pushSaved函数  
  ) ],
  ```

- ListView：Flutter中最常用的Scrolling Widget，分为：

  - 默认构造函数ListView。
  - ListView.builder，适用于具有大量（或无限）列表项。
  - ListView.separated，可以配置分割线，适用于具有固定数量列表项的ListView。
  - ListView.custom，提供了自定义子Widget的能力。

  |          属性           |       作用       |
  | :---------------------: | :--------------: |
  |         padding         |      内边距      |
  |       controller        |  列表滚动控制器  |
  |       itemExtent        |  每条item的高度  |
  |        itemCount        |    列表的总数    |
  |    separatorBuilder     | 每条item的分隔符 |
  | keyboardDismissBehavior |   键盘关闭模式   |
  |     scrollDirection     |     滚动方向     |

- setState：实现动态UI刷新，实现UI交互。比如在我们的demo中有：

  ```dart
  onTap: () {	// 定义用户点击列表项时的操作
    setState(() { //setState方法内部的匿名函数是一个回调函数，在 setState() 被调用后会立即执行。
        // setState() 方法会告诉Flutter，UI的状态可能已经改变，需要重新构建UI。
      if (alreadySaved)   _saved.remove(pair);	// 这里我们在_saved列表中去除\增加pair，
      else  _saved.add(pair);		// UI就会自动更新这个pair尾部的 ♥
    });
  },
  ```

- Flutter——路由导航

  - MaterialPageRoute是用于实现Android风格的页面切换效果的路由类。它继承自PageRoute类，提供了一些Android特有的过渡效果。常用的MaterialPageRoute构造函数参数如下：
    - builder：用于构建路由对应的Widget。
    - settings：用于配置和传递路由的信息。

  ```dart
    void _pushSaved() {
      Navigator.of(context).push(
        // 使用导航器将新路由推送到导航栈中，以便导航到新页面
        MaterialPageRoute(
          // 创建一个Material路由页面
          builder: (context) => SavedPage(saved: _saved, biggerFont: _biggerFont),
        ),	);		}
  ```

  - Navigator（导航器）：管理所有路由的Widget，在Flutter中，我们可以使用MaterialApp、CupertinoApp、WidgetsApp等Widget来创建导航器。

  - 导航器通过使用一个栈（Stack）来管理所有的路由，当我们在应用程序中进行页面跳转时，实际上是新建一个路由并将其推入栈中，从而实现页面切换。

    常用的Navigator方法有：

    - push(Route route)：将给定的路由推入导航器堆栈。
    - pushNamed(String routeName, {Object arguments})：根据给定的路由名称跳转到对应的命名路由，并可以传递参数。
    - pop([result])：将当前路由从导航器堆栈中弹出，并返回一个值给上一个路由
    - popUntil(RoutePredicate predicate)：弹出导航器堆栈中直到满足给定条件的路由。



## [hsi_alg](https://github.com/WangPengrui/flutter-learing/tree/main/hsi_alg)

这是我快速实战上手的第一个小小项目。目标是制作一个能为所有高光谱图像处理领域的同行们提供一个快速查询自身领域内的优质算法信息，和常用数据集信息。

<img src="https://github.com/WangPengrui/flutter-learing/assets/104671485/ef01097b-c63a-439c-a8c5-3309bc7b37ba" alt="image-20240523095330022" style="width:25%">
<img src="https://github.com/WangPengrui/flutter-learing/assets/104671485/b57d52bc-2f6a-4b0e-854b-4c662df07b19" alt="image-20240523095343548" style="width:25%">
<img src="https://github.com/WangPengrui/flutter-learing/assets/104671485/2ea386e2-d15c-412c-a2f6-072d7bc51674" alt="image-20240523095414313" style="width:25%">



### 导航页（intro_Page）

包含本项目基础信息以及动机，点击Get Started按钮即可进入任务选择页面

### 任务选择页（menu_page）

用户在本页中可以在一个下拉列表中，浏览到高光谱领域所有常见任务。

每个任务由一个矩形包围，单击矩形任一部分，即可跳转该项任务的详情。

用户单机感兴趣任务右侧心形，即可点亮红心，并将该项任务添加到最喜欢任务列表（正在开发）

用户点击感兴趣任务，对应矩形内部的Data或Algorithm按钮，即可跳转到该项任务对应的相关资源列表（目前还是空白页面，待开发）

### 任务数据页（task_data_page）

待开发，目标为：

- 页面上方，放置横向拖拽的容器列表，展示该项任务最为流行的标准数据集

- 页面中部，放置搜索框

- 页面最下部，放置两列的下拉容器列表，展示该项任务的全部常用标准数据集
- 用户点击数据页面时，跳转到数据详情页，给出预览伪彩色合成图片与文字详细说明，并提供下载地址。

### 任务算法页（task_data_Algorithm）

待开发，目标与任务数据页类似。

