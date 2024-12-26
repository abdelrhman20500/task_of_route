import 'package:flutter/material.dart';
class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: const BorderSide(
                        color: Colors.blue
                    )
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: const BorderSide(
                        color: Colors.blue
                    )
                ),
                labelText: "what do you search for ?",
                labelStyle: const TextStyle(fontSize: 20),
                prefixIcon: const Icon(Icons.search, size: 32,color: Colors.blue,)
            ),
          ),
        ),
        IconButton(onPressed: (){},
            icon:const Icon(Icons.add_shopping_cart_rounded,
              size: 34 ,color: Colors.blue,) )
      ],
    );
  }
}