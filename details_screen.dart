import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'product.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;

  DetailsScreen({required this.product});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late double currentRating;

  @override
  void initState() {
    super.initState();
    currentRating = widget.product.rating;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200, 
                width: double.infinity,
                child: Image.network(
                  widget.product.image,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.product.title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '\$${widget.product.price}',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Category',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Text(
                widget.product.category,
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(widget.product.description),
              SizedBox(height: 10),
              Text(
                'Rating : $currentRating / 5 of ${widget.product.count}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              RatingBar.builder(
                initialRating: currentRating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    currentRating = rating;
                  });
                  print(rating);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
