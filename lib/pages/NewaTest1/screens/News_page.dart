import 'package:carousel_slider/carousel_slider.dart';
import 'package:chat_project_test2/pages/NewaTest1/models/news_model.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../components/breaking_news_card.dart';
import '../components/news_list_tile.dart';

class NewsPage extends StatefulWidget {
  static String id = 'News_page view';
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future<List<NewsData>> breakingNews;
  late Future<List<NewsData>> recentNews;

  @override
  void initState() {
    super.initState();
    breakingNews = NewsData.fetchBreakingNews();
    recentNews = NewsData.fetchRecentNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: DrawerWidget(),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: KprimaryColor2,
        title: const Text(
          "NewsApp",
          style: TextStyle(color: Colors.black),
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: Icon(
        //         Icons.notifications_outlined,
        //         color: Colors.black,
        //       ))
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Breaking News",
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Carousel for breaking news
              FutureBuilder<List<NewsData>>(
                future: breakingNews,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text('No breaking news available'));
                  } else {
                    return CarouselSlider.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index, id) =>
                          BreakingNewsCard(snapshot.data![index]),
                      options: CarouselOptions(
                        aspectRatio: 16 / 9,
                        enableInfiniteScroll: false,
                        enlargeCenterPage: true,
                      ),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 40.0,
              ),
              const Text(
                "Recent News",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              // List of recent news
              FutureBuilder<List<NewsData>>(
                future: recentNews,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text('No recent news available'));
                  } else {
                    return Column(
                      children:
                          snapshot.data!.map((e) => NewsListTile(e)).toList(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
