import 'package:cookbook_mobile/services/alert_services.dart';
import 'package:cookbook_mobile/services/endpoint_services.dart';
import 'package:flutter/material.dart';

import '../components/bottom_navigation.dart';

class AddRecipePage extends StatefulWidget {
  @override
  _AddRecipePageState createState() => _AddRecipePageState();
}
const List<String> list = <String>[
  'Select Recipe Type',
     'Pasta',
              'Salad',
              'Dessert',
              'Soup',
              'Kebab - Skewer',
              'Pizza',
              'Seafood',
              'Vegetable Dishes',
              'Fast Food',
            
];
class _AddRecipePageState extends State<AddRecipePage> {
  String title = '';
  String description = '';
  String recipeType = '';
  String selectedType = '';
  TextEditingController titleController = TextEditingController();  
  TextEditingController descriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Recipe'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Column(
            children: [
              TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          hintText: 'Title',
                          prefixIconColor: Colors.grey.shade700,
                          prefixIcon: Icon(Icons.edit),
                          hintStyle: TextStyle(
                            color: Colors.grey.shade700,
                          )),
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
              SizedBox(
                height: 20,
              ),
              TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          hintText: 'Description',
                          prefixIconColor: Colors.grey.shade700,
                          prefixIcon: Icon(Icons.edit),
                          hintStyle: TextStyle(
                            color: Colors.grey.shade700,
                          )),
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
           
              SizedBox(
                height: 20,
              ),

           DropdownMenu<String>(
                inputDecorationTheme: InputDecorationTheme(
                  labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.background),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.green, width: 3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                ),
                width: MediaQuery.of(context).size.width - 36,
                initialSelection: list.first,
                onSelected: (String? value) {
                  setState(() {
                    recipeType = value!;
                  });
                },
                dropdownMenuEntries:
                    list.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all<TextStyle>(
                            TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      value: value,
                      label: value);
                }).toList(),
              ),
          SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  fixedSize: Size.fromHeight(60),
                ),
                onPressed: () async{
                  setState(() {
                    title = titleController.text;
                    description = descriptionController.text;
                  });
                  int statusCode = await EndpointServices().createRecipe(title, description, recipeType);
                  if(statusCode <400){
                    await AlertUtils().successfulAlert("Recipe Saved Successfuly", context);
                  }
                  else{
                    await  AlertUtils().errorAlert("Internal Service Error'", context);
                  }
                },
                child: Text('Submit'),
              ),
    
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBarWidget(),
    );
  }
}
