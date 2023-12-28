import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_apps/style.dart';

void main(){
  runApp(Myapp());
}


class Product{
  String image;
  String name;
  int unitPrice;
  String color;
  String size;
  int quantity;

  Product(this.image, this.name, this.unitPrice, this.color, this.size,
      this.quantity);
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my bag',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [
    Product('images/product1.png', 'Pullover', 51, 'Black', 'L', 1),
    Product('images/product2.png', 'T -Shirt', 30, 'Gray', 'L', 1),
    Product('images/product3.png', 'Sport Dress', 43, 'Black', 'M', 1),
  ];
  int count = 0;
  @override
  Widget build(BuildContext context) {

    increaseItemCount(int index){
      setState(() {
       products[index].quantity++;
      });
    }
    decreaseItemCount(int index){
      if (products[index].quantity > 0) {
        setState(() {
          products[index].quantity--;
        });
      }
    }
    int calculateTotalAmount(){
      int total = 0;
      for (var product in products) {
        total += product.quantity * product.unitPrice;
      }
      return total;
    }
    MySnackBar(massage, context){
      return ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(massage),duration: Duration(seconds: 1),));
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF9F9F9),
        actions: [
         IconButton(onPressed: (){}, icon:Icon(Icons.search),color: Colors.black,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("My Bag",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),),
            SizedBox(height: 12,),
            Expanded(
              flex: 60,
                child:ListView.builder(
                  itemCount: products.length,
                    itemBuilder: (context,index){
                    return Card(
                      elevation: 3,
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        children: [
                          Container(
                            height: 100, // Set a fixed height for the image container
                            child: Image.network(
                              "https://s3-media0.fl.yelpcdn.com/bphoto/s3J5l1SCn7p1fRY8zdU2cg/348s.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: ListTile(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(products[index].name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                    Icon(Icons.more_vert),
                                  ],
                                ),
                              dense: true,
                              visualDensity: VisualDensity(vertical: 3),
                              subtitle: Column(
                                children: [
                                  SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      Text("Color: ${products[index].color}",style: TextStyle(fontSize: 15),),
                                      SizedBox(width: 15,),
                                      Text("Size: ${products[index].size}",style: TextStyle(fontSize: 15),)
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          ElevatedButton(
                                              onPressed: (){
                                                decreaseItemCount(index);
                                              },
                                              child: Icon(Icons.remove,color: Colors.grey,size: 20,),
                                            style: appButton()
                                            ),
                                          SizedBox( width: 8,),
                                          Text("${products[index].quantity.toString()}",style: TextStyle(fontWeight: FontWeight.bold),),
                                          SizedBox( width: 8,),
                                          ElevatedButton(
                                              onPressed: (){
                                               increaseItemCount(index);
                                              },
                                              child: Icon(Icons.add,color: Colors.grey,size: 20,),
                                              style: appButton()
                                          ),
                                        ],
                                      ),
                                      Text("${products[index].unitPrice}\$",style: TextStyle(fontWeight: FontWeight.w600,
                                          fontSize: 15),)
                                    ],
                                  )
                                ],
                              ),

                            ),
                          ),
                        ],
                      ),

                    );
                    }

                )
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 105,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total amount: ",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '${calculateTotalAmount().toStringAsFixed(0)}\$',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8,),
                Container(
                  width: double.infinity,
                  height: 35,
                  child: ElevatedButton(
                    onPressed: () {
                      MySnackBar(
                          "Congratulations, Your order has been placed Successfully!!",
                          context);
                    },
                    style: ElevatedButton.styleFrom(

                      backgroundColor: const Color(0xffdb3022),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      "CHECK OUT",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    )
    );
  }
}


