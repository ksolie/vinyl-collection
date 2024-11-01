import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vinyl Collection',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 19, 87, 133),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Vinyl Collection'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Album> albums = [
    Album('Album 1', 'assets/album1.jpg'),
    Album('Album 2', 'assets/album2.jpg'),
    Album('Album 3', 'assets/album3.jpg'),
    Album('Album 4', 'assets/album4.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: PageView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          return AlbumPage(album: albums[index]);
        },
      ),
    );
  }
}

class AlbumPage extends StatelessWidget {
  final Album album;

  const AlbumPage({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: FractionalTranslation(
              translation: const Offset(-0.145, 0.0),
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.003) // perspective
                  ..rotateY(math.pi / 6), // rotate around Y axis
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      album.coverPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            album.title,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class Album {
  final String title;
  final String coverPath;

  Album(this.title, this.coverPath);
}