import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<WordRepository>()])
import 'package:flutter_application_2/logic/word_manager.dart';
import 'package:flutter_application_2/objects/word.dart';
import 'package:flutter_application_2/persistence/word_repository.dart';
// Mock repository
import 'word_manager_test.mocks.dart';

void main() {
  group('WordManager', () {
    late WordManager wordManager;
    late MockWordRepository mockRepository;

    setUp(() {
      mockRepository = MockWordRepository();
      wordManager = WordManager(mockRepository);
    });

    test('validateWord returns error for null or empty input', () {
      expect(wordManager.validateWord(null), 'Enter a word');
      expect(wordManager.validateWord(''), 'Enter a word');
      expect(wordManager.validateWord('   '), 'Enter a word');
    });

    test('validateWord returns null for valid input', () {
      expect(wordManager.validateWord('hello'), null);
    });

    test('validateDescription returns error for null or empty input', () {
      expect(wordManager.validateDescription(null), 'Enter a description');
      expect(wordManager.validateDescription(''), 'Enter a description');
      expect(wordManager.validateDescription('   '), 'Enter a description');
    });

    test('validateDescription returns null for valid input', () {
      expect(wordManager.validateDescription('some text'), null);
    });

    test('processAndSave trims input and calls repository.save', () async {
      const wordInput = '  Flutter ';
      const descriptionInput = '  A UI toolkit.  ';

      when(mockRepository.save(any)).thenAnswer((_) async => null);


      await wordManager.processAndSave(wordInput, descriptionInput);

      final expectedWord = Word(
        word: 'Flutter',
        description: 'A UI toolkit.',
      );

      verify(mockRepository.save(argThat(
        isA<Word>()
          .having((w) => w.word, 'word', 'Flutter')
          .having((w) => w.description, 'description', 'A UI toolkit.'),
      ))).called(1);
    });
  });
}
