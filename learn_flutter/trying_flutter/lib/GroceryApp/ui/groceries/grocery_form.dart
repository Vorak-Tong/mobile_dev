import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../models/grocery.dart';

const uuid = Uuid();

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {

  // Default settings
  static const defautName = "New grocery";
  static const defaultQuantity = 1;
  static const defaultCategory = GroceryCategory.fruit;

  final _formKey = GlobalKey<FormState>(); // for form validation

  // Inputs
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  GroceryCategory _selectedCategory = defaultCategory;

  @override
  void initState() {
    super.initState();

    // Initialize intputs with default settings
    _nameController.text = defautName;
    _quantityController.text = defaultQuantity.toString();
  }

  @override
  void dispose() {
    super.dispose();

    // Dispose the controlers
    _nameController.dispose();
    _quantityController.dispose();
  }

  void onReset() {
    // Will be implemented later - Reset all fields to the initial values
    _formKey.currentState?.reset();
    setState(() {
      _nameController.text = defautName;
      _quantityController.text = defaultQuantity.toString();
      _selectedCategory = defaultCategory;
    });
  }

  void onAdd() {
    // Will be implemented later - Create and return the new grocery
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();

      final enterName = _nameController.text;
      final enterQuantity = int.tryParse(_quantityController.text);

      // validate quantity
      if(enterQuantity == null || enterQuantity <= 0){
        // showDialog(
        //   context: context,
        //   builder: (ctx) => AlertDialog(

        //   )
        // );
        return;
      }

      final newItem = Grocery(
        id: uuid.v4(), 
        name: enterName, 
        quantity: enterQuantity, 
        category: _selectedCategory,
      );

      Navigator.of(context).pop(newItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add a new item')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                maxLength: 50,
                decoration: const InputDecoration(label: Text('Name')),
                validator: (value){
                  if(value == null || value.trim().isEmpty){
                    return 'Must be between 1 and 50 characters.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _quantityController,
                      decoration: const InputDecoration(label: Text('Quantity')),
                      validator: (value) {
                        final number = int.tryParse(value ?? '');
                        if (number == null || number <= 0) {
                          return 'Must be a valid, positive number.';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<GroceryCategory>(
                      initialValue: _selectedCategory,
                      decoration: const InputDecoration(label: Text('Category')),
                      items: GroceryCategory.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Row(
                            children: [
                              Container(
                                width: 15,
                                height: 15,
                                color: category.color,
                              ),
                              const SizedBox(width: 8,),
                              Text(category.label),
                            ],
                          ),
                        )
                      ).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _selectedCategory = value;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: onReset, child: const Text('Reset')),
                  ElevatedButton(
                    onPressed: onAdd,
                    child: const Text('Add Item'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
