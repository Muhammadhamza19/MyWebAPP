import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  String? imageUrl;
  String? categoryName;
  void Function()? onTap;
  CategoryCard({this.imageUrl, this.categoryName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        child: GestureDetector(
          onTap: onTap,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                imageUrl ?? "",
                fit: BoxFit.cover,
              ),
              Center(
                child: Text(
                  categoryName ?? "",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
