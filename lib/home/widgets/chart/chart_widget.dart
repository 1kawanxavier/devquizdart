import 'package:DevQuiz/core/app_colors.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatefulWidget {
  final double percent;
  const ChartWidget({Key? key, required this.percent}) : super(key: key);

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
 with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _animation;


  void _initAnimaton(){

    _controller = AnimationController(vsync: this, duration: Duration(seconds: 3));

    _animation = Tween(begin: 0.0, end: widget.percent).animate(_controller);
    _controller.forward();
  }

  @override
  void initState() {
    _initAnimaton();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context,_) => Stack(
        children: [
          Container(
            height: 80,
            width: 80,
            child: CircularProgressIndicator(
              strokeWidth: 10,
              value: _animation.value,
              backgroundColor: AppColors.chartSecondary,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
            ),
          ),
          Center(
            child: Text(
              "${(_animation.value * 100).toInt()}%",
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold,
                
              ),
            ),
          ),
        ],
      ),
        
        )
    );
  }
}
