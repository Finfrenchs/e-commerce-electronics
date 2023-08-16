import 'package:intl/intl.dart';

//Global variable
class GlobalVariables {
  //static const baseUrl = 'http://10.0.2.2:1337';
  static const baseUrl = 'https://3a8b-110-137-101-26.ngrok.io';

  static const List<String> bannerImages = [
    'https://cdn0-production-images-kly.akamaized.net/4mEp63q7ELZGsTy3IC5PbcavnN8=/1200x675/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/4390112/original/027830700_1681181181-TCL_Vidio.jpg',
    'https://www.lg.com/id/images/plp-b2b/b2b-5/LG_OneQuickSeries_lg.com%20Hero%20Banner_211018_1600x800%20(1).jpg',
    'https://marketplace.canva.com/EAFChaJ2RP8/2/0/1600w/canva-biru-dan-ungu-kreatif-penawaran-laptop-terbaik-promo-facebook-ad-X67Ql41HrfQ.jpg',
  ];

  static const List<Map<String, dynamic>> categoryImageProducts = [
    {
      'name':
          "Hisense 32E4H 32 inch Vidaa Smart HD TV-Bezelles design-Dual Band Wifi",
      'description':
          "Mohon melakukan UNBOXING VIDEO saat barang diterima agar kami dapat bantu proses komplain dan asuransi,, terima kasih",
      'image': "assets/images/tv-hisense.jpg",
      'price': '1600000',
    },
    {
      'name': 'Samsung Smart TV 65 inch Neo QLED 4K QN90B',
      'description':
          "Complaint mengenai kerusakaan pada product maupun material product yang kurang maksimal kami terima 3 hari setelah barang diterima oleh customer dan juga customer wajib sertakan video unboxing",
      'image': 'assets/images/tv-samsung.jpg',
      'price': '2000000',
    },
    {
      'name':
          'TOSHIBA 43 INCH FHD 1080 ANDROID SMART TV - 43V35KP [FREE BRACKET]',
      'description':
          'Membuatmu tetap terkoneksi dengan beragam konektivitas yang dihadirkan V35KP ini. Dilengkapi dengan pengalaman audio visual yang istimewa, membuatmu nyaman menonton film favoritmu kapan saja. Digital Noise Reduction memungkinkanmu menonton dengan audio yang jernih dan menenangkan.',
      'image': 'assets/images/tv-toshiba.jpg',
      'price': '2600000',
    },
    {
      'name':
          'LG 32LM550 LED TV 32 Inch HD Digital USB HDMI Model 32LM550BPTA (2019)',
      'description':
          'Nikmati pengalaman menonton TV yang sesungguhnya dengan LG 32LM550 Flat HD LED TV 32 Inch [32"/DVB-T2]. Dengan desain yang modern dan kokoh, TV model terbaru ini menghadirkan berbagai fitur fungsional yang menarik dan canggih. Nikmati berbagai acara dan film bersama teman dan keluarga Anda dan rasakan kualitas gambar yang tajam dan jernih.',
      'image': 'assets/images/tv-lg.jpg',
      'price': '3600000',
    },
  ];

  static const List<Map<String, String>> listCategory = [
    {
      'name': 'Handphone',
      'image': 'assets/icons/ic_hp.png',
    },
    {
      'name': 'TV',
      'image': 'assets/icons/ic_tv.png',
    },
    {
      'name': 'AC',
      'image': 'assets/icons/ic_ac.png',
    },
    {
      'name': 'Rice Cooker',
      'image': 'assets/icons/ic_rice_cooker.png',
    },
    {
      'name': 'Fan',
      'image': 'assets/icons/ic_fan.png',
    },
  ];
}

//format currency
String formatCurrency(
  num number, {
  String symbol = 'Rp ',
}) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: symbol,
    decimalDigits: 0,
  ).format(number);
}
