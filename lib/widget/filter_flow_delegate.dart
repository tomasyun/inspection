import 'package:flutter/material.dart';

class FilterFlowDelegate extends FlowDelegate {
  //定义默认边距=0
  var _margin = EdgeInsets.zero;

  //提供构造方法,可以根据构造设定_margin的值
  FilterFlowDelegate(this._margin);

  @override
  void paintChildren(FlowPaintingContext context) {
    //绘制标签的左边距
    var offsetX = _margin.left;
    //绘制单词块的定边距
    var offsetY = _margin.top;
    //屏幕/父容器宽度
    var winSizeWidth = context.size.width;
    //开始循环绘制,绘制过程中进行offset的变化
    for (int i = 0; i < context.childCount; i++) {
      //当前宽度
      var w = offsetX + context.getChildSize(i).width + _margin.right;
      //如果当前的宽度大于等于屏幕宽度，那么就需要换行，否则，继续在本行绘制
      if (w < winSizeWidth) {
        //绘制子控件
        context.paintChild(i,
            transform: Matrix4.translationValues(offsetX, offsetY, 0.0));
        //绘制完后记得对x进行累加
        offsetX = w + _margin.left;
      } else {
        //换行
        //充值左边距
        offsetX = _margin.left;
        //换行之后的y偏移量=上面一个的偏移量+行高+顶部margin+底部margin
        offsetY +=
            context.getChildSize(i).height + _margin.bottom + _margin.top;
        //绘制
        context.paintChild(i,
            transform: Matrix4.translationValues(offsetX, offsetY, 0.0));
        //绘制完下一行的第一个后，记得更新offsetX
        offsetX += context.getChildSize(i).width + _margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return true;
  }
}
