import 'package:flutter/material.dart';

Widget Grid_item({image, product_name, new_price, old_price}) {
  return Container(
    //color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: NetworkImage(image),
              width: double.infinity,
              height: 200,
              fit: BoxFit
                  .cover, // This ensures the image fits within the widget properly.
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product_name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(height: 1.3),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '$new_price\$  ',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            height: 1.3, fontSize: 12, color: Colors.blue),
                      ),
                      Text(
                        '$old_price\$',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            height: 1.3,
                            fontSize: 12,
                            color: Colors.redAccent,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: Colors.blue,
                            //AppCubit.get(context).favorites[model.data!.products[index].id] ?Colors.red:Colors.grey[400],
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            //AppCubit.get(context).favorites[model.data!.products[index].id] ?Colors.red:Colors.grey[400],
                          )),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
