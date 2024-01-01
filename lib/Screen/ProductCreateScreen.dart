
import 'package:flutter/material.dart';
import 'package:simple_apps/RestAPI/RestClient.dart';


import '../Style/style.dart';


class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {

  Map<String,String> FormValues={"Img":"", "ProductCode":"", "ProductName":"", "Qty":"", "TotalPrice":"", "UnitPrice":""};
  bool Loading = false;



  InputOnChange(MapKey, Textvalue){
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async{
    if(FormValues['Img']!.length==0){
      errorToast('Image Link Required !');
    }
    else if(FormValues['ProductCode']!.length==0){
      errorToast('Product Code Required !');
    }
    else if(FormValues['ProductName']!.length==0){
      errorToast('Product Name Required !');
    }
    else if(FormValues['Qty']!.length==0){
      errorToast('Product Qty Required !');
    }
    else if(FormValues['TotalPrice']!.length==0){
      errorToast('Total Price Required !');
    }
    else if(FormValues['UnitPrice']!.length==0){
      errorToast('Unit Price Required !');
    }
    else{
      setState(() {
        Loading = true;
      });
      await ProductCreateRequest(FormValues);
    }
    setState(() {
      Loading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Product'),),
      body: Stack(
        children: [
          screenBackGround(context),
          Container(
              child:Loading ?(Center(
                child: CircularProgressIndicator(),)):
              ((SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [

                    TextFormField(
                      onChanged: (Textvalue){
                        InputOnChange("ProductName",Textvalue);
                      },
                      onEditingComplete: () => FocusScope.of(context).nextFocus(),
                      decoration: AppInputDecoration('Product Name'),
                    ),

                    SizedBox(height: 20),

                    TextFormField(
                      onChanged: (Textvalue){
                        InputOnChange("ProductCode",Textvalue);
                      },
                      onEditingComplete: () => FocusScope.of(context).nextFocus(),
                      decoration: AppInputDecoration('Product Code'),
                    ),

                    SizedBox(height: 20),

                    TextFormField(
                      onChanged: (Textvalue){
                        InputOnChange("Img",Textvalue);
                      },
                      onEditingComplete: () => FocusScope.of(context).nextFocus(),
                      decoration: AppInputDecoration('Product Image'),
                    ),

                    SizedBox(height: 20),

                    TextFormField(
                      onChanged: (Textvalue){
                        InputOnChange("UnitPrice",Textvalue);
                      },
                      onEditingComplete: () => FocusScope.of(context).nextFocus(),
                      decoration: AppInputDecoration('Unit Price'),
                    ),

                    SizedBox(height: 20),

                    TextFormField(
                      onChanged: (Textvalue){
                        InputOnChange("TotalPrice",Textvalue);
                      },
                      onEditingComplete: () => FocusScope.of(context).nextFocus(),
                      decoration: AppInputDecoration('Total Price'),
                    ),

                    SizedBox(height: 20),

                    AppDropDownStyle(
                        DropdownButton(
                          value:FormValues['Qty'] ,
                          items:[
                            DropdownMenuItem(child: Text('Select Qt'),value: "",),
                            DropdownMenuItem(child: Text('1 pcs'),value: "1 pcs",),
                            DropdownMenuItem(child: Text('2 pcs'),value: '2 pcs',),
                            DropdownMenuItem(child: Text('3 pcs'),value: '3 pcs',),
                            DropdownMenuItem(child: Text('4 pcs'),value: '4 pcs',),
                          ],
                          onChanged: (Textvalue){
                            InputOnChange("Qty",Textvalue);
                          },
                          underline: Container(),
                          isExpanded: true,
                        )
                    ),

                    SizedBox(height: 20),

                    Container(
                        child:ElevatedButton(
                            style: AppButtonStyle(),
                            onPressed: (){
                              FormOnSubmit();
                            },
                            child: SuccessButtonChild('Submit')
                        )
                    )
                  ],
                ),
              ))
              )
              )
        ],
      ),
    );
  }
}