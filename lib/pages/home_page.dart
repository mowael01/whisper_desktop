import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class Notification {
  String title;
  String message;

  Notification({required this.title, required this.message});
}

class _HomePageState extends State<HomePage> {
  String selectedPriority = 'كل الأهميات';
  String selectedStatus = 'كل الحالات';

  List<Notification> alerts = [
    Notification(
      title: 'New Message',
      message: 'You have received a new message.',
    ),
    Notification(
      title: 'Software Update',
      message: 'A new software update is available.',
    ),
    Notification(
      title: 'System Alert',
      message: 'Your system will restart in 10 minutes.',
    ),
  ];

  List<UrgentReportData> urgentReportsDataList = [
    UrgentReportData(
      title: 'dafkljdfl;asdlkfaskldfjlakdf',
      type: 'سرقة',
      location: 'أجهور الكبرى - امام مركز الشرطة - القليوبية',
      date: '18 اغسطس 2025',
    ),
    UrgentReportData(
      title: 'title',
      type: 'fraud',
      location: 'location',
      date: '17 august 2017',
    ),
  ];

  List<ReportData> reportsDataList = [
    // fake data for fillup
    ReportData(
      id: 'RPT-001',
      priority: 'عالي',
      statue: 'جاري التحقيق',
      date: '2023-08-15',
      type: 'سرقة',
      location: 'القاهرة - وسط البلد',
      assignee: 'أحمد محمد',
    ),
    ReportData(
      id: 'RPT-002',
      priority: 'عالي',
      statue: 'جاري التحقيق',
      date: '2023-08-15',
      type: 'سرقة',
      location: 'القاهرة - وسط البلد',
      assignee: 'أحمد محمد',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 10,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.blueGrey.withAlpha(100),
        actions: [
          PopupMenuButton(
            offset: Offset(0, 40),

            itemBuilder: (context) => alerts.map((alert) {
              return PopupMenuItem(
                child: ListTile(
                  title: Text(alert.title),
                  subtitle: Text(alert.message),
                ),
              );
            }).toList(),
            onOpened: () {
              // Handle menu opened
            },
            onCanceled: () => {},
            onSelected: (value) => {},
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.withAlpha(30),
              ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      '${alerts.length}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'تنبيهات',
                    style: TextStyle(
                      fontFamily: GoogleFonts.cairo().fontFamily,
                    ),
                  ),
                  SizedBox(width: 2),
                  Icon(Icons.notifications_outlined, size: 18),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          IconButton(
            icon: Icon(
              Icons.settings_outlined,
              color: Colors.black.withAlpha(200),
              size: 18,
            ),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                Colors.grey.withAlpha(30),
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            onPressed: () {
              // Handle logout action
            },
          ),
          SizedBox(width: 10),
          IconButton(
            icon: Row(
              children: [
                Text(
                  'الخروج',
                  style: TextStyle(fontFamily: GoogleFonts.cairo().fontFamily),
                ),
                SizedBox(width: 5),
                Icon(Icons.logout, size: 18),
              ],
            ),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                Colors.grey.withAlpha(100).withRed(255),
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
            ),

            onPressed: () {
              Navigator.popAndPushNamed(context, '/login');
            },
          ),
          SizedBox(width: 5),
        ],
        title: Row(
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: Icon(
                Icons.shield_outlined,
                size: 50,
                color: Color.fromARGB(255, 21, 93, 252),
              ),
            ),
            Column(
              children: [
                Text(
                  'Whisper Desktop',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: GoogleFonts.cairo().fontFamily,
                  ),
                ),
                Text(
                  'منصة البلاغات الآمنة',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: GoogleFonts.cairo().fontFamily,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 248, 250, 252),
            ),
            child: Column(
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        SummaryElement(
                          title: 'تم حل',
                          count: '15',
                          icon: Icons.done_all_outlined,
                          iconColor: Color.fromARGB(255, 0, 201, 80),
                          backgroundColor: Color.fromARGB(255, 219, 252, 231),
                        ),
                        SizedBox(width: 15),
                        SummaryElement(
                          title: 'جاري العمل',
                          count: '15',
                          icon: Icons.timer_outlined,
                          iconColor: Color.fromARGB(255, 255, 105, 0),
                          backgroundColor: Color.fromARGB(255, 255, 237, 212),
                        ),
                        SizedBox(width: 15),
                        SummaryElement(
                          title: 'حالات طارئة',
                          count: '15',
                          icon: Icons.warning_amber_outlined,
                          iconColor: Color.fromARGB(255, 251, 44, 54),
                          backgroundColor: Color.fromARGB(255, 255, 226, 226),
                        ),
                        SizedBox(width: 15),
                        SummaryElement(
                          title: 'المجموع الكلي',
                          count: '15',
                          icon: Icons.shield_outlined,
                          iconColor: Color.fromARGB(255, 46, 129, 255),
                          backgroundColor: Color.fromARGB(255, 219, 234, 254),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withAlpha(50),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'البحث',
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 243, 243, 245),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),

                                  prefixIcon: Icon(Icons.search),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            DropdownButton<String>(
                              value: selectedPriority,
                              icon: Icon(Icons.keyboard_arrow_down),
                              borderRadius: BorderRadius.circular(10),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedPriority = newValue!;
                                });
                              },

                              items:
                                  <String>[
                                    'كل الأهميات',
                                    'أعلى أولوية',
                                    'متوسط الاولوية',
                                    'أقل أولوية',
                                  ].map<DropdownMenuItem<String>>((
                                    String value,
                                  ) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                            ),
                            SizedBox(width: 10),
                            DropdownButton<String>(
                              value: selectedStatus,
                              icon: Icon(Icons.keyboard_arrow_down),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedStatus = newValue!;
                                });
                              },
                              items:
                                  <String>[
                                    'كل الحالات',
                                    'الحالات المفتوحة',
                                    'الحالات المغلقة',
                                    'حالات الانتظار',
                                  ].map<DropdownMenuItem<String>>((
                                    String value,
                                  ) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              style: ButtonStyle(
                                surfaceTintColor: WidgetStateProperty.all(
                                  Color.fromARGB(255, 243, 243, 245),
                                ),
                                backgroundColor: WidgetStateProperty.all(
                                  Color.fromARGB(255, 243, 243, 245),
                                ),
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                padding: WidgetStateProperty.all(
                                  EdgeInsets.all(10),
                                ),
                                minimumSize: WidgetStateProperty.all(
                                  Size(150, 50),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  selectedPriority = 'كل الأهميات';
                                  selectedStatus = 'كل الحالات';
                                });
                              },
                              child: Row(
                                children: [
                                  Text('إلغاء كل الفلاتر'),
                                  SizedBox(width: 5),
                                  Icon(Icons.filter_alt_outlined),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withAlpha(50),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.warning_amber_outlined,
                                            color: Color.fromARGB(
                                              255,
                                              207,
                                              32,
                                              55,
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            'البلاغات الطارئة',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                255,
                                                207,
                                                32,
                                                55,
                                              ),
                                              fontFamily: GoogleFonts.cairo()
                                                  .fontFamily,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      ...urgentReportsDataList.map((
                                        UrgentReportData data,
                                      ) {
                                        return UrgentReport(data: data);
                                      }),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withAlpha(50),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'إجراءات سريعة',
                                        style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.cairo().fontFamily,
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text('ابلاغ'),
                                      ),
                                      SizedBox(height: 10),

                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text('فتح الخريطة'),
                                      ),
                                      SizedBox(height: 10),

                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text('ارسال تنبيه'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 0,
                            bottom: 0,
                            right: 20,
                            left: 0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withAlpha(50),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'البلاغات',
                                        style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.cairo().fontFamily,
                                          fontSize: 20,
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text('اظهار الكل'),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  ...reportsDataList.map((ReportData data) {
                                    return ReportCard(data: data);
                                  }),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReportCard extends StatefulWidget {
  const ReportCard({super.key, required this.data});

  final ReportData data;

  @override
  State<ReportCard> createState() => _ReportCardState();
}

class _ReportCardState extends State<ReportCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) => setState(() => _hovered = value),

      child: Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: _hovered ? Color.fromARGB(255, 248, 250, 252) : Colors.white,
          border: Border.all(color: Color.fromARGB(255, 226, 232, 240)),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Clipboard.setData(
                            ClipboardData(text: widget.data.id),
                          );
                        },
                        icon: Icon(Icons.copy_all_outlined),
                      ),
                      Text(
                        widget.data.id,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: GoogleFonts.cairo().fontFamily,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: switch (widget.data.priority) {
                            'عالي' => Color(0xffffe2e2),
                            'متوسط' => Color(0xfffef9c2),
                            'منخفض' => Color(0xffdbfce7),
                            String() => throw UnimplementedError(),
                          },
                          border: Border.all(
                            color: switch (widget.data.priority) {
                              'عالي' => Colors.red,
                              'متوسط' => Colors.yellow,
                              'منخفض' => Colors.green,
                              String() => throw UnimplementedError(),
                            },
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 3,
                            horizontal: 10,
                          ),
                          child: Text(
                            widget.data.priority.toUpperCase(),

                            style: TextStyle(
                              fontFamily: GoogleFonts.cairo().fontFamily,
                              color: switch (widget.data.priority) {
                                'عالي' => Colors.red,
                                'متوسط' => Colors.yellow,
                                'منخفض' => Colors.green,
                                String() => throw UnimplementedError(),
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: switch (widget.data.statue) {
                            'جاري التحقيق' => Color(0xffffedd4),
                            'جاري المراجعة' => Color(0xfffef9c2),
                            'تم الاستلام' => Color(0xffdbeafe),
                            'تم الحل' => Color(0xffdbfce7),
                            String() => Colors.red,
                          },
                          border: Border.all(
                            color: switch (widget.data.statue) {
                              'جاري التحقيق' => Color(0xffaf4f52),
                              'جاري المراجعة' => Color(0xff894e26),
                              'تم الاستلام' => Color(0xff193cb8),
                              'تم الحل' => Color(0xff016630),
                              String() => Colors.white,
                            },
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 3,
                            horizontal: 10,
                          ),
                          child: Text(
                            widget.data.statue,

                            style: TextStyle(
                              fontFamily: GoogleFonts.cairo().fontFamily,
                              color: switch (widget.data.statue) {
                                'جاري التحقيق' => Color(0xffaf4f52),
                                'جاري المراجعة' => Color(0xff894e26),
                                'تم الاستلام' => Color(0xff193cb8),
                                'تم الحل' => Color(0xff016630),
                                String() => Colors.white,
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(widget.data.date),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Text(
                  widget.data.type,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.cairo().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Text(
                  widget.data.location,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: GoogleFonts.cairo().fontFamily,
                  ),
                ),
              ),
              widget.data.assignee.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.only(right: 15, top: 5),
                      child: Text(
                        'المسؤول: ${widget.data.assignee}',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: GoogleFonts.cairo().fontFamily,
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class ReportData {
  String id;
  String priority;
  String statue;
  String date;
  String type;
  String location;
  String assignee;

  ReportData({
    required this.id,
    required this.priority,
    required this.statue,
    required this.date,
    required this.type,
    required this.location,
    required this.assignee,
  });
}

class UrgentReport extends StatefulWidget {
  const UrgentReport({super.key, required this.data});

  final UrgentReportData data;

  @override
  State<UrgentReport> createState() => _UrgentReportState();
}

class _UrgentReportState extends State<UrgentReport> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) => setState(() {
        debugPrint('hovered $value');
        _isHovered = value;
      }),
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          color: _isHovered
              ? Colors.red[100]
              : Color.fromARGB(255, 254, 242, 242),
          borderRadius: BorderRadius.circular(10),
          border: BoxBorder.all(color: Colors.red, width: 0.7),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.data.title,
                    style: TextStyle(
                      color: Colors.red,
                      fontFamily: GoogleFonts.cairo().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    widget.data.date,
                    style: TextStyle(
                      color: Colors.red,
                      fontFamily: GoogleFonts.cairo().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                widget.data.type,
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: GoogleFonts.cairo().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.data.location,
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: GoogleFonts.cairo().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UrgentReportData {
  String title;
  String date;
  String type;
  String location;

  UrgentReportData({
    required this.title,
    required this.type,
    required this.location,
    required this.date,
  });
}

class SummaryElement extends StatefulWidget {
  final String title;
  final String count;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;

  const SummaryElement({
    super.key,
    required this.title,
    required this.count,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  State<SummaryElement> createState() => _SummaryElementState();
}

class _SummaryElementState extends State<SummaryElement> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(50),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: GoogleFonts.cairo().fontFamily,
                    ),
                  ),
                  Text(
                    widget.count,
                    style: TextStyle(
                      fontFamily: GoogleFonts.cairo().fontFamily,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(widget.icon, color: widget.iconColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
