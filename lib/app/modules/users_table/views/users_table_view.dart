import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_test/app/models/user.dart';
import '../../../utils/constans.dart';
import '../../dynamic_labels/controllers/dynamic_labels_controller.dart';

class UsersTableView extends StatefulWidget {
  const UsersTableView({super.key});

  @override
  State<UsersTableView> createState() => _UsersTableViewState();
}

class _UsersTableViewState extends State<UsersTableView> {
  final ScrollController scrollController = ScrollController();
  final Dio dio = Dio();
  List<User> users = [];
  bool isLoading = false;
  int currentPage = 1;
  bool hasMore = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(loadMoreUsers);
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kBlueDarkColor,
          ),
        ),
        title: const Text(
          'Third Screen',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: RefreshIndicator(
          onRefresh: refreshData,
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: false,
            controller: scrollController,
            itemCount: users.length + (hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == users.length) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              final user = users[index];
              return ListTile(
                onTap: () {
                  final DynamicLabelsController dynamicLabelsController =
                      Get.find();
                  dynamicLabelsController.updateSelectedUser(user);
                },
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar ?? ''),
                ),
                title: Text('${user.firstName} ${user.lastName}'),
                subtitle: Text(user.email ?? ''),
              );
            },
          ),
        ),
      ),
    );
  }

  void loadMoreUsers() {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        !isLoading) {
      getUsers();
    }
  }

  Future<void> getUsers() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    try {
      final response =
          await dio.get("https://reqres.in/api/users", queryParameters: {
        'page': currentPage,
        'per_page': 10,
      });

      final data = response.data['data'] as List;
      final newUsers = data.map((userJson) => User.fromJson(userJson)).toList();

      setState(() {
        currentPage++;
        isLoading = false;
        users.addAll(newUsers);
        hasMore = newUsers.length == 10;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> refreshData() async {
    setState(() {
      currentPage = 1;
      users.clear();
      hasMore = true;
    });

    await getUsers();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
