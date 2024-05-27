import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Lesson1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ders 1: Java\'ya Giriş',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Ders İçeriği:',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Java, son derece popüler bir programlama dilidir ve geniş bir uygulama yelpazesine sahiptir. Bu ders, Java\'ya giriş yapmayı amaçlamaktadır ve temel kavramları anlamanıza yardımcı olacaktır. Ayrıca, aşağıdaki videoları izleyerek daha fazla bilgi edinebilirsiniz.',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Videolar:',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            _buildVideoCard(
              context,
              'eIrMbAQSU34',
              'Java Programlama Diline Giriş',
              'Bu video, Java programlama dilinin temellerini anlatıyor ve nasıl kullanılacağını gösteriyor.',
              'https://images.unsplash.com/photo-1551033406-611cf9a28f67?ixid=MnwxMzcxOTN8MHwxfHNlYXJjaHwzfHxqYXZhfGVufDB8fHx8MTY1ODk3ODE4OQ&ixlib=rb-1.2.1&fm=jpg&w=3840&h=5760&fit=max', // Örnek resim URL'si
            ),
            SizedBox(height: 10),
            _buildVideoCard(
              context,
              'grEKMHGYyns',
              'Java ile İlk Uygulamamızı Oluşturma',
              'Bu video, Java ile basit bir "Merhaba Dünya" uygulaması oluşturmayı gösteriyor.',
              'https://images.unsplash.com/photo-1551033406-611cf9a28f67?ixid=MnwxMzcxOTN8MHwxfHNlYXJjaHwzfHxqYXZhfGVufDB8fHx8MTY1ODk3ODE4OQ&ixlib=rb-1.2.1&fm=jpg&w=3840&h=5760&fit=max', // Örnek resim URL'si
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoCard(BuildContext context, String videoId, String title, String description, String thumbnailUrl) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          _openYoutubeVideo(context, videoId);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150, // Resmin yüksekliği
              width: double.infinity, // Resmin genişliği
              child: Image.network(
                thumbnailUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openYoutubeVideo(BuildContext context, String videoId) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}
