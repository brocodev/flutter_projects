import 'package:flutter/material.dart';
import 'package:flutter_projects/template_gallery/models/contact.dart';
import 'package:flutter_projects/template_gallery/ui/widgets/cards.dart';
import 'package:flutter_projects/template_gallery/ui/widgets/perspective_list_view.dart';

class ContactListPage extends StatelessWidget {
  const ContactListPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
        title: Text('TEMPLATE GALLERY'),
      ),
      body: PerspectiveListView(
        visualizedItems: 8,
        itemExtent: MediaQuery.of(context).size.height * .33,
        initialIndex: 7,
        enableBackItemsShadow: true,
        backItemsShadowColor: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.all(10),
        onTapFrontItem: (value) {
          print(Contact.contacts[value].name);
        },
        children: List.generate(Contact.contacts.length, (index) {
          final borderColor = Colors.accents[index % Colors.accents.length];
          final contact = Contact.contacts[index];
          return ContactCard(
            borderColor: borderColor,
            contact: contact,
          );
        }),
      ),
    );
  }
}
