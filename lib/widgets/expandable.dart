import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimension.dart';
import 'package:foodapp/widgets/small_text.dart';

class Expandable extends StatefulWidget {
final String text;
  const Expandable({Key? key, required this.text}) : super(key: key);

  @override
  State<Expandable> createState() => _ExpandableState();
}

class _ExpandableState extends State<Expandable> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimension.screenHeight/5.63;

  @override
  void initState(){
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =  widget.text.substring(textHeight.toInt()+1, widget.text.length);
    }else{
      firstHalf=widget.text;
      secondHalf="";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(text: firstHalf, size: Dimension.font13, color: AppColors.mainBlackColor.withOpacity(0.5)):Column(
        children: [
          SmallText(height: 1.5, text: hiddenText?(firstHalf+"..."):(firstHalf+secondHalf), color: AppColors.mainBlackColor.withOpacity(0.5), size: Dimension.font13,),
        InkWell(
          onTap: (){
            setState(()
            {
              hiddenText=!hiddenText;
            });
          },
          child: Row(
            children: [
              if(hiddenText == true) ...[
                SmallText(text: "Show more", color: AppColors.textColor, size: Dimension.font14,),
                Icon(hiddenText?Icons.arrow_drop_down_rounded: Icons.arrow_drop_up, color: AppColors.mainColor,),

              ]else ...[
                SmallText(text: "Hide more", color: AppColors.textColor, size: Dimension.font14),
                Icon(hiddenText?Icons.arrow_drop_down_rounded: Icons.arrow_drop_up, color: AppColors.mainColor,),
              ]
            ],
          ),
        ),
        ],
      ),
    );
  }
}
