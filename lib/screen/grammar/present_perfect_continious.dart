import 'package:flutter/material.dart';

class PresentPerfectContiniousPage extends StatefulWidget {
  @override
  _PresentPerfectContiniousPageState createState() =>
      _PresentPerfectContiniousPageState();
}

class _PresentPerfectContiniousPageState
    extends State<PresentPerfectContiniousPage> with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentExampleIndex = 0;
  String _quizAnswer = '';
  bool _showQuizResult = false;
  bool _isQuizCorrect = false;

  final List<Map<String, String>> _examples = [
    {
      'positive': 'I have been working at a bank.',
      'negative': "I haven't been working at a bank.",
      'question': 'Have I been working at a bank?'
    },
    {
      'positive': 'She has been speaking English.',
      'negative': "She hasn't been speaking English.",
      'question': 'Has she been speaking English?'
    },
    {
      'positive': 'They have been living in New York.',
      'negative': "They haven't been living in New York.",
      'question': 'Have they been living in New York?'
    },
    {
      'positive': 'He has been playing football.',
      'negative': "He hasn't been playing football.",
      'question': 'Has he been playing football?'
    }
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildDefinitionTab(),
                  _buildStructureTab(),
                  _buildExamplesTab(),
                  _buildPracticeTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.grey[700]),
        onPressed: () => Navigator.pop(context),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Present Perfect Continuous',
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Asosiy hozirgi zamon',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TabBar(
        dividerHeight: 0,
        controller: _tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            colors: [Colors.blue[400]!, Colors.purple[400]!],
          ),
        ),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey[600],
        labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        tabs: [
          Tab(text: '    Ta\'rif     '),
          Tab(text: 'Struktura'),
          Tab(text: ' Misollar '),
          Tab(
            text: 'Amaliyot',
          ),
        ],
      ),
    );
  }

  Widget _buildDefinitionTab() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCard(
            icon: Icons.lightbulb_outline,
            title: 'Present Perfect Continuous',
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Asosiy hozirgi zamon - harakat o‘tmishda boshlangan va hali ham davom etayotgan holatlarni ifodalaydi. Bu zamon davomiylikka urg‘u beradi.',
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
                SizedBox(height: 16),
                _buildFeatureItem(
                  icon: Icons.timelapse,
                  title: 'Uzoq davom etayotgan ish',
                  description:
                      'O‘tmishda boshlangan va hanuzgacha davom etayotgan harakat',
                ),
                _buildFeatureItem(
                  icon: Icons.access_time_filled,
                  title: 'Harakat davomiyligi',
                  description: 'Ish qancha vaqt davom etayotganini bildiradi',
                ),
                _buildFeatureItem(
                  icon: Icons.replay_circle_filled,
                  title: 'Yaqinda boshlanib hali tugamagan ish',
                  description:
                      'Yaqinda boshlangan va hozir ham davom etayotgan holat',
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          _buildCard(
            icon: Icons.schedule,
            title: 'Qachon ishlatiladi?',
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildUsageItem('Uzoq vaqtdan beri bajarilayotgan ish',
                    'I have been waking up at 7 AM for years'),
                _buildUsageItem('Quyosh chiqishini uzoqdan beri kuzatayotgan',
                    'I have been watching the sunrise since early morning'),
                _buildUsageItem('Tatib ko‘rishni davom ettirayotgan holat',
                    'She has been trying different chocolates all day'),
                _buildUsageItem('Davom etayotgan ish faoliyati',
                    'He has been working as a doctor for 10 years'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStructureTab() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCard(
            icon: Icons.construction,
            title: 'Tasdiq gapi (+)',
            content: Column(
              children: [
                _buildFormulaBox('Subject + have/has been + Verb-ing + Object'),
                SizedBox(height: 12),
                _buildStructureExample('I', 'have been working', 'at home'),
                _buildStructureExample('She', 'has been studying', 'English'),
                _buildStructureExample('They', 'have been playing', 'football'),
              ],
            ),
          ),
          SizedBox(height: 16),
          _buildCard(
            icon: Icons.block,
            title: 'Inkor gapi (-)',
            content: Column(
              children: [
                _buildFormulaBox(
                    'Subject + haven\'t/hasn\'t been + Verb-ing + Object'),
                SizedBox(height: 12),
                _buildStructureExample('I', "haven't been working", 'at home'),
                _buildStructureExample(
                    'She', "hasn't been studying", 'English'),
                _buildStructureExample(
                    'They', "haven't been playing", 'football'),
              ],
            ),
          ),
          SizedBox(height: 16),
          _buildCard(
            icon: Icons.help_outline,
            title: 'Savol gapi (?)',
            content: Column(
              children: [
                _buildFormulaBox(
                    'Have/Has + Subject + been + Verb-ing + Object?'),
                SizedBox(height: 12),
                _buildStructureExample('Have', 'I been working', 'at home?'),
                _buildStructureExample('Has', 'she been studying', 'English?'),
                _buildStructureExample(
                    'Have', 'they been playing', 'football?'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExamplesTab() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Misollar (${_currentExampleIndex + 1}/${_examples.length})',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: _currentExampleIndex > 0
                        ? () => setState(() => _currentExampleIndex--)
                        : null,
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  IconButton(
                    onPressed: _currentExampleIndex < _examples.length - 1
                        ? () => setState(() => _currentExampleIndex++)
                        : null,
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: PageView.builder(
            itemCount: _examples.length,
            onPageChanged: (index) =>
                setState(() => _currentExampleIndex = index),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildExampleCard(
                      'Tasdiq gapi (+)',
                      _examples[index]['positive']!,
                      Colors.green,
                      Icons.check_circle,
                    ),
                    SizedBox(height: 16),
                    _buildExampleCard(
                      'Inkor gapi (-)',
                      _examples[index]['negative']!,
                      Colors.red,
                      Icons.cancel,
                    ),
                    SizedBox(height: 16),
                    _buildExampleCard(
                      'Savol gapi (?)',
                      _examples[index]['question']!,
                      Colors.blue,
                      Icons.help,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPracticeTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCard(
            icon: Icons.quiz,
            title: 'Amaliyot mashqi',
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quyidagi gapni to\'ldiring:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue[200]!),
                  ),
                  child: Text(
                    'I have ___ driving my homework',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  onChanged: (value) => setState(() => _quizAnswer = value),
                  decoration: InputDecoration(
                    hintText: 'Javobingizni kiriting...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _quizAnswer.isNotEmpty ? _checkQuizAnswer : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[600],
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Javobni tekshirish',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: _quizAnswer.isNotEmpty
                            ? Colors.white
                            : Colors.black.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                ),
                if (_showQuizResult) _buildQuizResult(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
      {required IconData icon,
      required String title,
      required Widget content}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: Colors.blue[600], size: 24),
                ),
                SizedBox(width: 12),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(
      {required IconData icon,
      required String title,
      required String description}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(icon, color: Colors.green[600], size: 16),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                Text(
                  description,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUsageItem(String title, String example) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          SizedBox(height: 4),
          Text(
            example,
            style: TextStyle(
              color: Colors.blue[600],
              fontSize: 14,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormulaBox(String formula) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple[100]!, Colors.blue[100]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.purple[200]!),
      ),
      child: Text(
        formula,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.purple[800],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildStructureExample(String part1, String part2, String part3) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          _buildExamplePart(part1, Colors.green[100]!, Colors.green[700]!),
          SizedBox(width: 8),
          _buildExamplePart(part2, Colors.blue[100]!, Colors.blue[700]!),
          SizedBox(width: 8),
          _buildExamplePart(part3, Colors.orange[100]!, Colors.orange[700]!),
        ],
      ),
    );
  }

  Widget _buildExamplePart(String text, Color bgColor, Color textColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildExampleCard(
      String type, String example, Color color, IconData icon) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3), width: 2),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              SizedBox(width: 8),
              Text(
                type,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            example,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }

  void _checkQuizAnswer() {
    bool isCorrect = _quizAnswer.toLowerCase().trim() == 'been';
    setState(() {
      _isQuizCorrect = isCorrect;
      _showQuizResult = true;
    });
  }

  Widget _buildQuizResult() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _isQuizCorrect ? Colors.green[50] : Colors.red[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _isQuizCorrect ? Colors.green[300]! : Colors.red[300]!,
        ),
      ),
      child: Row(
        children: [
          Icon(
            _isQuizCorrect ? Icons.check_circle : Icons.cancel,
            color: _isQuizCorrect ? Colors.green[600] : Colors.red[600],
            size: 24,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _isQuizCorrect ? 'To\'g\'ri!' : 'Noto\'g\'ri!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _isQuizCorrect ? Colors.green[700] : Colors.red[700],
                  ),
                ),
                if (!_isQuizCorrect)
                  Text(
                    'To\'g\'ri javob: "been"',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
