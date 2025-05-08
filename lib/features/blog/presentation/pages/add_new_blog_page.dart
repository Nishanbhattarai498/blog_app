import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:supabase_proj/core/theme/app_pallate.dart';

class AddNewBlogPage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const AddNewBlogPage());
  const AddNewBlogPage({super.key});

  @override
  State<AddNewBlogPage> createState() => _AddNewBlogPageState();
}

class _AddNewBlogPageState extends State<AddNewBlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.done_rounded))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DottedBorder(
              color: AppPallete.borderColor,
              dashPattern: [20, 4],
              radius: const Radius.circular(10),
              borderType: BorderType.RRect,
              strokeCap: StrokeCap.round,
              child: Container(
                height: 150,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.folder_open, size: 40),
                    SizedBox(height: 15),
                    Text('Select Your Image', style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    ['Technology', 'Business', 'Programming', 'Entertainment']
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Chip(
                              label: Text(e),
                              side: const BorderSide(
                                color: AppPallete.borderColor,
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
