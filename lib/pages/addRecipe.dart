import 'package:cookbook_mobile/services/alert_services.dart';
import 'package:cookbook_mobile/services/endpoint_services.dart';
import 'package:flutter/material.dart';

class AddRecipePage extends StatefulWidget {
  @override
  _AddRecipePageState createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  String title = '';
  String description = '';
  TextEditingController titleController = TextEditingController();  
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Recipe'),
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
              ElevatedButton(
                onPressed: () async{
                  setState(() {
                    title = titleController.text;
                    description = descriptionController.text;
                  });
                  int statusCode = await EndpointServices().createRecipe(title, description);
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
    );
  }
}
