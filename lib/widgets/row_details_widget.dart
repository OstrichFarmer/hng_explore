import 'package:flutter/material.dart';
import 'package:hng_explore/utilities/dimensions.dart';

class RowDetails extends StatefulWidget {
  final String? name;
  final String? value;

  const RowDetails({Key? key, @required this.name, @required this.value})
      : super(key: key);

  @override
  State<RowDetails> createState() => _RowDetailsState();
}

class _RowDetailsState extends State<RowDetails> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${widget.name!}:',
          style: TextStyle(fontSize: Dimensions.font20),
        ),
        SizedBox(
          width: Dimensions.height10,
        ),
        Expanded(
          child: Text(widget.value!,
              style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: Dimensions.height20)),
        )
      ],
    );
  }
}
