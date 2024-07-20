import 'package:testapp/views/general_views.dart/matching_word_view.dart';
import 'package:testapp/views/general_views.dart/dialogue_view.dart';
import 'package:testapp/views/general_views.dart/mcquestions_view.dart';

MatchingGame matchingGameBP = MatchingGame(
  wordSound: {
    '爸': 'sound/baa4.mp3',
    '爬': 'sound/paa4.mp3',
    '怕': 'sound/paa3.mp3',
    '白': 'sound/baak6.mp3',
    '婆': 'sound/po4.mp3',
    '布': 'sound/bou3.mp3',
  },
  words: {
    '爸': 'B',
    '爬': 'P',
    '怕': 'P',
    '白': 'B',
    '婆': 'P',
    '布': 'B',
  },
  matched: {
    '爸': false,
    '爬': false,
    '怕': false,
    '白': false,
    '婆': false,
    '布': false,
  },
  letters: ['B', 'P'],
  route: '/module1-3',
);

MatchingGame matchingGameDT = MatchingGame(
  wordSound: {
    '得': 'sound/dak1.mp3',
    '他': 'sound/taa1.mp3',
    '聽': 'sound/teng1.mp3',
    '地': 'sound/dei6.mp3',
    '道': 'sound/dou6.mp3',
    '土': 'sound/tou2.mp3',
  },
  words: {
    '得': 'D',
    '他': 'T',
    '聽': 'T',
    '地': 'D',
    '道': 'D',
    '土': 'T',
  },
  matched: {
    '得': false,
    '他': false,
    '聽': false,
    '地': false,
    '道': false,
    '土': false,
  },
  letters: ['D', 'T'],
  route: '/module1-4',
);

MatchingGame matchingGameGK = MatchingGame(
  wordSound: {
    '家': 'sound/gaa1.mp3',
    '期': 'sound/kei4.mp3',
    '古': 'sound/gu2.mp3',
    '假': 'sound/gaa2.mp3',
    '琴': 'sound/kam4.mp3',
    '球': 'sound/kau4.mp3',
  },
  words: {
    '家': 'G',
    '期': 'K',
    '古': 'G',
    '假': 'G',
    '琴': 'K',
    '球': 'K',
  },
  matched: {
    '家': false,
    '期': false,
    '古': false,
    '假': false,
    '琴': false,
    '球': false,
  },
  letters: ['G', 'K'],
  route: '/module1-5',
);

FillInTheBlanks dialogue1 = FillInTheBlanks(
  text1: '你今日食咗啲乜嘢？',
  text2: '我今日食咗蘋果',
  draggables: ['b', 'p', 'd', 't', 'g', 'k'],
  text3: '蘋果',
  text4: 'ing',
  correctAnswer: ['p', 'g'],
  text5: 'wo',
  imageAddress: 'assets/images/apple.webp',
  route: '/module1-6',
);

FillInTheBlanks dialogue2 = FillInTheBlanks(
  text1: '香港有乜嘢特色小食呀？',
  text2: '蛋撻係香港特色小食',
  draggables: ['b', 'p', 'd', 't', 'g', 'k'],
  text3: '蛋撻',
  text4: 'aan',
  correctAnswer: ['d', 't'],
  text5: 'aat',
  imageAddress: 'assets/images/eggtart.webp',
  route: '/module1-7',
);

FillInTheBlanks dialogue3 = FillInTheBlanks(
  text1: '你最鍾意邊個歌手？',
  text2: '我最鍾意陳百強，佢唱歌好好聽㗎',
  draggables: ['b', 'p', 'd', 't', 'g', 'k'],
  text3: '百強',
  text4: 'aak',
  correctAnswer: ['b', 'k'],
  text5: 'oeng',
  imageAddress: 'assets/images/DannyChan.jpeg',
  route: '/module1-8',
);

MultipleChoiceTest mc1 = MultipleChoiceTest(
  word: '冬',
  options: ['d', 'k', 'b', 't'],
  correctIndex: 0,
  imageAddress: 'assets/images/winter.jpg',
  route: '/module1-9',
  soundPath: 'sound/dung1.mp3',
);
MultipleChoiceTest mc2 = MultipleChoiceTest(
  word: '八',
  options: ['g', 'k', 'b', 'p'],
  correctIndex: 2,
  imageAddress: 'assets/images/eight.png',
  route: '/module1-10',
  soundPath: 'sound/baat3.mp3',
);
MultipleChoiceTest mc3 = MultipleChoiceTest(
  word: '聽',
  options: ['d', 'k', 'b', 't'],
  correctIndex: 3,
  imageAddress: 'assets/images/listen.jpg',
  route: '/module1-11',
  soundPath: 'sound/teng1.mp3',
);

MultipleChoiceTest mc4 = MultipleChoiceTest(
  word: '抱',
  options: ['b', 'p', 'd', 't'],
  correctIndex: 1,
  imageAddress: 'assets/images/hug.jpg',
  route: '/module1-12',
  soundPath: 'sound/pou5.mp3',
);

MultipleChoiceTest mc5 = MultipleChoiceTest(
  word: '狗',
  options: ['g', 'k', 'd', 't'],
  correctIndex: 0,
  imageAddress: 'assets/images/dog.jpg',
  route: '/module1-13',
  soundPath: 'sound/gau2.mp3',
);

MultipleChoiceTest mc6 = MultipleChoiceTest(
  word: '琴',
  options: ['g', 'k', 'd', 't'],
  correctIndex: 1,
  imageAddress: 'assets/images/piano.png',
  route: '/module1-14',
  soundPath: 'sound/kam4.mp3',
);
