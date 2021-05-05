import 'package:flutter/material.dart';


//use it

/*
void _showMultiSelect(BuildContext context, List<Addon_details> addonDetails) async {
    final items = <MultiSelectDialogItem<int>>[
      for (int i = 0; i < addonDetails.length; i++) MultiSelectDialogItem(int.parse(addonDetails[i].addonId), addonDetails[i].addonName)
    ];

    final selectedValues = await showDialog<Set<int>>(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialog(
          items: items,
        );
      },
    );

    print(selectedValues);
  }
*/

class MultiSelectDialogItem<V> {
  const MultiSelectDialogItem(this.value, this.label);

  final V value;
  final String label;
}

class MultiSelectDialog<V> extends StatefulWidget {
  MultiSelectDialog({Key key, this.items}) : super(key: key);

  final List<MultiSelectDialogItem<V>> items;

  @override
  State<StatefulWidget> createState() => _MultiSelectDialogState<V>();
}

class _MultiSelectDialogState<V> extends State<MultiSelectDialog<V>> {
  final _selectedValues = Set<V>();

  void initState() {
    super.initState();
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

  void _onCancelTap() {
    Navigator.pop(context);
  }

  void _onSubmitTap() {
    Navigator.pop(context, _selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Addons'),
      contentPadding: EdgeInsets.only(top: 12.0),
      content: SingleChildScrollView(
        child: ListTileTheme(
          textColor: Colors.black54,
          contentPadding: EdgeInsets.fromLTRB(14.0, 0.0, 24.0, 0.0),
          child: ListBody(
            children: widget.items.map(_buildItem).toList(),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('CLOSE', style: TextStyle(color: Colors.redAccent, fontSize: 16,),),
          onPressed: _onCancelTap,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: TextButton(
            child: Text('DONE', style: TextStyle(color: Colors.blueAccent, fontSize: 16, fontWeight: FontWeight.normal),),
            onPressed: _onSubmitTap,
          ),
        )
      ],
    );
  }

  Widget _buildItem(MultiSelectDialogItem<V> item) {
    final checked = _selectedValues.contains(item.value);
    return CheckboxListTile(
      value: checked,
      title: Text(item.label),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked) => _onItemCheckedChange(item.value, checked),
    );
  }
}