import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constansts/color_manager.dart';
import '../../../../data/models/category_model.dart';
import '../../../auth/view/widget/custom_textfield.dart';
import '../../../widgets/primary_button.dart';
import '../../viewmodel/checkbox_provider.dart';
import '../../viewmodel/image_picker_provider.dart';
import 'dropdown_button_widgets.dart';

class CategoryDetailScreen extends ConsumerWidget {
  final CategoryModel category;
  const CategoryDetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    final isCheckbox1 = ref.watch(checkboxprovider1);
    final isCheckbox2 = ref.watch(checkboxprovider2);
    final selectedImage = ref.watch(imagePickerProvider);

    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios_sharp),
                  ),
                  Text(
                    '${category.title} Post',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(width: 24), // placeholder
                ],
              ),
              SizedBox(height: 20),

              // Add Image Container
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: ColorManager.black12, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: selectedImage == null
                    ? Center(
                        child: ElevatedButton(
                          onPressed: () {
                            ref.read(imagePickerProvider.notifier).pickImage();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.white,
                            side: BorderSide(
                              color: ColorManager.primary,
                              width: 1,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Add Image',
                            style: TextStyle(
                              fontSize: 18,
                              color: ColorManager.primary,
                            ),
                          ),
                        ),
                      )
                    : Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              selectedImage,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),

                          Positioned(
                            top: 8,
                            right: 8,
                            child: IconButton(
                              icon: Icon(Icons.close, color: Colors.red),
                              onPressed: () {
                                ref
                                    .read(imagePickerProvider.notifier)
                                    .clearImage();
                              },
                            ),
                          ),
                        ],
                      ),
              ),

              SizedBox(height: 20),
              const Text(
                'Title',
                style: TextStyle(fontSize: 14, color: ColorManager.black54),
              ),
              CustomTextField(
                controller: titleController,
                hintText: '',
                
              ),
              SizedBox(height: 10),
              const Text(
                'Description',
                style: TextStyle(fontSize: 14, color: ColorManager.black54),
              ),
              CustomTextField(controller: descriptionController, hintText: ''),
              SizedBox(height: 10),
              const Text(
                'Price (optional)',
                style: TextStyle(fontSize: 14, color: ColorManager.black54),
              ),
              CustomTextField(
                controller: priceController,
                hintText: '',
                
              ),
              SizedBox(height: 10),
              const Text(
                'Category',
                style: TextStyle(fontSize: 14, color: ColorManager.black54),
              ),
              MyDropdownWidget(
                options: [
                  'Automotive Service',
                  'Beauty Service',
                  'Mobile Services',
                ],
                hint: 'Select a service',
                initialValue: 'Beauty Service',
                onChanged: (value) {
                  print('Selected: $value');
                },
              ),

              SizedBox(height: 10),
              const Text(
                'Location:',
                style: TextStyle(fontSize: 14, color: ColorManager.black54),
              ),
              CustomTextField(controller: locationController, hintText: ''),
              SizedBox(height: 10),
              const Text('Ad Expiration'),
              MyDropdownWidget(
                options: ['1day', '2day', '3day'],
                hint: 'Select days',
              ),
              SizedBox(height: 10),

              // Checkbox Row
              Row(
                children: [
                  Checkbox(
                    value: isCheckbox1,
                    onChanged: (bool? value) {
                      ref.read(checkboxprovider1.notifier).state =
                          value ?? false;
                    },
                  ),
                  Text('Allow chat only'),
                ],
              ),

              Row(
                children: [
                  Checkbox(
                    value: isCheckbox2,
                    onChanged: (bool? value) {
                      ref.read(checkboxprovider2.notifier).state =
                          value ?? false;
                    },
                  ),
                  Text('Allow chat only'),
                ],
              ),

              SizedBox(height: 20),
              CustomButton(text: 'Post Ad', onPressed: (){}),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
