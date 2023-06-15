import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pertemuan_v/controllers/post_controller.dart';

import '../models/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PostController postController = PostController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Post>>(
          future: postController.fetchAll(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              if (snapshot.data!.isNotEmpty) {
                inspect(snapshot.data!);
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: size.height * 0.01,
                    );
                  },
                  itemCount: snapshot.data!.length,
                );
              } else {
                return Text("tidak ada data");
              }
            } else {
              return Text("err");
            }
          },
        ),
      ),
    );
  }
}
