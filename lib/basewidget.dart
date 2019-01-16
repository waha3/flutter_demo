import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

/*
 * SizedBox 可以设置box的宽度的widget
 */
class BaseText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.red,
      alignment: Alignment.center,
      child: SizedBox(
        width: 30,
        height: 20,
        child: new Text(
          context.toString(),
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
        ),
      ),
      // child: RichText(),
    );
  }
}

class RichText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Text.rich(
        TextSpan(text: 'hello world', children: <TextSpan>[
          TextSpan(text: 'aaaa', style: TextStyle(color: Colors.green)),
          TextSpan(text: 'bbbb', style: TextStyle(color: Colors.green)),
          TextSpan(text: 'cccc', style: TextStyle(color: Colors.green))
        ]),
        textDirection: TextDirection.ltr);
  }
}

/*
 * container 在没有child的时候会自动fill屏幕
 * child 只有一个
 * flutter中color是 argb a代表透明度
 * Alignment 代表矩形的一点
 * FractionalOffset 表示一种很小的偏移
 * TextDirection Bi-directional text具体我也不太明白 感觉和css那个direction差不多 有两个值ltr rtl
 * BoxConstraints 容器的限制范围 BoxConstraints.expand扩大到最大
 * MediaQuery.of 可以返回viewport的信息 由MaterialApp提供
 * margin padding 可以用常量 EdgeInsets来实现 这个和css类似 有all only symmetric fromLTRB  fromWindowPadding 构造函数
 * Container 还有decoration(后面的装饰) ForegroundDecoration(前面的装饰) BoxDecoration FlutterLogoDecoration ShapeDecoration UnderlineTabIndicator
 * transform 接收一个四维的matrix [[0, 0，0，0], [0, 0，0，0]， [0, 0, 0, 0], [0, 0, 0, 0]]
*/
class BaseContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
          padding: const EdgeInsets.all(8.0),
          // margin: const EdgeInsets.symmetric(
          //   vertical: 10,
          //   horizontal: 10
          // ),
          // margin: EdgeInsets.only(left: 10),
          //  margin: const EdgeInsets.fromLTRB(10, 20, 30, 40),
          // foregroundDecoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: NetworkImage('http://cdn.jandan.net/wp-content/themes/egg/images/logo-2018.gif'),
          //     centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
          //   ),
          // ),
          // transform: Matrix4.rotationY(0.3),
          color: Color.fromRGBO(255, 211, 121, 1),
          alignment: Alignment(0.0, 0.0),
          child: Builder(
            builder: (context) {
              return Container(
                color: Colors.green,
                constraints: BoxConstraints(
                  maxHeight: 30.0,
                  maxWidth: MediaQuery.of(context).size.width,
                  // maxWidth: 100,
                  minWidth: 15.0,
                  minHeight: 15.0,
                ),
                // constraints: BoxConstraints.expand(
                // width: 100,
                // height: 200,
                // ),
                // child: Text('hello world'),
              );
            },
          )
          // child: Text(
          //   'Hello World',
          //   textDirection: TextDirection.ltr,
          //   style: TextStyle(fontSize: 20),
          // ),
          ),
    );
  }
}

/*
 * MainAxisAlignment 类似于flex的 justify-content 可以控制子部件的排列
 * crossAxisAlignment 需要一个text 排列基准的时候
 * TextBaseline  A horizontal line used for aligning text. 两个值alphabetic ideographic
 * mainAxisSize 水平方向可以获得多少space
 * IntrinsicWidth 部件子部件固有的宽度
 */

class BaseRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Row'),
          ),
          body: Container(
            color: Colors.yellow,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              // textBaseline: TextBaseline.ideographic,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Icon(Icons.star, size: 50),
                // Icon(Icons.star, size: 50),
                // Icon(Icons.star, size: 50),
                // Text('BaseLine', style: Theme.of(context).textTheme.display3),
                // Text('BaseLine', style: Theme.of(context).textTheme.body1),
              ],
            ),
          )),
    );
  }
}

class BaseColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('column'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RaisedButton(
                color: Colors.blue,
                child: Text('111111'),
                onPressed: () {},
              ),
              RaisedButton(
                color: Colors.red,
                child: Text('1111112222'),
                onPressed: () {},
              ),
              RaisedButton(
                color: Colors.red,
                child: Text('11111122223333'),
                onPressed: () {},
              ),
            ],
          ),
          // child: IntrinsicWidth(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.stretch,
          //     children: <Widget>[
          //       RaisedButton(
          //         color: Colors.blue,
          //         child: Text('111111'),
          //         onPressed: () {},
          //       ),
          //       RaisedButton(
          //         color: Colors.red,
          //         child: Text('1111112222'),
          //         onPressed: () {},
          //       ),
          //       RaisedButton(
          //         color: Colors.red,
          //         child: Text('11111122223333'),
          //         onPressed: () {},
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}

/*
 * StackFit 怎么size没有被position的部件 是个枚举值
 */
class BaseStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
              title: Text('Stack'),
            ),
          ),
          Banner(
            message: "Top Start",
            location: BannerLocation.topStart,
          ),
          Banner(
            message: "Top End",
            location: BannerLocation.topEnd,
          ),
          Banner(
            message: "Bottom Start",
            location: BannerLocation.bottomStart,
          ),
          Banner(
            message: "Bottom End",
            location: BannerLocation.bottomEnd,
          ),
          Positioned(
            top: 100,
            left: 0,
            child: Icon(Icons.star, size: 50),
          ),
        ],
      ),
    );
  }
}

// 主要使用在flex的布局中
class BaseExpanded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.red, boxShadow: [BoxShadow(blurRadius: 10)]),
          ),
          flex: 3,
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(color: Colors.green),
          ),
          flex: 2,
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(color: Colors.blue),
          ),
          flex: 1,
        ),
      ],
    );
  }
}

class BaseFlex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flex(
      textDirection: TextDirection.ltr,
      direction: Axis.horizontal,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        FlutterLogo(),
        FlutterLogo(),
        FlutterLogo(),
      ],
    );
  }
}
