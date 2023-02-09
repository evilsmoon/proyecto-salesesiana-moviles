import 'package:chronosmedic_app/data/schema/list_item.dart';
import 'package:flutter/material.dart';

class MultiSelectChip extends StatefulWidget {
  final List<ListItem> reportList;
  final List<String> list;
  final List<String> listData;
  const MultiSelectChip(
    this.reportList,
    this.list,
    this.listData, {
    Key? key,
  }) : super(key: key);

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: widget.reportList
            .map((e) => Container(
                  padding: const EdgeInsets.all(2.0),
                  child: ChoiceChip(
                    label: Text(e.name),
                    selectedColor: Colors.green,
                    selected: widget.list.map((e) => e).contains(e.value),
                    onSelected: (seleted) => setState(() =>
                        widget.listData.contains(e.value)
                            ? widget.list.remove(e.value)
                            : widget.list.add(e.value)),
                  ),
                ))
            .toList());
  }
}
