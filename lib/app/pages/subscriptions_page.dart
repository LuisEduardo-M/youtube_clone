import 'package:flutter/material.dart';
import 'package:youtube_clone/app/utils/app_colors.dart';

class SubscriptionsPage extends StatefulWidget {
  const SubscriptionsPage({Key? key}) : super(key: key);

  @override
  State<SubscriptionsPage> createState() => _SubscriptionsPageState();
}

class _SubscriptionsPageState extends State<SubscriptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 15,
            itemBuilder: (context, index) => Row(
              children: const [
                SizedBox(
                  width: 80,
                  height: 60,
                  child: Card(
                    child: Center(child: Text('Channel Pic')),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(color: AppColors.dividerColor),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (ctx, ind) {
              return Card(
                child: ListTile(
                    title: Text('Video $ind'),
                    subtitle: const Text('Video Description')),
              );
            },
          ),
        ),
      ],
    );
  }
}
