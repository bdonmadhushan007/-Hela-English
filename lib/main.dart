
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HelaEnglishApp());
}

const Color navy = Color(0xFF101746);
const Color blue = Color(0xFF315BFF);
const Color purple = Color(0xFF853BFF);
const Color backgroundColor = Color(0xFFF3F5FF);

class HelaEnglishApp extends StatelessWidget {
  const HelaEnglishApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HELA ENGLISH',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
        fontFamily: 'Roboto',
      ),
      home: const MainScreen(),
    );
  }
}

class Lesson {
  final String english;
  final String sinhala;

  const Lesson(this.english, this.sinhala);
}

const List<Lesson> lessons = [
  Lesson('Hello', 'ආයුබෝවන්'),
  Lesson('Good morning', 'සුබ උදෑසනක්'),
  Lesson('Good afternoon', 'සුබ දහවලක්'),
  Lesson('Good evening', 'සුබ සන්ධ්‍යාවක්'),
  Lesson('Good night', 'සුබ රාත්‍රියක්'),
  Lesson('How are you?', 'ඔබට කොහොමද?'),
  Lesson('I am fine', 'මම හොඳින්'),
  Lesson('Thank you', 'ස්තුතියි'),
  Lesson('You are welcome', 'ඔබව සාදරයෙන් පිළිගන්නවා'),
  Lesson('Excuse me', 'මට සමාවෙන්න'),
  Lesson('I am sorry', 'මට කණගාටුයි'),
  Lesson('What is your name?', 'ඔබේ නම කුමක්ද?'),
  Lesson('My name is John', 'මගේ නම ජෝන්'),
  Lesson('Where are you from?', 'ඔබ කොහෙන්ද?'),
  Lesson('I am from Sri Lanka', 'මම ශ්‍රී ලංකාවෙන්'),
  Lesson('Nice to meet you', 'ඔබව හමුවීම සතුටක්'),
  Lesson('See you again', 'නැවත හමුවෙමු'),
  Lesson('Goodbye', 'ගිහින් එන්නම්'),
  Lesson('Please help me', 'කරුණාකර මට උදව් කරන්න'),
  Lesson('I understand', 'මට තේරෙනවා'),
  Lesson('I do not understand', 'මට තේරෙන්නේ නැහැ'),
  Lesson('Please speak slowly', 'කරුණාකර සෙමින් කතා කරන්න'),
  Lesson('Can you repeat that?', 'ඔබට එය නැවත කියන්න පුළුවන්ද?'),
  Lesson('What time is it?', 'දැන් වෙලාව කීයද?'),
  Lesson('I am learning English', 'මම ඉංග්‍රීසි ඉගෙන ගන්නවා'),
  Lesson('I like English', 'මම ඉංග්‍රීසිවලට කැමතියි'),
  Lesson('Where do you live?', 'ඔබ ජීවත් වන්නේ කොහේද?'),
  Lesson('I live in Colombo', 'මම කොළඹ ජීවත් වෙනවා'),
  Lesson('How old are you?', 'ඔබේ වයස කීයද?'),
  Lesson('I am twenty years old', 'මට වයස අවුරුදු විස්සයි'),
  Lesson('What do you do?', 'ඔබ රැකියාව ලෙස කරන්නේ කුමක්ද?'),
  Lesson('I am a student', 'මම ශිෂ්‍යයෙක්'),
  Lesson('I am a teacher', 'මම ගුරුවරයෙක්'),
  Lesson('I am working', 'මම වැඩ කරමින් සිටිනවා'),
  Lesson('I am happy', 'මම සතුටින්'),
  Lesson('I am tired', 'මට මහන්සියි'),
  Lesson('I am hungry', 'මට බඩගිනියි'),
  Lesson('I am thirsty', 'මට පිපාසයි'),
  Lesson('I am busy', 'මම කාර්යබහුලයි'),
  Lesson('I am ready', 'මම සූදානම්'),
  Lesson('Come here', 'මෙහාට එන්න'),
  Lesson('Please sit down', 'කරුණාකර වාඩිවෙන්න'),
  Lesson('Please stand up', 'කරුණාකර නැගිටින්න'),
  Lesson('Open the door', 'දොර අරින්න'),
  Lesson('Close the window', 'ජනේලය වහන්න'),
  Lesson('Wait a moment', 'මොහොතක් ඉන්න'),
  Lesson('Let us go', 'අපි යමු'),
  Lesson('Follow me', 'මා පසුපස එන්න'),
  Lesson('Be careful', 'පරිස්සම් වෙන්න'),
  Lesson('Do not worry', 'කලබල වෙන්න එපා'),
  Lesson('What is this?', 'මේ මොකක්ද?'),
  Lesson('Where is the bus stop?', 'බස් නැවතුම කොහේද?'),
  Lesson('I need a taxi', 'මට ටැක්සියක් අවශ්‍යයි'),
  Lesson('How much is this?', 'මේක කීයද?'),
  Lesson('It is too expensive', 'මේක මිල වැඩියි'),
  Lesson('I want to buy this', 'මට මේක මිලදී ගන්න ඕනේ'),
  Lesson('Where is the toilet?', 'වැසිකිළිය කොහේද?'),
  Lesson('I need water', 'මට වතුර අවශ්‍යයි'),
  Lesson('Can I have the menu?', 'මට ආහාර ලැයිස්තුව ලබාගන්න පුළුවන්ද?'),
  Lesson('The food is delicious', 'කෑම රසයි'),
  Lesson('I would like some tea', 'මට තේ ටිකක් අවශ්‍යයි'),
  Lesson('I need a doctor', 'මට වෛද්‍යවරයෙක් අවශ්‍යයි'),
  Lesson('Call the police', 'පොලිසියට කතා කරන්න'),
  Lesson('Please call an ambulance', 'කරුණාකර ගිලන් රථයක් කැඳවන්න'),
  Lesson('I am not feeling well', 'මට සනීප නැහැ'),
  Lesson('I have a headache', 'මට හිසරදයක් තියෙනවා'),
  Lesson('Where is the hospital?', 'රෝහල කොහේද?'),
  Lesson('I love my family', 'මම මගේ පවුලට ආදරෙයි'),
  Lesson('This is my friend', 'මේ මගේ මිතුරා'),
  Lesson('I have two brothers', 'මට සහෝදරයන් දෙදෙනෙක් ඉන්නවා'),
  Lesson('My mother is kind', 'මගේ අම්මා කරුණාවන්තයි'),
  Lesson('My father is strong', 'මගේ තාත්තා ශක්තිමත්'),
  Lesson('Today is Monday', 'අද සඳුදා'),
  Lesson('Tomorrow is Tuesday', 'හෙට අඟහරුවාදා'),
  Lesson('Yesterday was Sunday', 'ඊයේ ඉරිදා'),
  Lesson('What is the date today?', 'අද දිනය කුමක්ද?'),
  Lesson('I wake up early', 'මම උදෑසනින් අවදි වෙනවා'),
  Lesson('I brush my teeth', 'මම දත් මදිනවා'),
  Lesson('I take a shower', 'මම නානවා'),
  Lesson('I eat breakfast', 'මම උදෑසන ආහාර ගන්නවා'),
  Lesson('I go to school', 'මම පාසලට යනවා'),
  Lesson('I go to work', 'මම රැකියාවට යනවා'),
  Lesson('I read a book', 'මම පොතක් කියවනවා'),
  Lesson('I watch television', 'මම රූපවාහිනිය බලනවා'),
  Lesson('I listen to music', 'මම සංගීතයට සවන් දෙනවා'),
  Lesson('I play cricket', 'මම ක්‍රිකට් ක්‍රීඩා කරනවා'),
  Lesson('I can speak English', 'මට ඉංග්‍රීසි කතා කරන්න පුළුවන්'),
  Lesson('I want to improve', 'මට දියුණු වෙන්න ඕනේ'),
  Lesson('Practice makes perfect', 'පුහුණුවෙන් දක්ෂතාව ලැබේ'),
  Lesson('Never give up', 'කවදාවත් උත්සාහය අත්හරින්න එපා'),
  Lesson('Believe in yourself', 'ඔබ ගැන විශ්වාස කරන්න'),
  Lesson('Every day is a new beginning', 'සෑම දවසක්ම අලුත් ආරම්භයක්'),
  Lesson('I will try again', 'මම නැවත උත්සාහ කරනවා'),
  Lesson('I can do it', 'මට ඒක කරන්න පුළුවන්'),
  Lesson('Thank you for your help', 'ඔබේ උදව්වට ස්තුතියි'),
  Lesson('Have a nice day', 'සුබ දවසක් වේවා'),
  Lesson('See you tomorrow', 'හෙට හමුවෙමු'),
  Lesson('I am proud of myself', 'මම මා ගැන ආඩම්බර වෙනවා'),
  Lesson('Learning is fun', 'ඉගෙනීම විනෝදජනකයි'),
  Lesson('English opens new doors', 'ඉංග්‍රීසි නව අවස්ථා විවෘත කරනවා'),
];

const List<List<String>> vocabulary = [
  ['Beautiful', 'ලස්සන'],
  ['Amazing', 'පුදුමාකාර'],
  ['Courage', 'ධෛර්යය'],
  ['Friend', 'මිතුරා'],
  ['Family', 'පවුල'],
  ['Knowledge', 'දැනුම'],
  ['Improve', 'දියුණු කරනවා'],
  ['Success', 'සාර්ථකත්වය'],
  ['Believe', 'විශ්වාස කරනවා'],
  ['Important', 'වැදගත්'],
  ['Wonderful', 'අපූරු'],
  ['Adventure', 'ත්‍රාසජනක අත්දැකීම'],
  ['Honest', 'අවංක'],
  ['Kindness', 'කරුණාව'],
  ['Opportunity', 'අවස්ථාව'],
  ['Confident', 'ආත්ම විශ්වාසයෙන් යුතු'],
  ['Remember', 'මතක තබාගන්නවා'],
  ['Challenge', 'අභියෝගය'],
  ['Dream', 'සිහිනය'],
  ['Future', 'අනාගතය'],
];

const List<List<dynamic>> quizQuestions = [
  ['What is the meaning of "Apple"?', 'ඇපල්', 'පොත', 'ගස', 'ගෙදර', 0],
  ['What is the opposite of "Hot"?', 'Warm', 'Cold', 'Big', 'Fast', 1],
  ['How do you say "ස්තුතියි" in English?', 'Sorry', 'Please', 'Thank you', 'Hello', 2],
  ['What is the plural of "Book"?', 'Bookes', 'Books', 'Bookies', 'Book', 1],
  ['Choose the correct sentence.', 'I am happy.', 'I happy am.', 'Happy I am?', 'I be happy.', 0],
  ['What is the meaning of "Beautiful"?', 'කෝපය', 'ලස්සන', 'දුක', 'බය', 1],
  ['What is the past tense of "Go"?', 'Goed', 'Going', 'Went', 'Goes', 2],
  ['How do you say "සුබ උදෑසනක්"?', 'Good night', 'Good morning', 'Goodbye', 'Good evening', 1],
  ['Choose the correct article: ___ apple', 'A', 'An', 'Thee', 'No article', 1],
  ['What is the opposite of "Happy"?', 'Sad', 'Glad', 'Joyful', 'Excited', 0],
];

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedTab = 0;
  int completedLessons = 0;
  int bestScore = 0;
  Set<String> savedWords = {};

  @override
  void initState() {
    super.initState();
    loadProgress();
  }

  Future<void> loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      completedLessons = prefs.getInt('completedLessons') ?? 0;
      bestScore = prefs.getInt('bestScore') ?? 0;
      savedWords = (prefs.getStringList('savedWords') ?? []).toSet();
    });
  }

  Future<void> saveProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('completedLessons', completedLessons);
    await prefs.setInt('bestScore', bestScore);
    await prefs.setStringList('savedWords', savedWords.toList());
  }

  void markLessonComplete() {
    if (completedLessons < lessons.length) {
      setState(() => completedLessons++);
      saveProgress();
    }
  }

  void updateScore(int score) {
    if (score > bestScore) {
      setState(() => bestScore = score);
      saveProgress();
    }
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

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(
        completed: completedLessons,
        savedCount: savedWords.length,
        bestScore: bestScore,
        onNavigate: (index) => setState(() => selectedTab = index),
      ),
      LessonsPage(onComplete: markLessonComplete),
      VocabularyPage(savedWords: savedWords, onToggle: toggleWord),
      QuizPage(onScore: updateScore),
      const SpeakingPage(),
      ProfilePage(
        completed: completedLessons,
        bestScore: bestScore,
        savedCount: savedWords.length,
      ),
    ];

    return Scaffold(
      body: IndexedStack(
        index: selectedTab,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedTab,
        onDestinationSelected: (index) {
          setState(() => selectedTab = index);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_rounded), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.menu_book_rounded), label: 'Lessons'),
          NavigationDestination(icon: Icon(Icons.translate_rounded), label: 'Words'),
          NavigationDestination(icon: Icon(Icons.quiz_rounded), label: 'Quiz'),
          NavigationDestination(icon: Icon(Icons.mic_rounded), label: 'Speaking'),
          NavigationDestination(icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const PageHeader(this.title, this.subtitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 55, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 27, fontWeight: FontWeight.w900, color: navy)),
          const SizedBox(height: 5),
          Text(subtitle, style: TextStyle(color: Colors.grey.shade600, fontSize: 14)),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final int completed;
  final int savedCount;
  final int bestScore;
  final ValueChanged<int> onNavigate;

  const HomePage({
    super.key,
    required this.completed,
    required this.savedCount,
    required this.bestScore,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [blue, purple]),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: const Icon(Icons.school_rounded, color: Colors.white, size: 30),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('HELA ENGLISH', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: navy)),
                    Text('Learn • Practice • Speak', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              const Icon(Icons.notifications_none_rounded, size: 28),
            ],
          ),
          const SizedBox(height: 25),
          Container(
            padding: const EdgeInsets.all(23),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF254CFF), Color(0xFF873CFF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(color: blue.withOpacity(0.25), blurRadius: 18, offset: const Offset(0, 9)),
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('WELCOME TO', style: TextStyle(color: Colors.white70, letterSpacing: 2, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Your English\nLearning Journey!', style: TextStyle(color: Colors.white, fontSize: 27, height: 1.2, fontWeight: FontWeight.w900)),
                SizedBox(height: 12),
                Text('Learn English step by step with Sinhala support.', style: TextStyle(color: Colors.white, fontSize: 14)),
                SizedBox(height: 18),
                Icon(Icons.auto_stories_rounded, color: Colors.white, size: 43),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: StatCard('Lessons', '$completed/${lessons.length}', Icons.menu_book_rounded, Colors.blue)),
              const SizedBox(width: 10),
              Expanded(child: StatCard('Best Quiz', '$bestScore/10', Icons.emoji_events_rounded, Colors.orange)),
              const SizedBox(width: 10),
              Expanded(child: StatCard('Saved', '$savedCount', Icons.bookmark_rounded, Colors.green)),
            ],
          ),
          const SizedBox(height: 25),
          const Text('Start Learning', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900, color: navy)),
          const SizedBox(height: 12),
          FeatureTile('English Lessons', 'Learn useful English sentences', Icons.menu_book_rounded, Colors.blue, () => onNavigate(1)),
          FeatureTile('Vocabulary', 'Build your English word power', Icons.translate_rounded, Colors.green, () => onNavigate(2)),
          FeatureTile('English Quiz', 'Test your knowledge', Icons.quiz_rounded, Colors.deepPurple, () => onNavigate(3)),
          FeatureTile('Speaking Practice', 'Listen and practise speaking', Icons.mic_rounded, Colors.deepOrange, () => onNavigate(4)),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const StatCard(this.title, this.value, this.icon, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 7),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(17)),
      child: Column(
        children: [
          Icon(icon, color: color, size: 25),
          const SizedBox(height: 7),
          Text(value, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900)),
          Text(title, style: const TextStyle(fontSize: 11, color: Colors.grey)),
        ],
      ),
    );
  }
}

class FeatureTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const FeatureTile(this.title, this.subtitle, this.icon, this.color, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 11),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: color.withOpacity(0.12),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 17),
        onTap: onTap,
      ),
    );
  }
}

class LessonsPage extends StatelessWidget {
  final VoidCallback onComplete;

  const LessonsPage({super.key, required this.onComplete});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PageHeader('English Lessons', 'Learn 100 useful English sentences'),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              final lesson = lessons[index];
              return Card(
                color: Colors.white,
                margin: const EdgeInsets.only(bottom: 9),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: blue.withOpacity(0.12),
                    child: Text('${index + 1}', style: const TextStyle(color: blue, fontWeight: FontWeight.bold)),
                  ),
                  title: Text(lesson.english, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(lesson.sinhala),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LessonDetailPage(
                          number: index + 1,
                          lesson: lesson,
                          onComplete: onComplete,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class LessonDetailPage extends StatefulWidget {
  final int number;
  final Lesson lesson;
  final VoidCallback onComplete;

  const LessonDetailPage({
    super.key,
    required this.number,
    required this.lesson,
    required this.onComplete,
  });

  @override
  State<LessonDetailPage> createState() => _LessonDetailPageState();
}

class _LessonDetailPageState extends State<LessonDetailPage> {
  final FlutterTts tts = FlutterTts();

  Future<void> speak() async {
    await tts.setLanguage('en-US');
    await tts.setSpeechRate(0.42);
    await tts.speak(widget.lesson.english);
  }

  @override
  void dispose() {
    tts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lesson ${widget.number}')),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.menu_book_rounded, size: 75, color: blue),
            const SizedBox(height: 25),
            Text(widget.lesson.english, textAlign: TextAlign.center, style: const TextStyle(fontSize: 29, fontWeight: FontWeight.w900, color: navy)),
            const SizedBox(height: 15),
       
