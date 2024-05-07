import 'package:testapp/view/MatchingWord.dart';

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
