
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HelaEnglishApp());
}

const bg = Color(0xFF0B1025);
const purple = Color(0xFF7657F5);
const blue = Color(0xFF2789F5);

class Lesson {
  final String title;
  final String meaning;

  const Lesson(this.title, this.meaning);
}

const lessons = <Lesson>[
  Lesson('Hello', 'ආයුබෝවන්'),
  Lesson('Good morning', 'සුභ උදෑසනක්'),
  Lesson('Good afternoon', 'සුභ දහවලක්'),
  Lesson('Good evening', 'සුභ සන්ධ්‍යාවක්'),
  Lesson('Good night', 'සුභ රාත්‍රියක්'),
  Lesson('How are you?', 'ඔබට කොහොමද?'),
  Lesson('I am fine', 'මම හොඳින්'),
  Lesson('Thank you', 'ස්තුතියි'),
  Lesson('You are welcome', 'සාදරයෙන් පිළිගන්නවා'),
  Lesson('Excuse me', 'සමාවෙන්න'),
  Lesson('I am sorry', 'මට සමාවෙන්න'),
  Lesson('What is your name?', 'ඔයාගේ නම මොකක්ද?'),
  Lesson('My name is John', 'මගේ නම ජෝන්'),
  Lesson('Where are you from?', 'ඔයා කොහෙන්ද?'),
  Lesson('I am from Sri Lanka', 'මම ශ්‍රී ලංකාවෙන්'),
  Lesson('Nice to meet you', 'ඔබව හමුවීම සතුටක්'),
  Lesson('See you later', 'පසුව හමුවෙමු'),
  Lesson('Please help me', 'කරුණාකර මට උදව් කරන්න'),
  Lesson('I understand', 'මට තේරෙනවා'),
  Lesson('I do not understand', 'මට තේරෙන්නේ නැහැ'),
  Lesson('Please speak slowly', 'කරුණාකර හෙමින් කතා කරන්න'),
  Lesson('Can you repeat that?', 'ඒක නැවත කියන්න පුළුවන්ද?'),
  Lesson('What does this mean?', 'මේකේ තේරුම මොකක්ද?'),
  Lesson('I am learning English', 'මම ඉංග්‍රීසි ඉගෙන ගන්නවා'),
  Lesson('I like English', 'මම ඉංග්‍රීසිවලට කැමතියි'),
  Lesson('I am a student', 'මම ශිෂ්‍යයෙක්'),
  Lesson('I am a teacher', 'මම ගුරුවරයෙක්'),
  Lesson('I am happy', 'මම සතුටින්'),
  Lesson('I am tired', 'මට මහන්සියි'),
  Lesson('I am hungry', 'මට බඩගිනියි'),
  Lesson('I am thirsty', 'මට පිපාසයි'),
  Lesson('I need water', 'මට වතුර අවශ්‍යයි'),
  Lesson('Where is the bathroom?', 'නාන කාමරය කොහෙද?'),
  Lesson('How much is this?', 'මේක කීයද?'),
  Lesson('It is too expensive', 'මේක මිල වැඩියි'),
  Lesson('I want this', 'මට මේක ඕනෑ'),
  Lesson('I do not want that', 'මට ඒක එපා'),
  Lesson('Can I have this?', 'මට මේක ගන්න පුළුවන්ද?'),
  Lesson('Where is the bus stop?', 'බස් නැවතුම කොහෙද?'),
  Lesson('I need a taxi', 'මට ටැක්සියක් අවශ්‍යයි'),
  Lesson('Turn left', 'වමට හැරෙන්න'),
  Lesson('Turn right', 'දකුණට හැරෙන්න'),
  Lesson('Go straight', 'කෙළින්ම යන්න'),
  Lesson('Stop here', 'මෙතැන නවත්වන්න'),
  Lesson('I am going home', 'මම ගෙදර යනවා'),
  Lesson('I am going to school', 'මම පාසලට යනවා'),
  Lesson('What time is it?', 'දැන් වෙලාව කීයද?'),
  Lesson('It is eight o’clock', 'දැන් අටයි'),
  Lesson('Today is Monday', 'අද සඳුදා'),
  Lesson('Tomorrow is Tuesday', 'හෙට අඟහරුවාදා'),
  Lesson('I wake up early', 'මම උදෙන් අවදි වෙනවා'),
  Lesson('I brush my teeth', 'මම දත් මදිනවා'),
  Lesson('I take a shower', 'මම නානවා'),
  Lesson('I eat breakfast', 'මම උදේ ආහාරය ගන්නවා'),
  Lesson('I go to work', 'මම රැකියාවට යනවා'),
  Lesson('I come back home', 'මම නැවත ගෙදර එනවා'),
  Lesson('I read a book', 'මම පොතක් කියවනවා'),
  Lesson('I write a letter', 'මම ලිපියක් ලියනවා'),
  Lesson('I watch television', 'මම රූපවාහිනිය නරඹනවා'),
  Lesson('I listen to music', 'මම සංගීතයට සවන් දෙනවා'),
  Lesson('I play cricket', 'මම ක්‍රිකට් ක්‍රීඩා කරනවා'),
  Lesson('I love my family', 'මම මගේ පවුලට ආදරෙයි'),
  Lesson('This is my friend', 'මේ මගේ මිතුරා'),
  Lesson('She is my sister', 'ඇය මගේ සහෝදරිය'),
  Lesson('He is my brother', 'ඔහු මගේ සහෝදරයා'),
  Lesson('I have a car', 'මට කාර් එකක් තිබෙනවා'),
  Lesson('I have a bicycle', 'මට බයිසිකලයක් තිබෙනවා'),
  Lesson('The weather is nice', 'කාලගුණය හොඳයි'),
  Lesson('It is raining', 'වැස්ස වැටෙනවා'),
  Lesson('It is very hot', 'හරිම රස්නෙයි'),
  Lesson('It is very cold', 'හරිම සීතලයි'),
  Lesson('I feel better', 'මට දැන් හොඳයි'),
  Lesson('I need a doctor', 'මට වෛද්‍යවරයෙක් අවශ්‍යයි'),
  Lesson('Call the police', 'පොලිසියට කතා කරන්න'),
  Lesson('Call an ambulance', 'ගිලන් රථයක් අමතන්න'),
  Lesson('Be careful', 'පරිස්සම් වෙන්න'),
  Lesson('Do not worry', 'කලබල වෙන්න එපා'),
  Lesson('Everything is okay', 'හැම දෙයක්ම හොඳින්'),
  Lesson('I agree with you', 'මම ඔබ සමඟ එකඟයි'),
  Lesson('I disagree', 'මම එකඟ නැහැ'),
  Lesson('That is a good idea', 'ඒක හොඳ අදහසක්'),
  Lesson('I think so', 'මම එහෙම හිතනවා'),
  Lesson('I do not know', 'මම දන්නේ නැහැ'),
  Lesson('Maybe tomorrow', 'සමහරවිට හෙට'),
  Lesson('Of course', 'ඇත්තෙන්ම'),
  Lesson('No problem', 'ප්‍රශ්නයක් නැහැ'),
  Lesson('Wait a moment', 'මොහොතක් ඉන්න'),
  Lesson('Come with me', 'මා සමඟ එන්න'),
  Lesson('Follow me', 'මා පසුපස එන්න'),
  Lesson('Open the door', 'දොර අරින්න'),
  Lesson('Close the window', 'ජනේලය වහන්න'),
  Lesson('Please sit down', 'කරුණාකර වාඩි වෙන්න'),
  Lesson('Stand up', 'නැගිටින්න'),
  Lesson('Keep going', 'දිගටම කරගෙන යන්න'),
  Lesson('Never give up', 'කවදාවත් අත්හරින්න එපා'),
  Lesson('Practice every day', 'සෑම දිනකම පුහුණු වෙන්න'),
  Lesson('I can do it', 'මට ඒක කරන්න පුළුවන්'),
  Lesson('Believe in yourself', 'ඔබ ගැන විශ්වාස කරන්න'),
  Lesson('Learning is fun', 'ඉගෙනීම විනෝදජනකයි'),
  Lesson('English opens doors', 'ඉංග්‍රීසි අවස්ථා විවෘත කරනවා'),
  Lesson('Thank you very much', 'ඔබට බොහොම ස්තුතියි'),
];

class Word {
  final String english;
  final String sinhala;
  const Word(this.english, this.sinhala);
}

const words = <Word>[
  Word('Beautiful', 'ලස්සන'),
  Word('Amazing', 'පුදුමාකාර'),
  Word('Important', 'වැදගත්'),
  Word('Happy', 'සතුටු'),
  Word('Courage', 'ධෛර්යය'),
  Word('Knowledge', 'දැනුම'),
  Word('Success', 'සාර්ථකත්වය'),
  Word('Friendly', 'මිත්‍රශීලී'),
  Word('Honest', 'අවංක'),
  Word('Improve', 'දියුණු කරනවා'),
  Word('Understand', 'තේරුම් ගන්නවා'),
  Word('Remember', 'මතක තබා ගන්නවා'),
  Word('Believe', 'විශ්වාස කරනවා'),
  Word('Practice', 'පුහුණුව'),
  Word('Journey', 'ගමන'),
  Word('Wonderful', 'අපූරු'),
  Word('Careful', 'පරිස්සම්'),
  Word('Quickly', 'ඉක්මනින්'),
  Word('Always', 'සැමවිටම'),
  Word('Together', 'එකට'),
];

class HelaEnglishApp extends StatefulWidget {
  const HelaEnglishApp({super.key});

  @override
  State<HelaEnglishApp> createState() => _HelaEnglishAppState();
}

class _HelaEnglishAppState extends State<HelaEnglishApp> {
  int tab = 0;
  Set<int> completed = {};
  Set<String> savedWords = {};
  int bestScore = 0;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadProgress();
  }

  Future<void> loadProgress() async {
    final p = await SharedPreferences.getInstance();
    setState(() {
      completed = (p.getStringList('completed') ?? [])
          .map((e) => int.tryParse(e) ?? 0).toSet();
      savedWords = (p.getStringList('savedWords') ?? []).toSet();
      bestScore = p.getInt('bestScore') ?? 0;
      loading = false;
    });
  }

  Future<void> saveProgress() async {
    final p = await SharedPreferences.getInstance();
    await p.setStringList(
      'completed',
      completed.map((e) => e.toString()).toList(),
    );
    await p.setStringList('savedWords', savedWords.toList());
    await p.setInt('bestScore', bestScore);
  }

  void markComplete(int index) {
    setState(() => completed.add(index));
    saveProgress();
  }

  void toggleWord(String word) {
    setState(() {
      if (savedWords.contains(word)) {
        savedWords.remove(word);
      } else {
        savedWords.add(word);
      }
    });
    saveProgress();
  }

  void updateScore(int score) {
    if (score > bestScore) {
      setState(() => bestScore = score);
      saveProgress();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const MaterialApp(
        home: Scaffold(
          backgroundColor: bg,
          body: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    final pages = [
      HomeScreen(
        completed: completed.length,
        onOpen: (i) => setState(() => tab = i),
      ),
      LessonsScreen(
        completed: completed,
        onComplete: markComplete,
      ),
      QuizScreen(onScore: updateScore),
      const SpeakingScreen(),
      ProfileScreen(
        completed: completed.length,
        bestScore: bestScore,
        savedCount: savedWords.length,
      ),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HELA ENGLISH',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: bg,
        colorScheme: ColorScheme.fromSeed(
          seedColor: purple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: SafeArea(child: pages[tab]),
        bottomNavigationBar: NavigationBar(
          backgroundColor: const Color(0xFF151C38),
          indicatorColor: purple.withOpacity(0.3),
          selectedIndex: tab,
          onDestinationSelected: (i) => setState(() => tab = i),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.menu_book_rounded),
              label: 'Lessons',
            ),
            NavigationDestination(
              icon: Icon(Icons.quiz_rounded),
              label: 'Quiz',
            ),
            NavigationDestination(
              icon: Icon(Icons.mic_rounded),
              label: 'Speaking',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [purple, blue]),
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                color: purple.withOpacity(0.4),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const Icon(
            Icons.school_rounded,
            color: Colors.white,
            size: 33,
          ),
        ),
        const SizedBox(width: 13),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'HELA ENGLISH',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900),
            ),
            Text(
              'Learn English • Build Your Future',
              style: TextStyle(color: Colors.white54, fontSize: 10),
            ),
          ],
        ),
      ],
    );
  }
}

class HomeScreen extends StatelessWidget {
  final int completed;
  final ValueChanged<int> onOpen;

  const HomeScreen({
    super.key,
    required this.completed,
    required this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const AppHeader(),
        const SizedBox(height: 30),
        const Text(
          'ආයුබෝවන්! 👋',
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        ),
        const Text(
          'අදත් අලුත් දෙයක් ඉගෙන ගමු.',
          style: TextStyle(color: Colors.white60),
        ),
        const SizedBox(height: 23),
        Container(
          padding: const EdgeInsets.all(23),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [purple, blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: blue.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 9),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'YOUR ENGLISH JOURNEY',
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Learn English\nStep by Step!',
                style: TextStyle(fontSize: 29, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 12),
              const Text('සිංහලෙන් පහසුවෙන් ඉංග්‍රීසි ඉගෙන ගන්න.'),
              const SizedBox(height: 18),
              Text(
                '$completed / 100 Lessons Completed',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 9),
              LinearProgressIndicator(
                value: completed / 100,
                minHeight: 8,
                backgroundColor: Colors.white24,
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          'Explore Learning',
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 14),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 13,
          mainAxisSpacing: 13,
          childAspectRatio: 1.15,
          children: [
            FeatureCard(
              icon: Icons.menu_book_rounded,
              title: 'English Lessons',
              subtitle: 'පාඩම් 100ක්',
              color: blue,
              onTap: () => onOpen(1),
            ),
            FeatureCard(
              icon: Icons.auto_stories_rounded,
              title: 'Vocabulary',
              subtitle: 'අලුත් වචන ඉගෙන ගන්න',
              color: purple,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const VocabularyScreen(),
                  ),
                );
              },
            ),
            FeatureCard(
              icon: Icons.quiz_rounded,
              title: 'English Quiz',
              subtitle: 'ඔබේ දැනුම පරීක්ෂා කරන්න',
              color: Colors.orange,
              onTap: () => onOpen(2),
            ),
            FeatureCard(
              icon: Icons.mic_rounded,
              title: 'Speaking Practice',
              subtitle: 'කතා කිරීම පුහුණු වෙන්න',
              color: Colors.teal,
              onTap: () => onOpen(3),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Daily Motivation',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const GlassCard(
          child: Text(
            '"Never give up. Every day is a new chance to learn."',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.32),
              const Color(0xFF202846),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: color.withOpacity(0.4)),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.13),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 34),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.white60, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}

class GlassCard extends StatelessWidget {
  final Widget child;
  const GlassCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: Colors.white12),
      ),
      child: child,
    );
  }
}

class LessonsScreen extends StatelessWidget {
  final Set<int> completed;
  final ValueChanged<int> onComplete;

  const LessonsScreen({
    super.key,
    required this.completed,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const Text(
          'English Lessons',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const Text(
          'පාඩම් 100ක් • සිංහල තේරුම් සමඟ',
          style: TextStyle(color: Colors.white60),
        ),
        const SizedBox(height: 18),
        ...List.generate(lessons.length, (i) {
          final lesson = lessons[i];
          final done = completed.contains(i);
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GlassCard(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  backgroundColor: purple.withOpacity(0.25),
                  child: Text('${i + 1}'),
                ),
                title: Text(
                  lesson.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  lesson.meaning,
                  style: const TextStyle(color: Colors.white60),
                ),
                trailing: Icon(
                  done ? Icons.check_circle : Icons.arrow_forward_ios,
                  color: done ? Colors.greenAccent : Colors.white54,
                  size: 19,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LessonDetailScreen(
                        number: i + 1,
                        lesson: lesson,
                        isDone: done,
                        onComplete: () => onComplete(i),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }),
      ],
    );
  }
}

class LessonDetailScreen extends StatefulWidget {
  final int number;
  final Lesson lesson;
  final bool isDone;
  final VoidCallback onComplete;

  const LessonDetailScreen({
    super.key,
    required this.number,
    required this.le
