import 'package:flutter/material.dart';

class AdaptativeGrid extends StatefulWidget {
  final List<Widget>? children;
  final EdgeInsetsGeometry? padding;
  final double? rowHeight;
  final double spacing;
  final double runSpacing;
  final int? horizontalQuantity;
  final List<double>? numbersInRowAccordingToWidgth;
  final bool centeredChildren;
  final int? maxNumberOfRows;
  final List<int?>? flexColumns;
  final List<double?>? widthColumns;
  final List<double?>? heightRows;
  final BoxConstraints? constraints;
  final List<List<int?>?>? layout;
  final bool fillLastRow;
  final bool expandLastColumn;
  final Widget? horizontalSeparatorWidget;
  final Widget? verticalSeparatorWidget;

  final Widget Function(BuildContext context, int index)? itemBuilder;
  final int? itemCount;
  final int? maxLength;

  const AdaptativeGrid({
    Key? key,
    this.children,
    this.padding,
    this.constraints,
    this.rowHeight,
    this.spacing = 0,
    this.runSpacing = 0,
    this.horizontalQuantity,
    this.numbersInRowAccordingToWidgth,
    this.centeredChildren = false,
    this.maxNumberOfRows,
    this.flexColumns,
    this.widthColumns,
    this.heightRows,
    this.layout,
    this.fillLastRow = false,
    this.expandLastColumn = true,
    this.horizontalSeparatorWidget,
    this.verticalSeparatorWidget,
  })  : maxLength = null,
        itemBuilder = null,
        itemCount = null,
        super(key: key);

  const AdaptativeGrid.builder({
    Key? key,
    @required this.itemBuilder,
    @required this.itemCount,
    this.padding,
    this.constraints,
    this.rowHeight,
    this.spacing = 0,
    this.runSpacing = 0,
    this.horizontalQuantity,
    this.numbersInRowAccordingToWidgth,
    this.centeredChildren = false,
    this.maxNumberOfRows,
    this.flexColumns,
    this.widthColumns,
    this.heightRows,
    this.layout,
    this.fillLastRow = false,
    this.expandLastColumn = true,
    this.horizontalSeparatorWidget,
    this.verticalSeparatorWidget,
  })  : children = null,
        maxLength = null,
        super(key: key);

  @override
  _AdaptativeGridState createState() => _AdaptativeGridState();
}

class _AdaptativeGridState extends State<AdaptativeGrid> {
  late List<Widget> _children;

  @override
  Widget build(BuildContext context) {
    _children = _defineChildren(context);

    return _container(context);
  }

  Widget _container(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: widget.padding,
      constraints: widget.constraints,
      width: MediaQuery.of(context).size.width,
      child: _gridView(context),
    );
  }

  Widget _gridView(
    BuildContext context, [
    bool addTopAndBottomWidget = false,
  ]) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      key: widget.key,
      children: _columnWidgets(context, addTopAndBottomWidget),
    );
  }

  List<Widget> _defineChildren(BuildContext context) {
    return widget.children ??
        List.generate(
          widget.maxLength == null || widget.itemCount! < widget.maxLength!
              ? widget.itemCount!
              : widget.maxLength!,
          (index) => widget.itemBuilder!(context, index),
        ).toList();
  }

  List<Widget> _columnWidgets(
    BuildContext context, [
    bool addTopAndBottomWidget = false,
  ]) {
    double _totalWidth = MediaQuery.of(context).size.width; // LayoutBuilder
    int _case = 0;
    if (widget.numbersInRowAccordingToWidgth != null) {
      int i = 0;
      for (; i < widget.numbersInRowAccordingToWidgth!.length; i++) {
        if (_totalWidth <= widget.numbersInRowAccordingToWidgth![i]) {
          break;
        }
      }
      _case = i;
    }
    // print("_case: $_case");

    List<int?>? _alignment;
    if (widget.layout != null && widget.layout!.length > _case) {
      _alignment = widget.layout![_case];
    }

    List<Widget> _rowWidgets(int index, int rowIndex) {
      int? _quantityInRow;
      if (_alignment != null && _alignment.length > rowIndex) {
        _quantityInRow = _alignment[rowIndex];
      }
      _quantityInRow = _quantityInRow ?? widget.horizontalQuantity ?? _case + 1;
      if (widget.fillLastRow && _quantityInRow > _children.length - index) {
        _quantityInRow = _children.length - index;
      }

      double? _rowHeight;
      if (widget.heightRows != null && widget.heightRows!.length > rowIndex) {
        _rowHeight = widget.heightRows![rowIndex];
      }
      _rowHeight = _rowHeight ?? widget.rowHeight!;

      bool _hasFlex = false;
      if (_quantityInRow > 1) {
        for (int i = 0; i < _quantityInRow; i++) {
          int childIndex = index + i;
          if (_children.length > childIndex) {
            if (widget.widthColumns == null ||
                widget.widthColumns!.length <= i ||
                widget.widthColumns![i] == null) {
              _hasFlex = true;
            }
          }
        }
      }

      List<Widget> _widgetsInRow = [];
      int column = 0;
      for (int i = index; column < _quantityInRow; i++) {
        if (widget.fillLastRow && i >= _children.length) {
          break;
        }

        Widget? child;
        if (i >= _children.length) {
          child = null;
        } else {
          child = _children[i];
        }

        if (_widgetsInRow.isNotEmpty) {
          _widgetsInRow.add(
            SizedBox(
              width: widget.spacing,
              height:
                  _rowHeight, // + widget.runSpacing to use a divider (needs Stack)
              child: widget.horizontalSeparatorWidget,
            ),
          );
        }

        double? _widthChild;
        if (_hasFlex ||
            (!_hasFlex && column + 1 < _quantityInRow) ||
            (!widget.expandLastColumn && column + 1 == _quantityInRow)) {
          if (widget.widthColumns != null &&
              widget.widthColumns!.length > column &&
              widget.widthColumns![column] != null) {
            _widthChild = widget.widthColumns![column];
          }
        }

        int? _flex;
        if (_widthChild == null) {
          if (widget.flexColumns != null &&
              widget.flexColumns!.length > column) {
            _flex = widget.flexColumns![column];
          }
          _flex = _flex ?? 1;
        }

        if (_flex != null) {
          child = Expanded(
            flex: _flex,
            child: SizedBox(
              height: _rowHeight,
              child: child,
            ),
          );
        } else {
          child = SizedBox(
            width: _widthChild,
            height: _rowHeight,
            child: child,
          );
        }

        _widgetsInRow.add(child);
        column++;
      }

      return _widgetsInRow;
    }

    List<Widget> _columnChildren = [];

    int _rowIndex = 0;
    for (int i = 0;
        i < _children.length &&
            (widget.maxNumberOfRows == null ||
                _rowIndex < widget.maxNumberOfRows!);) {
      if (_columnChildren.isNotEmpty) {
        _columnChildren.add(
          SizedBox(
            height: widget.runSpacing,
            child: widget.verticalSeparatorWidget,
          ),
        );
      }

      List<Widget> _rowChildren = _rowWidgets(i, _rowIndex);
      _columnChildren.add(
        Row(children: _rowChildren),
      );

      i += (_rowChildren.length / 2).ceil();
      _rowIndex++;
    }

    return _columnChildren;
  }
}
