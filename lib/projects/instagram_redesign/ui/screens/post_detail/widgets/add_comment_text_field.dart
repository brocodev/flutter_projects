import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/instagram_redesign/models/ig_user.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/widgets/rounded_border_image.dart';

class AddCommentTextField extends StatelessWidget {
  const AddCommentTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.withOpacity(.1),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide.none,),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: RoundedBorderImage(
              height: 50,
              imageUrl: IgUser.kevin.photoUrl,
              borderColor: Colors.transparent,
            ),
          ),
          hintText: 'Add a comment',
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {},
              color: Theme.of(context).colorScheme.onBackground,
              icon: const Icon(Icons.send),
            ),
          ),),
    );
  }
}
