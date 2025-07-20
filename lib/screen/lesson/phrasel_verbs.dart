import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class PhrasalVerbsPage extends StatefulWidget {
  @override
  State<PhrasalVerbsPage> createState() => _PhrasalVerbsPageState();
}

class _PhrasalVerbsPageState extends State<PhrasalVerbsPage> {
  final FlutterTts flutterTts = FlutterTts();

  void _speak(String text) async {
    await flutterTts.setLanguage("en-US"); // Inglizcha tilda o'qiydi
    await flutterTts.setPitch(1); // Ovoz ohangi
    await flutterTts.speak(text); // Matnni o'qish
  }

  final List<Map<String, String>> phrasalVerbs = [
    {
      'verb': 'Carry on',
      'meaning': 'to continue',
      'example': 'He carried on talking despite the noise.'
    },
    {
      'verb': 'Come across',
      'meaning': 'to find by chance',
      'example': 'I came across an old photo yesterday.'
    },
    {
      'verb': 'Give up',
      'meaning': 'to stop trying',
      'example': 'She gave up smoking last year.'
    },
    {
      'verb': 'Look after',
      'meaning': 'to take care of',
      'example': 'She looks after her younger brother.'
    },
    {
      'verb': 'Run out of',
      'meaning': 'to have no more left',
      'example': 'We ran out of milk this morning.'
    },
    {
      'verb': 'Take off',
      'meaning': 'to remove or to fly',
      'example': 'The plane took off on time.'
    },
    {
      'verb': 'Turn on',
      'meaning': 'to start a machine',
      'example': 'Please turn on the lights.'
    },
    {
      'verb': 'Turn off',
      'meaning': 'to stop a machine',
      'example': 'Don’t forget to turn off the TV.'
    },
    {
      'verb': 'Set up',
      'meaning': 'to arrange or prepare',
      'example': 'They set up the meeting for Monday.'
    },
    {
      'verb': 'Break down',
      'meaning': 'to stop working',
      'example': 'My car broke down on the way.'
    },
    {
      'verb': 'Bring up',
      'meaning': 'to mention or raise a topic',
      'example': 'She brought up an interesting point.'
    },
    {
      'verb': 'Catch up',
      'meaning': 'to reach the same level',
      'example': 'I’ll catch up with you later.'
    },
    {
      'verb': 'Check in',
      'meaning': 'to register at a hotel or airport',
      'example': 'We checked in at 3 p.m.'
    },
    {
      'verb': 'Check out',
      'meaning': 'to leave a hotel or look at something',
      'example': 'Let’s check out this new café.'
    },
    {
      'verb': 'Come back',
      'meaning': 'to return',
      'example': 'He came back from Paris yesterday.'
    },
    {
      'verb': 'Cut down on',
      'meaning': 'to reduce',
      'example': 'I need to cut down on sugar.'
    },
    {
      'verb': 'Do over',
      'meaning': 'to do again',
      'example': 'You’ll have to do the project over.'
    },
    {
      'verb': 'Fill in',
      'meaning': 'to complete (a form)',
      'example': 'Please fill in this form.'
    },
    {
      'verb': 'Find out',
      'meaning': 'to discover',
      'example': 'I found out the truth.'
    },
    {
      'verb': 'Get along',
      'meaning': 'to have a good relationship',
      'example': 'They get along very well.'
    },
    {
      'verb': 'Get back',
      'meaning': 'to return',
      'example': 'I’ll get back to you soon.'
    },
    {
      'verb': 'Get over',
      'meaning': 'to recover from',
      'example': 'She got over the flu quickly.'
    },
    {
      'verb': 'Give in',
      'meaning': 'to stop resisting',
      'example': 'He gave in to temptation.'
    },
    {
      'verb': 'Go ahead',
      'meaning': 'to proceed',
      'example': 'You can go ahead with your plan.'
    },
    {
      'verb': 'Go over',
      'meaning': 'to review',
      'example': 'Let’s go over your homework.'
    },
    {
      'verb': 'Grow up',
      'meaning': 'to become an adult',
      'example': 'He grew up in Canada.'
    },
    {
      'verb': 'Hang out',
      'meaning': 'to spend time',
      'example': 'They hang out at the mall.'
    },
    {'verb': 'Hold on', 'meaning': 'to wait', 'example': 'Hold on a second.'},
    {
      'verb': 'Keep on',
      'meaning': 'to continue',
      'example': 'Keep on studying.'
    },
    {
      'verb': 'Look for',
      'meaning': 'to search',
      'example': 'I’m looking for my keys.'
    },
    {
      'verb': 'Look out',
      'meaning': 'to be careful',
      'example': 'Look out for that car!'
    },
    {
      'verb': 'Make up',
      'meaning': 'to invent or reconcile',
      'example': 'They made up after the argument.'
    },
    {
      'verb': 'Pass away',
      'meaning': 'to die',
      'example': 'His grandfather passed away.'
    },
    {
      'verb': 'Pick up',
      'meaning': 'to collect',
      'example': 'I picked up the kids from school.'
    },
    {
      'verb': 'Put off',
      'meaning': 'to delay',
      'example': 'They put off the meeting.'
    },
    {
      'verb': 'Put on',
      'meaning': 'to dress',
      'example': 'She put on her coat.'
    },
    {
      'verb': 'Put out',
      'meaning': 'to extinguish',
      'example': 'They put out the fire.'
    },
    {
      'verb': 'Run into',
      'meaning': 'to meet by chance',
      'example': 'I ran into an old friend today.'
    },
    {
      'verb': 'Set off',
      'meaning': 'to start a journey',
      'example': 'We set off at dawn.'
    },
    {
      'verb': 'Show up',
      'meaning': 'to appear',
      'example': 'She showed up late.'
    },
    {
      'verb': 'Slow down',
      'meaning': 'to reduce speed',
      'example': 'Please slow down!'
    },
    {
      'verb': 'Speak up',
      'meaning': 'to talk louder',
      'example': 'Can you speak up, please?'
    },
    {
      'verb': 'Stand by',
      'meaning': 'to be ready or support',
      'example': 'He stood by her decision.'
    },
    {
      'verb': 'Take away',
      'meaning': 'to remove',
      'example': 'The waiter took away the plates.'
    },
    {
      'verb': 'Take care of',
      'meaning': 'to look after',
      'example': 'She takes care of her grandma.'
    },
    {
      'verb': 'Throw away',
      'meaning': 'to discard',
      'example': 'He threw away the old magazines.'
    },
    {
      'verb': 'Turn down',
      'meaning': 'to reject',
      'example': 'They turned down the offer.'
    },
    {
      'verb': 'Wake up',
      'meaning': 'to stop sleeping',
      'example': 'I woke up early today.'
    },
    {
      'verb': 'Work out',
      'meaning': 'to exercise or solve',
      'example': 'I work out every day.'
    },
    {
      'verb': 'Write down',
      'meaning': 'to note',
      'example': 'Write down the address.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text(
          "100 - Phrasal Verbs",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(12),
          itemCount: phrasalVerbs.length,
          itemBuilder: (context, index) {
            final item = phrasalVerbs[index];
            return Card(
              margin: EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          item['verb']!,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[800]),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () => _speak(item['verb']!),
                          icon: Icon(Icons.volume_up),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Meaning: ${item['meaning']}',
                      style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Example: ${item['example']}',
                      style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
