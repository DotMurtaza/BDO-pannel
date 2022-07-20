import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BDOaddMeetingDropDown extends StatefulWidget {
  const BDOaddMeetingDropDown(
      {Key key, this.color, this.value1, this.value2, this.value3, this.value4})
      : super(key: key);
  final String value1;
  final String value2;
  final String value3;
  final String value4;
  final Color color;
  @override
  _BDOaddMeetingDropDownState createState() => _BDOaddMeetingDropDownState();
}

class _BDOaddMeetingDropDownState extends State<BDOaddMeetingDropDown> {
  void _showMultiSelect(BuildContext context) async {
    final items = <MultiSelectDialogItem<int>>[
      MultiSelectDialogItem(1, '${widget.value1}'),
      MultiSelectDialogItem(2, '${widget.value2}'),
      MultiSelectDialogItem(3, '${widget.value3}'),
      MultiSelectDialogItem(4, '${widget.value4}'),
    ];

    final selectedValues = await showDialog<Set<int>>(
      context: context,
      builder: (BuildContext context) {
        return BDOMultiSelectDialog(
          items: items,
          color: widget.color,
          // initialSelectedValues: [1, 2].toSet(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(
          onPressed: () => _showMultiSelect(context),
          icon: Icon(Icons.arrow_downward)),
    ]);
  }
}

class MultiSelectDialogItem<V> {
  const MultiSelectDialogItem(this.value, this.label);

  final V value;
  final String label;
}

class BDOMultiSelectDialog<V> extends StatefulWidget {
  BDOMultiSelectDialog(
      {Key key, this.items, this.color, this.initialSelectedValues})
      : super(key: key);

  final List<MultiSelectDialogItem<V>> items;
  final Set<V> initialSelectedValues;
  final Color color;
  @override
  State<StatefulWidget> createState() => _BDOMultiSelectDialogState<V>();
}

class _BDOMultiSelectDialogState<V> extends State<BDOMultiSelectDialog<V>> {
  final _selectedValues = Set<V>();

  void initState() {
    super.initState();
    if (widget.initialSelectedValues != null) {
      _selectedValues.addAll(widget.initialSelectedValues);
    }
  }

  void _onItemCheckedChange(V itemValue, bool checked) {
    setState(() {
      if (checked) {
        _selectedValues.add(itemValue);
      } else {
        _selectedValues.remove(itemValue);
      }
    });
  }

  void _onSubmitTap() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Select"),
      contentPadding: EdgeInsets.only(top: 12.0),
      content: SingleChildScrollView(
        child: ListTileTheme(
          contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
          child: ListBody(
            children: widget.items.map(_buildItem).toList(),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('OK'),
          onPressed: _onSubmitTap,
        )
      ],
    );
  }

  Widget _buildItem(
    MultiSelectDialogItem<V> item,
  ) {
    final checked = _selectedValues.contains(item.value);
    return CheckboxListTile(
      activeColor: widget.color,
      value: checked,
      title: Text(item.label),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked) => _onItemCheckedChange(item.value, checked),
    );
  }
}
