

import 'dart:math';

import 'package:androidtest/result.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
   const MainScreen({ Key? key }) : super(key: key);
 
   @override
   _MainScreenState createState() => _MainScreenState();
 }
 const activeColor = Color(0xFF566de5);
  const inActiveColor = Color(0xFFffffff);
 
 class _MainScreenState extends State<MainScreen> {
   @override
   int height =120;
   int weight=70;
  int age=20;
  String result = "";
  double bmi=0;
  String resultDetail="";
  Color maleBoxColor = activeColor;
  Color femaleBoxColor = inActiveColor;
  void updateBoxColor(int gender){
    if(gender ==1){
      if(maleBoxColor==inActiveColor){
        maleBoxColor = activeColor;
        femaleBoxColor=inActiveColor;
      }
      else{
        maleBoxColor=inActiveColor;
         femaleBoxColor = activeColor;
      }
     
    } else{
        if(femaleBoxColor==inActiveColor){
        femaleBoxColor = activeColor;
         maleBoxColor=inActiveColor;
      }
      else{
        femaleBoxColor=inActiveColor;
        maleBoxColor = activeColor;
      }
      }
  }
  double calculateBMI(int weight, int height){
     bmi= weight/pow(height/100,2);
    return bmi;
  }
 

  String getInterpretation(double bmi){
   if(bmi >= 25){
     return 'Tệ';
   }else if(bmi>=18.5){
   return 'GÚT CHÓP';}

   else {
     return 'TẠM';
   }
  }
   double _currentSliderValue = 20;
   Widget build(BuildContext context) {
     return Scaffold(
       
        appBar: AppBar(
        title: Text("BMI calutator test"),
        
        ),
        body: Column(
         children: [
           Expanded(
             child: Row(
             children: [
               Expanded(
                 child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateBoxColor(1);
                      });
                    },

                 child: ContainerBox(
                   boxColor: maleBoxColor,
                  childWidget :Column(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.venus,
                        size:100.0
                      ),
                      SizedBox(height:15.0),
                      Text('FEMALE',
                      style: TextStyle(color: Colors.black,
                      fontSize: 20.0),
                      )
                    ],
                  )
               )
                 ),
             
                  ),
                 Expanded(
                   child: GestureDetector(
                     onTap: (){
                       setState(() {
                         updateBoxColor(2);
                       });
                     },
                     child: ContainerBox(
                     boxColor: femaleBoxColor,
                      childWidget :Column(
                         children: <Widget>[
                      Icon(
                        FontAwesomeIcons.mars,
                        size:100.0
                      ),
                      SizedBox(height:15.0),
                      Text('MALE',
                      style: TextStyle(color: Colors.black,
                      fontSize: 20.0),)
                    ],
                
                 ),
             ),
                   ),
                    )
             ],
             )),
             
            Expanded(
              
                 child: ContainerBox(boxColor: Colors.red,

                  childWidget :Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  
                    children: [
                      Text('Height',
                      style: TextStyle(color: Colors.black,fontSize: 50),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toString(),style:TextStyle(color: Colors.black,fontSize: 30),),
                          Text('cm',style:TextStyle(color: Colors.black,fontSize: 30),),
                        ],
                      ),
                        Slider(               
                   value: height.toDouble(),
                  min: 120,
                  max: 220,                
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      height = value.round();
        }
       );
      },
                 ),
                    ],
                  )
                
                 
                 ),
                
            ),
           Expanded(
             child: Row(
             children: [
               Expanded(
                 child: ContainerBox(boxColor: Colors.blueGrey,
                  childWidget :Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: TextStyle(color: Colors.black,fontSize: 20),

                      ),
                      Text(
                        weight.toString(),
                        style: TextStyle(color: Colors.white,fontSize: 50),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              backgroundColor: Colors.black87,
                            child: Icon(FontAwesomeIcons.plus,color: Colors.white),
                            onPressed: (){
                                setState(() {
                                  weight++;
                                });

                            },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                              FloatingActionButton(
                              backgroundColor: Colors.black87,
                            child: Icon(FontAwesomeIcons.minus,color: Colors.white),
                            onPressed: (){
                              setState(() {
                                if(weight>0)
                                weight--;
                              });
                            },
                            ),
                            
                          ],
                        )
                    ],
                
                 )
                 ),),
                 Expanded(child: ContainerBox(boxColor: Colors.red,
                  childWidget :Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: TextStyle(color: Colors.black,fontSize: 20),

                      ),
                      Text(
                        age.toString(),
                        style: TextStyle(color: Colors.white,fontSize: 50),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              backgroundColor: Colors.black87,
                            child: Icon(FontAwesomeIcons.plus,color: Colors.white),
                            onPressed: (){
                                setState(() {
                                  age++;
                                });

                            },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                              FloatingActionButton(
                              backgroundColor: Colors.black87,
                            child: Icon(FontAwesomeIcons.minus,color: Colors.white),
                            onPressed: (){
                              setState(() {
                                if(age>0)
                                age--;
                              });
                            },
                            ),
                            
                          ],
                        )
                    ],
                 )
                 ) ,
                 )  
             ]
           )),
           GestureDetector(
             onTap: (){
               setState(() {
                   result= calculateBMI(weight, height).toStringAsFixed(1);
            resultDetail= getInterpretation(bmi);
              showDialog(
                 context: context,
                builder: (BuildContext context){
                  return SecondPage();
                  // return Dialog(
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(60.0),
                  //   ),
                  //   child: Container(
                  //     height: 200,
                  //     margin: EdgeInsets.all(10.0),
                  //     //child: Text('data'),
                  //     child: Column(
                        
                  //       mainAxisAlignment: MainAxisAlignment.center,
                        
                  //       children: [
                           
                  //          Text(
                  //           'KẾT QUẢ BMI',
                  //           style: TextStyle(color: Colors.black,fontSize: 20),
                  //           ),
                  //          Text(
                  //            result,
                  //            style: TextStyle(color: Colors.black,fontSize: 20),
                  //            ),
                  //          Text(
                  //            resultDetail,
                  //            style: TextStyle(color: Colors.black,fontSize: 20),
                  //            ),
                  //       ],
                  //     ),
                  //   ),
                  // );
               }
               )
               ;


           
                }
                );
             },
             child:    Container(
              child: Column(
                children: [
                  //Text('Tinh'),
                    // ignore: deprecated_member_use
                    FlatButton(
                 child:
            Text('Calculate',
            style: TextStyle(color: Colors.black,fontSize: 20),

          
            ),
             onPressed: (){
               result= calculateBMI(weight, height).toStringAsFixed(1);
            resultDetail= getInterpretation(bmi);
                  Navigator.push(context, MaterialPageRoute<void>(
                     builder: (BuildContext context){
                return Scaffold(
                   appBar: AppBar(title: Text('Kết Quả')),
                  body: Center(
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      
                       onPressed: () {   Navigator.pop(context);},
                       child: Column(
                        
                         mainAxisAlignment: MainAxisAlignment.center,
                        
                         children: [
                            
                            Text(
                             'KẾT QUẢ BMI',
                             style: TextStyle(color: Colors.black,fontSize: 20),
                             ),
                            Text(
                              result,
                              style: TextStyle(color: Colors.black,fontSize: 20),
                              ),
                            Text(
                              resultDetail,
                              style: TextStyle(color: Colors.black,fontSize: 20),
                              ),
                         ],
                       ),
                    
                    
                    
                    ),
                  ),
                );
                  
                  },
                   ));
                  

}),
             
                ],
                
               // ignore: deprecated_member_use
              

            ),
            width: double.infinity,
            height: 80,
            color: activeColor,
            margin: EdgeInsets.only(top: 10),     
          ),
           ),


         ],
         
          ),
          
        );
   }
 }

class ContainerBox extends StatelessWidget {
  ContainerBox({required this.boxColor,required this.childWidget});
 final Color boxColor;
 final Widget childWidget;
 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childWidget,
    margin: EdgeInsets.all(15.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: boxColor,
      boxShadow: [BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5.0,
        blurRadius: 7.0,
        offset: Offset(0,3)
      ),],
    ),
    );
  }
}
 
 