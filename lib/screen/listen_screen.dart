import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ListenScreen extends StatefulWidget {
  @override
  _ListenScreenState createState() => _ListenScreenState();
}

class _ListenScreenState extends State<ListenScreen> {
  FlutterTts flutterTts = FlutterTts();
  bool isSpeaking = false;

  // Stories and tales data
  final List<Story> stories = [
    Story(
      id: 1,
      title: "The Clever Fox and the Foolish Wolf",
      image: "assets/images/the_clever_fox.png",
      content: """
Once upon a time, in a deep forest, there lived a clever little fox. He was known for his quick thinking and sharp mind. One day, while searching for food, the fox met a big, hungry wolf.

The wolf growled, “Little fox, I am very hungry. I will eat you for lunch!”

But the fox smiled calmly and said, “Oh, Mr. Wolf, you don’t want to eat me now. I am very thin and weak. If you wait just one week, I will be much fatter and tastier.”

The wolf thought for a moment and said, “Hmm… okay. But don’t try to trick me!”

The fox promised, “I would never trick you. Let’s meet here next week at this same time.”

The week passed quickly. When the wolf returned, the fox was waiting—but this time, he was standing near a deep, muddy pit.

The wolf licked his lips. “Now, little fox, I will finally eat you!”

The fox nodded. “Yes, but before you eat me, look into that pit. There’s a big cheese down there. Wouldn’t you like some cheese before lunch?”

The wolf leaned over the edge and saw the reflection of the moon in the muddy water. It looked like a round piece of cheese.

“Yum!” he said, and jumped into the pit to get it.

SPLASH!

He landed in cold, sticky mud. The fox laughed and said, “Next time, don’t believe everything you see.”

Then the clever fox ran away, safe and free.
      """,
    ),
    Story(
      id: 2,
      title: "The Turtle and the Magic Hat",
      image: "assets/images/the_turtle_and_magic_hat.png",
      content: """
Once upon a time, in a small village near a river, there lived a slow but kind turtle named Toby. He loved helping others, even though he could never move fast.

One hot afternoon, while walking near the riverbank, Toby saw something shiny under a tree. It was an old, dusty hat. As he touched it, the hat spoke!

“Hello, kind turtle,” the hat said. “I am a magic hat. I can give you one wish.”

Toby was surprised but smiled and said, “I don’t want riches or power. I just wish I could be faster, so I can help more animals.”

“Very well,” said the hat. “From now on, whenever someone says ‘Go, Toby, Go!’ you will run faster than the wind.”

Excited, Toby ran to the forest. There, he saw a rabbit trapped under a fallen branch.

“Help! Someone help me!” cried the rabbit.

Toby shouted, “Don’t worry, I’ll help!” But the branch was far, and he was still slow.

Then, the rabbit shouted, “Go, Toby, Go!”

Suddenly, Toby zoomed forward like a rocket and lifted the branch easily.

Everyone in the forest cheered. From that day on, animals called Toby “The Fastest Turtle in the World.”

But Toby always said, “It’s not about speed. It’s about kindness.”
      """,
    ),
    Story(
      id: 3,
      title: "Max the Monkey and the Banana Thief",
      image: "assets/images/max_the_monkey.png",
      content: """
Deep in the heart of the jungle, there lived a playful monkey named Max. Max loved bananas more than anything in the world. He had a secret banana tree behind a waterfall, and no one knew about it.

One morning, Max woke up to find that some bananas were missing.

“Oh no!” he shouted. “Someone stole my bananas!”

Max decided to catch the thief. He set up a clever trap using vines, leaves, and a big basket. He hid behind a bush and waited.

Hours passed… then—snap! The trap closed!

Max ran to the basket and shouted, “Aha! I caught you!”

But inside the basket was not a monkey… it was a parrot!

“Squawk! I didn’t steal them!” said the parrot. “I saw a raccoon sneaking around here last night!”

Max let the parrot go and followed the footprints in the mud. They led to a hollow tree. Max climbed up and peeked inside.

“BOO!” shouted the raccoon, and Max fell out of the tree!

The raccoon laughed and said, “Okay, okay! I took a few bananas. But they were SO good!”

Max crossed his arms. “You should’ve asked.”

“You’re right,” said the raccoon. “I’m sorry.”

Max forgave him and said, “Next time, we share. But don’t scare me again!”

They both laughed and enjoyed bananas together under the sun.
      """,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  _initTts() async {
    await flutterTts.setLanguage("en-US"); // English language
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
  }

  Future<void> _speak(String text) async {
    if (isSpeaking) {
      await flutterTts.stop();
      setState(() {
        isSpeaking = false;
      });
    } else {
      setState(() {
        isSpeaking = true;
      });
      await flutterTts.speak(text);

      flutterTts.setCompletionHandler(() {
        setState(() {
          isSpeaking = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () async {
            await flutterTts.stop();
            flutterTts.stop();
            Navigator.pop(context);
          },
        ),
        title: Text('Story World'),
        backgroundColor: Colors.blue.shade500,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade50,
              Colors.deepPurple.shade100,
            ],
          ),
        ),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(16),
          itemCount: stories.length,
          itemBuilder: (context, index) {
            final story = stories[index];
            return Card(
              margin: EdgeInsets.only(bottom: 16),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StoryDetailScreen(
                        story: story,
                        onSpeak: _speak,
                        isSpeaking: isSpeaking,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(story.image),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.4),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            story.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.headphones,
                                color: Colors.white70,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Tap to listen',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }
}

class StoryDetailScreen extends StatelessWidget {
  final Story story;
  final Function(String) onSpeak;
  final bool isSpeaking;

  const StoryDetailScreen({
    Key? key,
    required this.story,
    required this.onSpeak,
    required this.isSpeaking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterTts flutterTts = FlutterTts();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            await flutterTts.stop();
            flutterTts.stop();
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(story.title),
        backgroundColor: Colors.blue.shade500,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepPurple.shade50,
                Colors.white,
              ],
            ),
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Rasm
                Container(
                  height: 330,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(story.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Matn
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        story.title,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple.shade800,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Text(
                          story.content.trim(),
                          style: TextStyle(
                            fontSize: 18,
                            height: 1.6,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),

                      // Tinglash tugmasi
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            onSpeak(story.content);
                          },
                          icon: Icon(
                            isSpeaking ? Icons.stop : Icons.play_arrow,
                            size: 28,
                          ),
                          label: Text(
                            isSpeaking ? 'Stop' : 'Listen to Story',
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 5,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
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

class Story {
  final int id;
  final String title;
  final String image;
  final String content;

  Story({
    required this.id,
    required this.title,
    required this.image,
    required this.content,
  });
}
