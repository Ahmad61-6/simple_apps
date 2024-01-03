import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_apps/RestAPI/RestClient.dart';
import 'package:simple_apps/Screen/ProductCreateScreen.dart';
import 'package:simple_apps/Screen/ProductUpdateScreen.dart';
import 'package:simple_apps/Style/style.dart';


class ProductGridViewScreen extends StatefulWidget {
  const ProductGridViewScreen({super.key});

  @override
  State<ProductGridViewScreen> createState() => _ProductGridViewScreenState();
}

class _ProductGridViewScreenState extends State<ProductGridViewScreen> {
  List ProductList = [];
  bool loading = true;

@override
  void initState(){
  callData();
    super.initState();

  }

  callData() async{
    loading = true;
    var data = await ProductGridViewListRequest();
    setState(() {
      ProductList = data;
      loading = false;
    });
  }

  deleteProduct(id) async{
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Delete !"),
            content: Text("Onece delete, you can't get it back"),
            actions: [
              OutlinedButton(onPressed: () async {

                Navigator.pop(context);
                setState(() {loading=true;});
                await productDeleteRequest(id);
                await callData();

              }, child: Text('Yes')),
              OutlinedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('No')),

            ],
          );

        }
    );
  }

  goToUpdate(context,productItem){
  Navigator.push(context, MaterialPageRoute(builder: (builder)=> ProductUpdateScreen(productItem)));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
      ),
      body: Stack(
        children: [
          screenBackGround(context),
        Container(
        child: loading ? (Center(child: CircularProgressIndicator(),)):
        RefreshIndicator(
            onRefresh: () async{
              await callData();
            },
          child: (GridView.builder(gridDelegate: ProductGridViewStyle(),
            itemCount: ProductList.length,
            itemBuilder: (context,index){
              return Card(
                elevation: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child: Image.network(ProductList[index]['Img'],fit: BoxFit.fill,)),
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ProductList[index]['ProductName']),
                          SizedBox(height: 7,),
                          Text("Price: "+ ProductList[index]['UnitPrice']+" BDT"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              OutlinedButton(
                                  onPressed: (){
                                    goToUpdate(context,ProductList[index]);
                                  },
                                  child:Icon(CupertinoIcons.ellipsis_vertical_circle,size: 18,color: colorGreen,)
                              ),
                              SizedBox(width: 4,),
                              OutlinedButton(
                                  onPressed: (){
                                    deleteProduct(ProductList[index]['_id']);

                                  },
                                  child:Icon(CupertinoIcons.delete,size: 18,color: colorRed,)
                              ),

                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),

              );
            })),
            )
    )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (builder)=> ProductCreateScreen()));
        },
        child: Icon(Icons.add),
      ),

    );
  }
}
