import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GifDownloadScreen extends StatefulWidget {

  const GifDownloadScreen({Key? key}) : super(key: key);

  @override
  _GifDownloadScreenState createState() => _GifDownloadScreenState();
}

class _GifDownloadScreenState extends State<GifDownloadScreen> {

  bool _isDownloading = false;
  String? _gifFilePath;

  Future<void> _downloadGifs() async {
    setState(() {
      _isDownloading = true;
    });
    try {
      Dio dio = Dio();
      String bucketUrl = 'https://fitness-bucket.s3.amazonaws.com/Gifs/';

      List<String> gifs = [
        'abdominalCrunch.gif'
        // 'gif1.gif',
        // 'gif2.gif',
        // 'gif3.gif'
      ];
      // Get app's documents directory
      Directory appDocDir = await getApplicationDocumentsDirectory();
      // Loop through each GIF and download it
      for (int i = 0; i < gifs.length; i++) {
        String gifUrl = bucketUrl + gifs[i];
        String gifFileName = gifs[i];
        String gifPath = '${appDocDir.path}/images/$gifFileName';
        print("Gif Path>>>>>> $gifPath");
        await dio.download(gifUrl, gifPath);
      }
      // GIFs downloaded successfully
      // Update flag in shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isDownloaded', true);
      // Display success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('GIFs downloaded successfully!')),
      );
    } catch (e) {
      // Error occurred while downloading GIFs
      // Display error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to download GIFs.')),
      );
    } finally {
      setState(() {
        _isDownloading = false;
      });
    }
  }

  Future<void> _checkIfGifsDownloaded() async {
    // Check flag in shared preferences to see if GIFs have already been downloaded
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDownloaded = prefs.getBool('isDownloaded') ?? false;
    if (isDownloaded) {
      // Display success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('GIFs are already downloaded!')),
      );
    } else {
      // GIFs not downloaded yet, so download them
      await _downloadGifs();
    }
  }

  Future<void> _loadGif() async {
    try {
      // Get app's documents directory
      Directory appDocDir = await getApplicationDocumentsDirectory();
      // Get file path of downloaded GIF image
      _gifFilePath = '${appDocDir.path}/images/abdominalCrunch.gif';
      print("path>>>>>>>> $_gifFilePath");
      // Update state to reflect file path
      setState(() {});
    } catch (e) {
      // Error occurred while loading GIF image
      // Display error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to load GIF image.')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _loadGif();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Tap the button below to download GIFs.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _isDownloading ? null : _checkIfGifsDownloaded,
              child: _isDownloading
                  ? const CircularProgressIndicator()
                  : const Text('Download GIFs'),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: _gifFilePath != null
                  ? Image.file(File(_gifFilePath!))
                  : const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'dart:math';
//
// import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:external_path/external_path.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class MyGifDownloader {
//
//   bool isDownloading = false;
//
//   List<String> gifUrls = [
//     'https://fitness-bucket.s3.amazonaws.com/Gifs/abdominalCrunch.gif'
//   // //   'https://your-bucket.s3.amazonaws.com/gif1.gif', // Replace with your S3 Bucket URL for gif1
//   // //   'https://your-bucket.s3.amazonaws.com/gif2.gif', // Replace with your S3 Bucket URL for gif2
//   // //   // Add more S3 Bucket URLs for additional GIFs as needed
//   ];
//
//   Future<String> downloadGif(String url) async {
//     if (await Permission.storage.request().isGranted) {
//       // Either the permission was already granted before or the user just granted it.
//     }
//
// // You can request multiple permissions at once.
//     Map<Permission, PermissionStatus> statuses = await [
//       Permission.storage,
//     ].request();
//     final filename = "FITNESS_${Random().nextInt(9999999)}.gif";
//     var request = await http.get(Uri.parse(url));
//     var bytes = request.bodyBytes;
//     // late String dir;
//     Directory appDocDir = await getApplicationDocumentsDirectory();
//     String dir = appDocDir.path + '/your-gif.gif';
//     // if (Platform.isIOS){
//     //   dir = (await getApplicationDocumentsDirectory()).path;
//     // }else{
//     //   Directory appDocDir = await getApplicationDocumentsDirectory();
//     //   dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
//     // }
//     File file = File('$dir/$filename');
//     print('path1.....${file.path}');
//     await file.writeAsBytes(bytes);
//     return file.path;
//   }
// }