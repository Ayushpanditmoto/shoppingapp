import 'package:flutter/material.dart';
import '../reusable/navigation.dart';
import '../screens/edit_product_screen.dart';

class UserProductItems extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const UserProductItems({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigation.push(
                  context,
                  EditProductScreen(
                    id: id,
                  ),
                );
              },
              icon: const Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
              color: Theme.of(context).colorScheme.error,
            ),
          ],
        ),
      ),
    );
  }
}
