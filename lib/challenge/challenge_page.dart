import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/home/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/result/result_page.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;
  const ChallengePage({Key? key, required this.questions, required this.title}) : super(key: key);

  @override
  State<ChallengePage> createState() => _ChallengePageState();

}

class _ChallengePageState extends State<ChallengePage> {
  @override
  void initState() {
    
    pageController.addListener(() { 
      controller.currentPage = pageController.page!.toInt() + 1; 
    });
    super.initState();

  }

  void nextPage(){
    if(controller.currentPage < widget.questions.length )
    pageController.nextPage(duration: Duration(milliseconds: 100), curve: Curves.linear,);
  }
  final controller = ChallangeController();
  final pageController = PageController();

  void onSelected(bool value){
    if(value){
      controller.qtdAwenserRight++;
    }
    nextPage();
  }
  
  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(top: true, child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.close)),
            ValueListenableBuilder<int>(valueListenable: controller.currentPageNotifier, builder: (context,value,_) => QuestionIndicatorWidget(

              currentPage: value,
              length: widget.questions.length,
              
            ),)
            
          ],
        )),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller:  pageController,
        children: widget.questions.map((e) =>  QuizWidget(question:  e, onSelected: onSelected,)).toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: 
            ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier, builder: (context, value, _)=>   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if(value < widget.questions.length)
                    Expanded(child: NextButtonWidget.white(label: "Pular", onTap: nextPage)),
                    
                      if(value == widget.questions.length)
                      Expanded(child: NextButtonWidget.green(label: "Confirmar ", onTap: (){Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(builder: (BuildContext context) => ResultPage(result:  controller.qtdAwenserRight, title: widget.title,length: widget.questions.length,))
                          );
                        },
                       )), 


                    ],
              ) ),
          ),
        ),
      
    );
  }
}