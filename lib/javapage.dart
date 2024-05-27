import 'package:flutter/material.dart';
import 'codepage.dart';
import 'javalessons/lesson1.dart'; // Örnek olarak ders detayları sayfalarının import edildiği varsayıldı


class JavaPage extends StatefulWidget {
  @override
  _JavaPageState createState() => _JavaPageState();
}

class _JavaPageState extends State<JavaPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _lessons = [
    {'title': 'Ders 1: Java\'ya Giriş', 'progress': '0/3'},
    {'title': 'Ders 2: Değişkenler ve Veri Tipleri', 'progress': '0/5'},
    {'title': 'Ders 3: Döngüler ve Koşullar', 'progress': '0/3'},
    {'title': 'Ders 4: Fonksiyonlar ve Metodlar', 'progress': '0/3'},
  ];
  List<Map<String, String>> _filteredLessons = [];

  @override
  void initState() {
    super.initState();
    _filteredLessons = _lessons;
  }

  void _search() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredLessons = _lessons;
      } else {
        _filteredLessons = _lessons.where((lesson) {
          return lesson['title']!.toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Java Temelleri',
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
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2017/08/10/08/47/laptop-2620118_640.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black87, Colors.transparent],
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Java Temelleri',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.deepPurple[200]!,
                        width: 1.0,
                      ),
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Ara...',
                        hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 18.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(),
                    child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: _search,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dersler',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CodeEditorPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[100],
                  ),
                  icon: Icon(Icons.code),
                  label: Text(
                    'Kodla',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredLessons.length,
                itemBuilder: (context, index) {
                  return _buildDersItem(
                    _filteredLessons[index]['title']!,
                    _filteredLessons[index]['progress']!,
                    index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDersItem(String taskName, String progress, int index) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        onTap: () {
          _goToLessonDetailPage(index);
        },
        leading: Icon(Icons.task, color: Colors.deepPurple),
        title: Text(
          taskName,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          progress,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
          ),
        ),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }

  void _goToLessonDetailPage(int index) {
    switch(index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Lesson1Page()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Lesson1Page()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Lesson1Page()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Lesson1Page()),
        );
        break;
    }
  }
}
