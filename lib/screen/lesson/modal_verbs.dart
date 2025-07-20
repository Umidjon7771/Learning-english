import 'package:flutter/material.dart';

class ModalVerbsPage extends StatefulWidget {
  @override
  _ModalVerbsPageState createState() => _ModalVerbsPageState();
}

class _ModalVerbsPageState extends State<ModalVerbsPage>
    with TickerProviderStateMixin {
  int? expandedIndex;
  Set<int> completedVerbs = <int>{};
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> modalVerbs = [
    {
      'verb': 'CAN',
      'meaning': 'Qila olish, imkoniyat',
      'color': Colors.blue,
      'examples': [
        {'en': 'I can swim', 'uz': 'Men suzishni bilaman', 'type': 'Qobiliyat'},
        {
          'en': 'Can you help me?',
          'uz': 'Menga yordam bera olasizmi?',
          'type': 'So\'rov'
        },
        {
          'en': 'You can go now',
          'uz': 'Endi ketishingiz mumkin',
          'type': 'Ruxsat'
        },
      ],
      'usage': 'Qobiliyat, so\'rov va ruxsat berish uchun ishlatiladi',
      'formula': 'Subject + can + verb (base form)'
    },
    {
      'verb': 'COULD',
      'meaning': 'Qila olardi, mumkin edi',
      'color': Colors.indigo,
      'examples': [
        {
          'en': 'I could run fast when I was young',
          'uz': 'Yoshligimda tez yugura olardim',
          'type': 'O\'tmishdagi qobiliyat'
        },
        {
          'en': 'Could you pass the salt?',
          'uz': 'Tuzni uzata olasizmi?',
          'type': 'Muloyim so\'rov'
        },
        {
          'en': 'It could rain today',
          'uz': 'Bugun yomg\'ir yog\'ishi mumkin',
          'type': 'Ehtimollik'
        },
      ],
      'usage': 'O\'tmishdagi qobiliyat, muloyim so\'rov, ehtimollik',
      'formula': 'Subject + could + verb (base form)'
    },
    {
      'verb': 'MAY',
      'meaning': 'Mumkin, ehtimol',
      'color': Colors.green,
      'examples': [
        {
          'en': 'May I come in?',
          'uz': 'Kirishim mumkinmi?',
          'type': 'Rasmiy ruxsat'
        },
        {
          'en': 'It may be true',
          'uz': 'Bu haqiqat bo\'lishi mumkin',
          'type': 'Ehtimollik'
        },
        {
          'en': 'You may leave early',
          'uz': 'Erta ketishingiz mumkin',
          'type': 'Ruxsat berish'
        },
      ],
      'usage': 'Rasmiy ruxsat so\'rash va berish, ehtimollik',
      'formula': 'Subject + may + verb (base form)'
    },
    {
      'verb': 'MIGHT',
      'meaning': 'Mumkin (kam ehtimol)',
      'color': Colors.teal,
      'examples': [
        {
          'en': 'I might go to the party',
          'uz': 'Ziyofatga borishim mumkin',
          'type': 'Kuchsiz ehtimollik'
        },
        {
          'en': 'You might be right',
          'uz': 'Siz haq bo\'lishingiz mumkin',
          'type': 'Taxmin'
        },
        {
          'en': 'It might rain tomorrow',
          'uz': 'Ertaga yomg\'ir yog\'ishi mumkin',
          'type': 'Ehtimollik'
        },
      ],
      'usage': 'Kuchsiz ehtimollik va taxminlar uchun',
      'formula': 'Subject + might + verb (base form)'
    },
    {
      'verb': 'MUST',
      'meaning': 'Kerak, majbur',
      'color': Colors.red,
      'examples': [
        {
          'en': 'You must study hard',
          'uz': 'Siz qattiq o\'qishingiz kerak',
          'type': 'Majburiyat'
        },
        {
          'en': 'She must be tired',
          'uz': 'U charchagan bo\'lsa kerak',
          'type': 'Kuchli taxmin'
        },
        {
          'en': 'We must finish this today',
          'uz': 'Biz buni bugun tugatishimiz kerak',
          'type': 'Zaruriyat'
        },
      ],
      'usage': 'Majburiyat, kuchli zaruriyat, ishonchli taxmin',
      'formula': 'Subject + must + verb (base form)'
    },
    {
      'verb': 'SHOULD',
      'meaning': 'Kerak edi, tavsiya',
      'color': Colors.orange,
      'examples': [
        {
          'en': 'You should eat healthy food',
          'uz': 'Siz sog\'lom ovqat yeyishingiz kerak',
          'type': 'Tavsiya'
        },
        {
          'en': 'I should have studied more',
          'uz': 'Men ko\'proq o\'qishim kerak edi',
          'type': 'Pushaymon'
        },
        {
          'en': 'The bus should arrive soon',
          'uz': 'Avtobus tez orada kelishi kerak',
          'type': 'Kutish'
        },
      ],
      'usage': 'Tavsiya berish, majburiyat, kutish',
      'formula': 'Subject + should + verb (base form)'
    },
    {
      'verb': 'WILL',
      'meaning': 'Qiladi, qilaman (kelajak)',
      'color': Colors.purple,
      'examples': [
        {
          'en': 'I will help you',
          'uz': 'Men sizga yordam beraman',
          'type': 'Va\'da'
        },
        {
          'en': 'It will rain tomorrow',
          'uz': 'Ertaga yomg\'ir yog\'adi',
          'type': 'Bashorat'
        },
        {
          'en': 'Will you come with me?',
          'uz': 'Men bilan kelasizmi?',
          'type': 'So\'rov'
        },
      ],
      'usage': 'Kelajak zamon, va\'da, bashorat',
      'formula': 'Subject + will + verb (base form)'
    },
    {
      'verb': 'WOULD',
      'meaning': 'Qilardi, xohlamoq',
      'color': Colors.pink,
      'examples': [
        {
          'en': 'I would like some tea',
          'uz': 'Men choy xohlardim',
          'type': 'Muloyim so\'rov'
        },
        {
          'en': 'He would play football every day',
          'uz': 'U har kuni futbol o\'ynardi',
          'type': 'O\'tmishdagi odat'
        },
        {
          'en': 'Would you mind closing the door?',
          'uz': 'Eshikni yopib qo\'yishingiz mumkinmi?',
          'type': 'Iltimos'
        },
      ],
      'usage': 'Muloyim so\'rov, o\'tmishdagi odatlar, xayoliy vaziyat',
      'formula': 'Subject + would + verb (base form)'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Row(
          children: [
            Icon(Icons.school, color: Colors.white, size: 28),
            SizedBox(width: 10),
            Text(
              'Modal Verbs',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 8,
        shadowColor: Colors.deepPurple.withOpacity(0.3),
        centerTitle: false,
      ),
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header section
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.deepPurple.shade300,
                        Colors.deepPurple.shade500
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.withOpacity(0.3),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.lightbulb_outline,
                        size: 50,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Modal Verblarni O\'rganish',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Ingliz tilining eng muhim grammatik qoidalaridan biri',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.9),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 25),

                // Progress indicator
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.assignment_turned_in,
                          color: Colors.green, size: 24),
                      SizedBox(width: 10),
                      Text(
                        'Jarayon: ${completedVerbs.length}/${modalVerbs.length} yakunlandi',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                      Spacer(),
                      CircularProgressIndicator(
                        value: completedVerbs.length / modalVerbs.length,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                // Modal verbs list
                ...modalVerbs.asMap().entries.map((entry) {
                  int index = entry.key;
                  Map<String, dynamic> verb = entry.value;
                  bool isExpanded = expandedIndex == index;
                  bool isCompleted = completedVerbs.contains(index);

                  return Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Card(
                      elevation: isExpanded ? 8 : 3,
                      shadowColor: verb['color'].withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(
                          color:
                              isCompleted ? Colors.green : Colors.transparent,
                          width: isCompleted ? 2 : 0,
                        ),
                      ),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: isExpanded
                              ? LinearGradient(
                                  colors: [
                                    verb['color'].withOpacity(0.1),
                                    Colors.white,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )
                              : null,
                        ),
                        child: Column(
                          children: [
                            // Header
                            InkWell(
                              onTap: () {
                                setState(() {
                                  expandedIndex = isExpanded ? null : index;
                                });
                              },
                              borderRadius: BorderRadius.circular(15),
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  children: [
                                    // Verb icon
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: verb['color'],
                                        borderRadius: BorderRadius.circular(25),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                verb['color'].withOpacity(0.3),
                                            blurRadius: 8,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          verb['verb'][0],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: 15),

                                    // Verb info
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            verb['verb'],
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: verb['color'],
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            verb['meaning'],
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Status icon
                                    if (isCompleted)
                                      Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                        size: 24,
                                      ),

                                    SizedBox(width: 10),

                                    // Expand icon
                                    AnimatedRotation(
                                      turns: isExpanded ? 0.5 : 0,
                                      duration: Duration(milliseconds: 300),
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: verb['color'],
                                        size: 28,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Expanded content
                            if (isExpanded) ...[
                              Divider(color: verb['color'].withOpacity(0.3)),
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Usage
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: verb['color'].withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: verb['color'].withOpacity(0.3),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.info,
                                                  color: verb['color'],
                                                  size: 20),
                                              SizedBox(width: 8),
                                              Text(
                                                'Ishlatilishi:',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: verb['color'],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            verb['usage'],
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(height: 15),

                                    // Formula
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: Colors.blue.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.blue.withOpacity(0.3),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.auto_fix_high,
                                                  color: Colors.blue, size: 20),
                                              SizedBox(width: 8),
                                              Text(
                                                'Formula:',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            verb['formula'],
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'monospace',
                                              color: Colors.grey[700],
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(height: 15),

                                    // Examples
                                    Text(
                                      'Misollar:',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: verb['color'],
                                      ),
                                    ),

                                    SizedBox(height: 10),

                                    ...verb['examples']
                                        .asMap()
                                        .entries
                                        .map((exampleEntry) {
                                      Map<String, dynamic> example =
                                          exampleEntry.value;

                                      return Padding(
                                        padding: EdgeInsets.only(bottom: 12),
                                        child: Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: verb['color']
                                                  .withOpacity(0.2),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                blurRadius: 3,
                                                offset: Offset(0, 1),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Type badge
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 8,
                                                  vertical: 4,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: verb['color']
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Text(
                                                  example['type'],
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: verb['color'],
                                                  ),
                                                ),
                                              ),

                                              SizedBox(height: 10),

                                              // English
                                              Row(
                                                children: [
                                                  Icon(Icons.language,
                                                      color: Colors.blue,
                                                      size: 18),
                                                  SizedBox(width: 8),
                                                  Expanded(
                                                    child: Text(
                                                      example['en'],
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.grey[800],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              SizedBox(height: 8),

                                              // Uzbek translation
                                              Row(
                                                children: [
                                                  Icon(Icons.translate,
                                                      color: Colors.green,
                                                      size: 18),
                                                  SizedBox(width: 8),
                                                  Expanded(
                                                    child: Text(
                                                      example['uz'],
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.grey[600],
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }).toList(),

                                    SizedBox(height: 15),

                                    // Complete button
                                    SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          setState(() {
                                            if (isCompleted) {
                                              completedVerbs.remove(index);
                                            } else {
                                              completedVerbs.add(index);
                                            }
                                          });
                                        },
                                        icon: Icon(
                                          isCompleted
                                              ? Icons.refresh
                                              : Icons.check,
                                          color: Colors.white,
                                        ),
                                        label: Text(
                                          isCompleted
                                              ? 'Qayta ko\'rish'
                                              : 'O\'rgandim',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: isCompleted
                                              ? Colors.orange
                                              : verb['color'],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          elevation: 5,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),

                SizedBox(height: 30),

                // Footer
                if (completedVerbs.length == modalVerbs.length)
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.green.shade400, Colors.green.shade600],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.3),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.celebration,
                          size: 50,
                          color: Colors.white,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Tabriklaymiz!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Siz barcha Modal Verblarni muvaffaqiyatli o\'rgandingiz!',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.9),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
