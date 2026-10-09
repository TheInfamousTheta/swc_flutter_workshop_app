import 'package:flutter/material.dart';
import '../widgets/like_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Map<String, dynamic>> sampleArticles = [
    {
      "id": 1,
      "title": "NASA's Europa Clipper Trajectory Correction Complete",
      "news_site": "SpaceNews",
      "summary":
          "NASA's Europa Clipper spacecraft has fired its engines to fine-tune its path toward Jupiter and its ocean moon.",
      "image_url": "https://picsum.photos/id/1002/600/300",
    },
    {
      "id": 2,
      "title": "SpaceX Falcon 9 Launches Fresh Batch of Starlink Satellites",
      "news_site": "Spaceflight Now",
      "summary":
          "A Falcon 9 booster lifted off from Florida carrying another set of internet satellites into orbit.",
      "image_url": "https://picsum.photos/id/1015/600/300",
    },
    {
      "id": 3,
      "title": "James Webb Telescope Discovers New Distant Galaxy Cluster",
      "news_site": "Ars Technica",
      "summary":
          "Astronomers using the infrared camera on JWST have uncovered dozens of ancient galaxies formed in the early universe.",
      "image_url": "https://picsum.photos/id/1018/600/300",
    },
    {
      "id": 4,
      "title": "Rocket Lab Tests 3D-Printed Rutherford Engine",
      "news_site": "Payload Space",
      "summary":
          "The company completed another hot-fire qualification test for its next Electron booster mission.",
      "image_url": "https://picsum.photos/id/1025/600/300",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spaceflight News'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 4.0,
        leading: const Icon(Icons.rocket_launch),
        actions: const [
          Icon(Icons.info_outline),
          SizedBox(width: 16),
        ],
      ),
      body: ListView.builder(
        itemCount: sampleArticles.length,
        itemBuilder: (context, index) {
          final article = sampleArticles[index];

          return Card(
            elevation: 3.0,
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  article['image_url']!,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article['news_site']!.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        article['title']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        article['summary']!,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: LikeButton(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}