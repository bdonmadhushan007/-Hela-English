
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HelaEnglishApp());
}

class HelaEnglishApp extends StatelessWidget {
  const HelaEnglishApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HELA ENGLISH',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF10152D),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6757FF),
          brightness: Brightness.dark,
        ),
        fontFamily: 'Roboto',
      ),
      home: const MainScreen(),
    );
  }
}

class Lesson {
  final String title;
  final String english;
  final String sinhala;

  const Lesson(this.title, this.english, this.sinhala);
}

const List<Lesson> lessons = [
  Lesson('Greetings', 'Hello. How are you?', 'ආයුබෝවන්. ඔබට කොහොමද?'),
  Lesson('Greetings', 'Good morning.', 'සුබ උදෑසනක්.'),
  Lesson('Greetings', 'Good afternoon.', 'සුබ දහවලක්.'),
  Lesson('Greetings', 'Good evening.', 'සුබ සන්ධ්‍යාවක්.'),
  Lesson('Greetings', 'Good night.', 'සුබ රාත්‍රියක්.'),
  Lesson('Greetings', 'Nice to meet you.', 'ඔබ හමුවීම සතුටක්.'),
  Lesson('Greetings', 'How are you doing?', 'ඔබට කොහොමද?'),
  Lesson('Greetings', 'I am fine, thank you.', 'මම හොඳින්, ස්තූතියි.'),
  Lesson('Greetings', 'See you again.', 'නැවත හමුවෙමු.'),
  Lesson('Greetings', 'Have a nice day.', 'සුබ දවසක් වේවා.'),

  Lesson('Introduction', 'My name is John.', 'මගේ නම ජෝන්.'),
  Lesson('Introduction', 'I am from Sri Lanka.', 'මම ශ්‍රී ලංකාවෙන්.'),
  Lesson('Introduction', 'I live in Colombo.', 'මම කොළඹ ජීවත් වෙනවා.'),
  Lesson('Introduction', 'I am a student.', 'මම ශිෂ්‍යයෙක්.'),
  Lesson('Introduction', 'I am learning English.', 'මම ඉංග්‍රීසි ඉගෙන ගන්නවා.'),
  Lesson('Introduction', 'What is your name?', 'ඔබේ නම කුමක්ද?'),
  Lesson('Introduction', 'Where are you from?', 'ඔබ කොහෙන්ද?'),
  Lesson('Introduction', 'How old are you?', 'ඔබගේ වයස කීයද?'),
  Lesson('Introduction', 'I am twenty years old.', 'මට වයස අවුරුදු විස්සයි.'),
  Lesson('Introduction', 'This is my friend.', 'මේ මගේ මිතුරා.'),

  Lesson('Daily Life', 'I wake up early.', 'මම උදේම අවදි වෙනවා.'),
  Lesson('Daily Life', 'I brush my teeth.', 'මම දත් මදිනවා.'),
  Lesson('Daily Life', 'I take a shower.', 'මම නානවා.'),
  Lesson('Daily Life', 'I eat breakfast.', 'මම උදෑසන ආහාරය ගන්නවා.'),
  Lesson('Daily Life', 'I go to work.', 'මම රැකියාවට යනවා.'),
  Lesson('Daily Life', 'I come home.', 'මම ගෙදර එනවා.'),
  Lesson('Daily Life', 'I watch television.', 'මම රූපවාහිනිය බලනවා.'),
  Lesson('Daily Life', 'I read a book.', 'මම පොතක් කියවනවා.'),
  Lesson('Daily Life', 'I go to bed.', 'මම නිදාගන්න යනවා.'),
  Lesson('Daily Life', 'I am very busy today.', 'අද මට ගොඩක් වැඩ තියෙනවා.'),

  Lesson('Questions', 'What are you doing?', 'ඔබ මොකද කරන්නේ?'),
  Lesson('Questions', 'Where are you going?', 'ඔබ කොහෙද යන්නේ?'),
  Lesson('Questions', 'What happened?', 'මොකද වුණේ?'),
  Lesson('Questions', 'What do you want?', 'ඔබට මොනවාද අවශ්‍ය?'),
  Lesson('Questions', 'Can you help me?', 'ඔබට මට උදව් කරන්න පුළුවන්ද?'),
  Lesson('Questions', 'Do you understand?', 'ඔබට තේරෙනවාද?'),
  Lesson('Questions', 'What time is it?', 'දැන් වෙලාව කීයද?'),
  Lesson('Questions', 'Where is the bus stop?', 'බස් නැවතුම කොහෙද?'),
  Lesson('Questions', 'How much is this?', 'මේක කීයද?'),
  Lesson('Questions', 'Why are you late?', 'ඔබ පරක්කු ඇයි?'),

  Lesson('Travel', 'I want to travel.', 'මට සංචාරය කරන්න ඕනෑ.'),
  Lesson('Travel', 'Where is the airport?', 'ගුවන් තොටුපළ කොහෙද?'),
  Lesson('Travel', 'I need a taxi.', 'මට ටැක්සියක් අවශ්‍යයි.'),
  Lesson('Travel', 'Please stop here.', 'කරුණාකර මෙතැන නවත්වන්න.'),
  Lesson('Travel', 'I have a ticket.', 'මට ටිකට් පතක් තිබෙනවා.'),
  Lesson('Travel', 'Where is my hotel?', 'මගේ හෝටලය කොහෙද?'),
  Lesson('Travel', 'I am lost.', 'මට පාර වැරදිලා.'),
  Lesson('Travel', 'Turn left.', 'වමට හැරෙන්න.'),
  Lesson('Travel', 'Turn right.', 'දකුණට හැරෙන්න.'),
  Lesson('Travel', 'Go straight ahead.', 'කෙළින්ම ඉදිරියට යන්න.'),

  Lesson('Shopping', 'I want to buy this.', 'මට මේක මිලදී ගන්න ඕනෑ.'),
  Lesson('Shopping', 'How much does it cost?', 'මේකේ මිල කීයද?'),
  Lesson('Shopping', 'It is too expensive.', 'මේක ගොඩක් මිල වැඩියි.'),
  Lesson('Shopping', 'Do you have another one?', 'ඔබ ළඟ වෙනත් එකක් තිබෙනවාද?'),
  Lesson('Shopping', 'I like this colour.', 'මම මේ පාටට කැමතියි.'),
  Lesson('Shopping', 'Can I pay by card?', 'මට කාඩ්පතෙන් ගෙවන්න පුළුවන්ද?'),
  Lesson('Shopping', 'Please give me a bag.', 'කරුණාකර මට බෑගයක් දෙන්න.'),
  Lesson('Shopping', 'I am just looking.', 'මම නිකම් බලනවා.'),
  Lesson('Shopping', 'That is enough.', 'ඒ ඇති.'),
  Lesson('Shopping', 'Thank you for your help.', 'ඔබගේ උදව්වට ස්තූතියි.'),

  Lesson('Food', 'I am hungry.', 'මට බඩගිනියි.'),
  Lesson('Food', 'I am thirsty.', 'මට පිපාසයි.'),
  Lesson('Food', 'The food is delicious.', 'කෑම රසවත්.'),
  Lesson('Food', 'I would like some water.', 'මට වතුර ටිකක් ඕනෑ.'),
  Lesson('Food', 'Can I see the menu?', 'මට කෑම ලැයිස්තුව බලන්න පුළුවන්ද?'),
  Lesson('Food', 'I want a cup of tea.', 'මට තේ කෝප්පයක් ඕනෑ.'),
  Lesson('Food', 'No sugar, please.', 'කරුණාකර සීනි එපා.'),
  Lesson('Food', 'The bill, please.', 'කරුණාකර බිල දෙන්න.'),
  Lesson('Food', 'I like rice and curry.', 'මම බත් සහ ව්‍යංජන වලට කැමතියි.'),
  Lesson('Food', 'Enjoy your meal.', 'ඔබගේ ආහාරය රසවිඳින්න.'),

  Lesson('Work', 'I am looking for a job.', 'මම රැකියාවක් සොයනවා.'),
  Lesson('Work', 'I work every day.', 'මම සෑම දිනකම වැඩ කරනවා.'),
  Lesson('Work', 'I have a meeting.', 'මට රැස්වීමක් තිබෙනවා.'),
  Lesson('Work', 'I will call you later.', 'මම පසුව ඔබට කතා කරන්නම්.'),
  Lesson('Work', 'Please send me an email.', 'කරුණාකර මට ඊමේල් එකක් එවන්න.'),
  Lesson('Work', 'I need more time.', 'මට තවත් කාලය අවශ්‍යයි.'),
  Lesson('Work', 'I agree with you.', 'මම ඔබ සමඟ එකඟයි.'),
  Lesson('Work', 'I do not understand.', 'මට තේරෙන්නේ නැහැ.'),
  Lesson('Work', 'Let us start now.', 'අපි දැන් පටන් ගමු.'),
  Lesson('Work', 'Well done!', 'හොඳින් කළා!'),

  Lesson('Feelings', 'I am happy.', 'මම සතුටින් ඉන්නේ.'),
  Lesson('Feelings', 'I am sad.', 'මට දුකයි.'),
  Lesson('Feelings', 'I am tired.', 'මට මහන්සියි.'),
  Lesson('Feelings', 'I am excited.', 'මට හරිම උද්යෝගයක් දැනෙනවා.'),
  Lesson('Feelings', 'Do not worry.', 'කනගාටු වෙන්න එපා.'),
  Lesson('Feelings', 'I am afraid.', 'මට බයයි.'),
  Lesson('Feelings', 'I feel better now.', 'දැන් මට සනීපයි.'),
  Lesson('Feelings', 'I miss you.', 'මට ඔබ නැතුව පාළුයි.'),
  Lesson('Feelings', 'I love my family.', 'මම මගේ පවුලට ආදරෙයි.'),
  Lesson('Feelings', 'Everything will be fine.', 'හැම දෙයක්ම හොඳින් සිදුවේවි.'),

  Lesson('Useful English', 'Please speak slowly.', 'කරුණාකර හෙමින් කතා කරන්න.'),
  Lesson('Useful English', 'Could you repeat that?', 'ඔබට ඒක නැවත කියන්න පුළුවන්ද?'),
  Lesson('Useful English', 'I am sorry.', 'මට සමාවෙන්න.'),
  Lesson('Useful English', 'Excuse me.', 'සමාවෙන්න.'),
  Lesson('Useful English', 'You are welcome.', 'ඔබව සාදරයෙන් පිළිගන්නවා.'),
  Lesson('Useful English', 'No problem.', 'ගැටලුවක් නැහැ.'),
  Lesson('Useful English', 'I do not know.', 'මම දන්නේ නැහැ.'),
  Lesson('Useful English', 'That sounds great.', 'ඒක නියමයි වගේ.'),
  Lesson('Useful English', 'See you tomorrow.', 'හෙට හමුවෙමු.'),
  Lesson('Useful English', 'Have a good day.', 'සුබ දවසක් වේවා.'),
];

class Vocabulary {
  final String word;
  final String meaning;
  final String example;

  const Vocabulary(this.word, this.meaning, this.example);
}

const List<Vocabulary> vocabulary = [
  Vocabulary('Beautiful', 'ලස්සන', 'This flower is beautiful.'),
  Vocabulary('Important', 'වැදගත්', 'English is important.'),
  Vocabulary('Beautifully', 'ලස්සනට', 'She sings beautifully.'),
  Vocabulary('Believe', 'විශ්වාස කරනවා', 'Believe in yourself.'),
  Vocabulary('Brave', 'නිර්භීත', 'Be brave.'),
  Vocabulary('Careful', 'ප්‍රවේශම් සහගත', 'Be careful.'),
  Vocabulary('Change', 'වෙනස් කරනවා', 'Change your life.'),
  Vocabulary('Choose', 'තෝරාගන්නවා', 'Choose one.'),
  Vocabulary('Clever', 'දක්ෂ', 'He is clever.'),
  Vocabulary('Comfortable', 'සුවපහසු', 'This chair is comfortable.'),
  Vocabulary('Confident', 'ආත්ම විශ්වාසයෙන් යුතු', 'Be confident.'),
  Vocabulary('Dangerous', 'අනතුරුදායක', 'This road is dangerous.'),
  Vocabulary('Decide', 'තීරණය කරනවා', 'Decide now.'),
  Vocabulary('Different', 'වෙනස්', 'We are different.'),
  Vocabulary('Difficult', 'අමාරු', 'This lesson is difficult.'),
  Vocabulary('Easy', 'පහසු', 'English can be easy.'),
  Vocabulary('Education', 'අධ්‍යාපනය', 'Education is important.'),
  Vocabulary('Enjoy', 'විනෝද වෙනවා', 'Enjoy your life.'),
  Vocabulary('Excellent', 'විශිෂ්ටයි', 'Excellent work!'),
  Vocabulary('Experience', 'අත්දැකීම', 'It is a good experience.'),
  Vocabulary('Famous', 'ප්‍රසිද්ධ', 'He is famous.'),
  Vocabulary('Friendly', 'මිත්‍රශීලී', 'She is friendly.'),
  Vocabulary('Future', 'අනාගතය', 'Think about your future.'),
  Vocabulary('Generous', 'ත්‍යාගශීලී', 'He is generous.'),
  Vocabulary('Happy', 'සතුටු', 'I am happy.'),
  Vocabulary('Healthy', 'සෞඛ්‍ය සම්පන්න', 'Eat healthy food.'),
  Vocabulary('Honest', 'අවංක', 'Be honest.'),
  Vocabulary('Improve', 'දියුණු කරනවා', 'Improve your English.'),
  Vocabulary('Knowledge', 'දැනුම', 'Knowledge is power.'),
  Vocabulary('Language', 'භාෂාව', 'English is a language.'),
];

class QuizQuestion {
  final String question;
  final List<String> options;
  final int answer;

  const QuizQuestion(this.question, this.options, this.answer);
}

const List<QuizQuestion> quizQuestions = [
  QuizQuestion('What is the meaning of "Apple"?',
      ['අඹ', 'ඇපල්', 'කෙසෙල්', 'දොඩම්'], 1),
  QuizQuestion('Choose the correct greeting.',
      ['Good morning', 'Good night yesterday', 'I hungry', 'Go school'], 0),
  QuizQuestion('What is "Water" in Sinhala?',
      ['කිරි', 'තේ', 'වතුර', 'කෑම'], 2),
  QuizQuestion('Choose the correct sentence.',
      ['I am happy.', 'I happy am.', 'Happy I am?', 'Am happy I.'], 0),
  QuizQuestion('What is the opposite of "Big"?',
      ['Tall', 'Small', 'Long', 'Wide'], 1),
  QuizQuestion('What is the meaning of "Thank you"?',
      ['සමාවෙන්න', 'ආයුබෝවන්', 'ස්තූතියි', 'සුබ රාත්‍රියක්'], 2),
  QuizQuestion('Complete: I ___ a student.',
      ['is', 'are', 'am', 'be'], 2),
  QuizQuestion('What is "Book" in Sinhala?',
      ['පෑන', 'පොත', 'මේසය', 'පුටුව'], 1),
  QuizQuestion('Choose the correct word.',
      ['Beautifull', 'Beutiful', 'Beautiful', 'Beautifal'], 2),
  QuizQuestion('What is the opposite of "Hot"?',
      ['Cold', 'Warm', 'Big', 'Fast'], 0),
];

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  Set<int> completedLessons = {};
  int bestScore = 0;
  Set<String> savedWords = {};

  final FlutterTts tts = FlutterTts();
  final SpeechToText speech = SpeechToText();

  bool speechAvailable = false;
  bool isListening = false;
  String recognizedText = '';
  String speechStatus = 'Start speaking in English';

  @override
  void initState() {
    super.initState();
    loadProgress();
    setupTts();
  }

  Future<void> setupTts() async {
    await tts.setLanguage('en-US');
    await tts.setSpeechRate(0.45);
    await tts.setPitch(1.0);
  }

  Future<void> loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;

    setState(() {
      completedLessons = (prefs.getStringList('completedLessons') ?? [])
          .map((e) => int.tryParse(e) ?? -1)
          .where((e) => e >= 0)
          .toSet();

      bestScore = prefs.getInt('bestScore') ?? 0;
      savedWords = (prefs.getStringList('savedWords') ?? []).toSet();
    });
  }

  Future<void> saveProgress() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setStringList(
      'completedLessons',
      completedLessons.map((e) => e.toString()).toList(),
    );

    await prefs.setInt('bestScore', bestScore);

    await prefs.setStringList('savedWords', savedWords.toList());
  }

  Future<void> speak(String text) async {
    try {
      await tts.stop();
      await tts.speak(text);
    } catch (_) {
      showMessage('Voice playback is not available.');
    }
  }

  Future<void> startListening() async {
    try {
      if (!speechAvailable) {
        speechAvailable = await speech.initialize(
          onStatus: (status) {
            if (!mounted) return;
            if (status == 'done' || status == 'notListening') {
              setState(() => isListening = false);
            }
          },
          onError: (error) {
            if (!mounted) return;
            setState(() {
              isListening = false;
              speechStatus = 'Speech recognition error: ${error.errorMsg}';
            });
          },
        );
      }

      if (!speechAvailable) {
        showMessage('Speech recognition is not available on this device.');
        return;
      }

      setState(() {
        recognizedText = '';
        isListening = true;
        speechStatus = 'Listening... Speak now';
      });

      await speech.listen(
        onResult: (result) {
          if (!mounted) return;
          setState(() {
            recognizedText = result.recognizedWords;
            if (result.finalResult) {
              speechStatus = 'Speech completed';
            }
          });
        },
        localeId: 'en_US',
      );
    } catch (e) {
      if (!mounted) return;
      setState(() {
        isListening = false;
        speechStatus = 'Unable to start microphone.';
      });
    }
  }

  Future<void> stopListening() async {
    await speech.stop();
    if (!mounted) return;

    setState(() {
      isListening = false;
      speechStatus = 'Stopped';
    });
  }

  void showMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void markLessonCompleted(int index) {
    setState(() {
      completedLessons.add(index);
    });
    saveProgress();
    showMessage('Lesson completed!');
  }

  void toggleSavedWord(String word) {
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
  void dispose() {
    tts.stop();
    speech.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      homePage(),
      lessonsPage(),
      vocabularyPage(),
      quizPage(),
      speakingPage(),
      profilePage(),
    ];

    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: pages,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        height: 68,
        selectedIndex: selectedIndex,
        backgroundColor: const Color(0xFF191F3D),
        indicatorColor: const Color(0xFF6257E8),
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book),
            label: 'Lessons',
          ),
          NavigationDestination(
            icon: Icon(Icons.translate),
            label: 'Words',
          ),
          NavigationDestination(
            icon: Icon(Icons.quiz_outlined),
            label: 'Quiz',
          ),
          NavigationDestination(
            icon: Icon(Icons.mic_none),
            selectedIcon: Icon(Icons.mic),
            label: 'Speaking',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget pageTitle(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: TextStyle(color: Colors.white.withValues(alpha: 0.65)),
          ),
        ],
      ),
    );
  }

  Widget gradientCard({
    required Widget child,
    EdgeInsets padding = const EdgeInsets.all(18),
  }) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF5147C9), Color(0xFF252F65)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF5147C9).withValues(alpha: 0.20),
            blurRadius: 15,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget homePage() {
    final percent = lessons.isEmpty
        ? 0.0
        : completedLessons.length / lessons.length;

    return ListView(
      padding: const EdgeInsets.only(bottom: 20),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
          child: Row(
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8A6CFF), Color(0xFF35B9F2)],
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(Icons.school, size: 34),
              ),
              const SizedBox(width: 13),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'HELA ENGLISH',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    Text(
                      'Learn English with Sinhala',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: gradientCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome to HELA ENGLISH!',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'ඔබේ ඉංග්‍රීසි දැනුම අදම දියුණු කරගන්න.',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 18),
                FilledButton.icon(
                  onPressed: () => setState(() => selectedIndex = 1),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Start Learning'),
