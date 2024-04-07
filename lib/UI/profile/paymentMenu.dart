import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class PaymentMenu extends StatelessWidget{
  const PaymentMenu({
    super.key,
    required this.title,
    required this.pic,
    required this.onPress,
  });

  final String title;
  final String pic;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context){
    return ListTile(
      onTap: onPress,
      leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Image(image: AssetImage(pic))
      ),
      title: Text(title,style: Theme.of(context).textTheme.bodyMedium),
      trailing: Container(
          width: 30, height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.1),
          ),
          child: const Icon(LineAwesomeIcons.angle_down, size: 18.0, color: Colors.grey)),
    );
  }
}