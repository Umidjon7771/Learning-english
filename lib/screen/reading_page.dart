import 'package:flutter/material.dart';

// Models
class ReadingCategory {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final List<Story> stories;

  ReadingCategory({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.stories,
  });
}

class Story {
  final String title;
  final String content;
  final int readTime;
  final String category;

  Story({
    required this.title,
    required this.content,
    required this.readTime,
    required this.category,
  });
}

// Reading Page
class ReadingPage extends StatefulWidget {
  @override
  _ReadingPageState createState() => _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage> {
  final List<ReadingCategory> categories = [
    ReadingCategory(
      title: 'Fairy tales',
      subtitle: 'Interesting stories for children',
      icon: Icons.auto_stories,
      color: Colors.blue,
      stories: [
        Story(
          title: '🐰 The Clever Rabbit and the Hungry Wolf',
          readTime: 3,
          category: 'Tales',
          content:
              '''Once upon a time, in a big green forest, there lived a clever little rabbit.
He was kind and always helped other animals.

One day, a hungry wolf saw the rabbit and wanted to catch him.

"Ah, little rabbit," said the wolf, "I will eat you for dinner!"

But the rabbit was very smart. He stayed calm and said:

"Dear Mr. Wolf, I am very small and thin. You won’t enjoy eating me.
But look! Under that tree, there’s a big fat chicken. Why don’t you eat that one instead?"

The wolf looked at the chicken, licked his lips, and ran after it.

The rabbit quickly ran away and hid in a safe place.

When the wolf came back, the rabbit was gone.
He looked around but found nothing. The clever rabbit had escaped!

From that day on, the wolf remembered how smart the rabbit was.

''',
        ),
        Story(
          title: '🐻 The Kind Bear',
          readTime: 4,
          category: 'Tales',
          content: '''In a quiet forest, there lived a big but kind bear.
All the other animals were afraid of him because he looked so big and strong.

One day, a little bird hurt its leg and could not fly.
The bear saw the bird and felt sorry for it.

He gently picked up the bird and took it to his home.
The bear cared for the bird’s leg and gave it food every day.

After a week, the little bird got better.
It smiled and said to the bear:

"Thank you so much! From now on, I will always help you too."

Since that day, the bear and the bird became best friends.
They helped each other and shared many happy moments.''',
        ),
        Story(
          title: '🐜 The Hardworking Ant',
          readTime: 2,
          category: 'Tales',
          content: '''One sunny summer, a little ant worked every day.
She carried food to her home and saved it for the winter.

Nearby, a grasshopper sang songs and played all day.

“Why are you working so hard?” asked the grasshopper.

The ant replied, “I’m saving food so I won’t be hungry in the winter.”

Winter came. Snow covered the ground.
The ant had plenty of food in her home.
But the grasshopper had nothing to eat.

The ant felt sorry for him and shared her food.''',
        ),
      ],
    ),
    ReadingCategory(
      title: 'Story',
      subtitle: 'Life and interesting stories',
      icon: Icons.library_books,
      color: Colors.green,
      stories: [
        Story(
          title: 'Day one',
          readTime: 5,
          category: 'Story',
          content: '''Alibek was not ready for his first day at school.  
He was afraid to make new friends.

When he entered the classroom, all the children looked at him.  
Alibek felt shy and nervous.

The teacher introduced him to the class.  
Then a boy named Sardor came up to him.

"Hi, I'm Sardor. Let's be friends!" he said with a big smile.

Alibek was very happy. They quickly became good friends.

At the end of the day, Alibek told his mother:  
"I really liked school! And I already have a new friend."

Moral of the story:  
The first step is always hard, but the result can be amazing.''',
        ),
        Story(
          title: 'Dream and Action',
          readTime: 6,
          category: 'Story',
          content: '''Nigora dreamed of becoming a doctor.  
But her family was poor.

Every day, she woke up early to work and earn money.  
In the evenings, she studied hard.

She faced many difficulties, but she never gave up.

After five years, she passed the university exams with excellent results.

Now she is studying at the medical faculty and getting closer to her dream.

Her mother looked at her proudly and said:  
"You are my true pride!"

Moral of the story:  
Dream + Hard work = Success''',
        ),
        Story(
          title: 'Little help',
          readTime: 4,
          category: 'Story',
          content:
              '''Akmal was riding the bus when he saw an old woman with heavy bags.

He stood up and offered her his seat.  
He also helped her hold the bags.

The old woman smiled with joy and gave him her blessings.

At the next stop, as she got off the bus, she said:  
"My child, I will never forget your kindness."

When Akmal got home, his heart felt warm.

A small act of kindness had brought great happiness.

Moral of the story:  
Doing good is the greatest happiness.''',
        ),
      ],
    ),
    ReadingCategory(
      title: 'Motivational Stories',
      subtitle: 'Inspiring and uplifting',
      icon: Icons.emoji_events,
      color: Colors.orange,
      stories: [
        Story(
          title: 'Unfulfilled Dreams',
          readTime: 7,
          category: 'Motivation',
          content:
              '''Since he was a little boy, Jamshid wanted to be an artist.  
But people around him used to say:  
"You won’t make money from art."

So he became a music teacher, but he never stopped drawing.

Every day after work, he painted for two hours.

After 10 years, a gallery owner saw his paintings and made him an offer.

Now, Jamshid is a famous artist.  
His art exhibitions are known all over the city.

He gives advice to young artists:  
"Never give up on your dreams!"

Moral of the story:  
A true dream is never too late.''',
        ),
        Story(
          title: 'Success Formula',
          readTime: 5,
          category: 'Motivation',
          content: '''Bekzod was the weakest student in his class.  
He always got low grades in math.

One day, a new teacher came and told him:  
"You are a smart boy, you just need to practice more."

From that day, Bekzod studied math for 3 hours every day.

After 6 months, he became the best student in his class.

In the university entrance exam, he scored 100 points in math.

Now he is a mathematician and teaches other children.

Moral of the story:  
Talent + Hard work + Patience = Success''',
        ),
        Story(
          title: 'The Power Within Us',
          readTime: 6,
          category: 'Motivation',
          content: '''Malika was a very shy girl.  
She couldn’t even speak to people around her.

When she had to give a presentation at school, she felt scared and nervous.

A school psychologist told her:  
"You are not less than anyone else. You just need to believe in yourself."

From that day, Malika practiced speaking in front of a mirror every day.

At first, she struggled to talk, but slowly she got better and more confident.

After one year, she became the best speaker in her class.

Now, she hosts a show on television.

Moral of the story:  
The biggest enemy is our own fear.''',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(
          'Reading book',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Container(
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Card(
              child: ListTile(
                contentPadding: EdgeInsets.all(20),
                leading: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: category.color,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    category.icon,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                title: Text(
                  category.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      category.subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: category.color.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${category.stories.length} stories',
                        style: TextStyle(
                          fontSize: 12,
                          color: category.color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: category.color,
                  size: 20,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StoriesListPage(category: category),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

// Stories List Page
class StoriesListPage extends StatelessWidget {
  final ReadingCategory category;

  const StoriesListPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(category.title),
        backgroundColor: category.color,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: category.stories.length,
        itemBuilder: (context, index) {
          final story = category.stories[index];
          return Container(
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(20),
              title: Text(
                story.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 16, color: category.color),
                      SizedBox(width: 4),
                      Text(
                        '${story.readTime} minutes',
                        style: TextStyle(
                          fontSize: 12,
                          color: category.color,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Icon(
                Icons.play_circle_fill,
                color: category.color,
                size: 30,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StoryReaderPage(
                      story: story,
                      categoryColor: category.color,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// Story Reader Page
class StoryReaderPage extends StatefulWidget {
  final Story story;
  final Color categoryColor;

  const StoryReaderPage(
      {Key? key, required this.story, required this.categoryColor})
      : super(key: key);

  @override
  _StoryReaderPageState createState() => _StoryReaderPageState();
}

class _StoryReaderPageState extends State<StoryReaderPage> {
  double fontSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.story.title,
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: widget.categoryColor,
        foregroundColor: Colors.white,
        actions: [
          PopupMenuButton<double>(
            icon: Icon(Icons.text_fields),
            onSelected: (value) {
              setState(() {
                fontSize = value;
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: 14.0, child: Text('Small')),
              PopupMenuItem(value: 16.0, child: Text('Medium')),
              PopupMenuItem(value: 18.0, child: Text('Big')),
              PopupMenuItem(value: 20.0, child: Text('Very big')),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Story Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    widget.categoryColor.withOpacity(0.1),
                    widget.categoryColor.withOpacity(0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.story.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.access_time,
                          size: 18, color: widget.categoryColor),
                      SizedBox(width: 6),
                      Text(
                        'Reading time: ${widget.story.readTime} minutes',
                        style: TextStyle(
                          fontSize: 14,
                          color: widget.categoryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),
            SafeArea(
              child: Text(
                widget.story.content,
                style: TextStyle(
                  fontSize: fontSize,
                  height: 1.6,
                  color: Colors.black87,
                  fontFamily: 'poppins',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
