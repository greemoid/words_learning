import 'package:flutter/material.dart';
import 'package:words_learning/common/widgets/light_grey_divider.dart';
import 'package:words_learning/features/courses/widgets/learning_button.dart';
import 'package:words_learning/features/courses/widgets/word_item.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LEARNING',
          style: textTheme.titleLarge,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ClipOval(
                child: Image.asset('assets/images/default-profile-photo.png')),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LightGreyDivider(),
              SizedBox(height: 16),
              Text('Title of Course', style: textTheme.titleMedium),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LearningButton(
                      onTap: () {},
                      icon: Icons.sd_card,
                      label: "Learn",
                      textTheme: textTheme),
                  SizedBox(width: 12),
                  LearningButton(
                      onTap: () {},
                      icon: Icons.sd_card,
                      label: "Top idioms",
                      textTheme: textTheme),
                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LearningButton(
                      onTap: () {},
                      icon: Icons.sd_card,
                      label: "Top idioms",
                      textTheme: textTheme),
                  SizedBox(width: 12),
                  LearningButton(
                      onTap: () {},
                      icon: Icons.sd_card,
                      label: "Top idioms",
                      textTheme: textTheme),
                ],
              ),
              SizedBox(height: 32),
              Text('My Words', style: textTheme.titleMedium),
              ListView.builder(
                  itemCount: wordList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: WordItem(
                        word: wordList[index].word,
                        definition: wordList[index].definition,
                        value: wordList[index].value,
                        textTheme: textTheme,
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class Word {
  final String word;
  final String definition;
  final double value;

  Word({
    required this.word,
    required this.definition,
    required this.value,
  });
}

List<Word> wordList = [
  Word(
      word: "abate",
      definition: "to decrease in force or intensity",
      value: 0.45),
  Word(word: "benevolent", definition: "well-meaning and kindly", value: 0.72),
  Word(
      word: "candor",
      definition: "the quality of being open and honest",
      value: 0.81),
  Word(
      word: "debacle",
      definition: "a sudden and ignominious failure",
      value: 0.36),
  Word(
      word: "elusive",
      definition: "difficult to find, catch, or achieve",
      value: 0.63),
  Word(
      word: "frugal",
      definition: "sparing or economical with resources",
      value: 0.58),
  Word(
      word: "gregarious", definition: "fond of company; sociable", value: 0.29),
  Word(
      word: "hinder",
      definition: "to create difficulties, resulting in delay",
      value: 0.77),
  Word(
      word: "indolent",
      definition: "wanting to avoid activity; lazy",
      value: 0.52),
  Word(word: "jovial", definition: "cheerful and friendly", value: 0.90),
  Word(
      word: "keen",
      definition: "having or showing eagerness or enthusiasm",
      value: 0.69),
  Word(
      word: "lucid",
      definition: "expressed clearly; easy to understand",
      value: 0.41),
  Word(
      word: "meticulous",
      definition: "showing great attention to detail",
      value: 0.87),
  Word(
      word: "nebulous",
      definition: "in the form of a cloud; unclear",
      value: 0.34),
  Word(
      word: "obstinate",
      definition: "stubbornly refusing to change opinion",
      value: 0.65),
  Word(
      word: "placate",
      definition: "to make someone less angry or hostile",
      value: 0.76),
  Word(
      word: "quandary",
      definition: "a state of uncertainty over what to do",
      value: 0.43),
  Word(
      word: "resilient",
      definition: "able to withstand or recover quickly",
      value: 0.92),
  Word(
      word: "savvy",
      definition: "shrewd and knowledgeable; practical",
      value: 0.55),
  Word(
      word: "tenacious",
      definition: "tending to keep a firm hold; persistent",
      value: 0.68),
];
