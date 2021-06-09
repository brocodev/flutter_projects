import 'dart:ui';

import 'package:flutter/material.dart';

class PerspectiveListView extends StatefulWidget {
  const PerspectiveListView({
    Key key,
    @required this.visualizedItems,
    @required this.itemExtent,
    @required this.children,
    this.initialIndex = 0,
    this.padding = const EdgeInsets.all(0),
    this.onTapFrontItem,
    this.onChangeFrontItem,
    this.backItemsShadowColor = Colors.transparent,
    this.enableBackItemsShadow = false,
  }) : super(key: key);

  final List<Widget> children;
  final double itemExtent;
  final int visualizedItems;
  final int initialIndex;
  final EdgeInsetsGeometry padding;
  final ValueChanged<int> onTapFrontItem;
  final ValueChanged<int> onChangeFrontItem;
  final Color backItemsShadowColor;
  final bool enableBackItemsShadow;

  @override
  _PerspectiveListViewState createState() => _PerspectiveListViewState();
}

class _PerspectiveListViewState extends State<PerspectiveListView> {
  PageController _pageController;
  int _currentIndex;
  double _pagePercent;

  @override
  void initState() {
    _currentIndex = widget.initialIndex;
    _pageController = PageController(
        viewportFraction: 1 / widget.visualizedItems,
        initialPage: _currentIndex);
    _pagePercent = 0.0;
    _pageController.addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    super.dispose();
  }

  void _pageListener() {
    _currentIndex = _pageController.page.floor();
    _pagePercent = (_pageController.page - _currentIndex).abs();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final height = constraints.maxHeight;
      return Stack(
        children: [
          //---------------------------------------
          // Perspective Items List
          //---------------------------------------
          Padding(
            padding: widget.padding,
            child: _PerspectiveItems(
                generatedItems: widget.visualizedItems - 1,
                currentIndex: _currentIndex,
                heightItem: widget.itemExtent,
                pagePercent: _pagePercent,
                children: widget.children),
          ),
          //---------------------------------------
          // Back Items Shadow
          //---------------------------------------
          if (widget.enableBackItemsShadow)
            Positioned.fill(
              bottom: widget.itemExtent,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      widget.backItemsShadowColor.withOpacity(.8),
                      widget.backItemsShadowColor.withOpacity(.0),
                    ],
                  ),
                ),
              ),
            ),
          //---------------------------------------
          // Void Page View
          //---------------------------------------
          PageView.builder(
            scrollDirection: Axis.vertical,
            controller: _pageController,
            onPageChanged: (value) {
              if (widget.onChangeFrontItem != null) {
                widget.onChangeFrontItem(value);
              }
            },
            physics: const BouncingScrollPhysics(),
            itemCount: widget.children.length,
            itemBuilder: (context, index) {
              return const SizedBox();
            },
          ),
          //---------------------------------------
          // On Tap Item Area
          //---------------------------------------
          Positioned.fill(
            top: height - widget.itemExtent,
            child: GestureDetector(
              onTap: () {
                if (widget.onTapFrontItem != null) {
                  widget.onTapFrontItem(_currentIndex);
                }
              },
            ),
          )
        ],
      );
    });
  }
}

class _PerspectiveItems extends StatelessWidget {
  const _PerspectiveItems({
    Key key,
    @required this.generatedItems,
    @required this.currentIndex,
    @required this.heightItem,
    @required this.pagePercent,
    @required this.children,
  }) : super(key: key);

  final int generatedItems;
  final int currentIndex;
  final double heightItem;
  final double pagePercent;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final height = constraints.maxHeight;
      return Stack(
        fit: StackFit.expand,
        children: [
          //---------------------------------
          // Static Last Item
          //---------------------------------
          (currentIndex > (generatedItems - 1))
              ? _TransformedItem(
                  child: children[currentIndex - generatedItems],
                  heightItem: heightItem,
                  factorChange: 1.0,
                  endScale: .5,
                )
              : const SizedBox(),
          //----------------------------------
          // Perspective Items
          //----------------------------------
          for (int index = 0; index < generatedItems; index++)
            (currentIndex > ((generatedItems - 2) - index))
                ? _TransformedItem(
                    heightItem: heightItem,
                    factorChange: pagePercent,
                    child: children[
                        currentIndex - (((generatedItems - 2) - index) + 1)],
                    scale: lerpDouble(0.5, 1, (index + 1) / (generatedItems)),
                    translateY:
                        (height - heightItem) * (index + 1) / (generatedItems),
                    endScale: lerpDouble(0.5, 1, index / (generatedItems)),
                    endTranslateY:
                        (height - heightItem) * (index / (generatedItems)),
                  )
                : const SizedBox(),
          //---------------------------------
          // Bottom Hide Item
          //---------------------------------
          (currentIndex < (children.length - 1))
              ? _TransformedItem(
                  heightItem: heightItem,
                  factorChange: pagePercent,
                  child: children[currentIndex + 1],
                  translateY: height + 20,
                  endTranslateY: (height - heightItem),
                )
              : const SizedBox()
        ],
      );
    });
  }
}

class _TransformedItem extends StatelessWidget {
  const _TransformedItem({
    Key key,
    @required this.heightItem,
    @required this.child,
    @required this.factorChange,
    this.endScale = 1.0,
    this.scale = 1.0,
    this.endTranslateY = 0.0,
    this.translateY = 0.0,
  }) : super(key: key);

  final Widget child;
  final double heightItem;
  final double factorChange;
  final double endScale;
  final double endTranslateY;
  final double translateY;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.identity()
        ..scale(lerpDouble(scale, endScale, factorChange))
        ..translate(
            0.0, lerpDouble(translateY, endTranslateY, factorChange), 0.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: heightItem,
          width: double.infinity,
          child: child,
        ),
      ),
    );
  }
}
