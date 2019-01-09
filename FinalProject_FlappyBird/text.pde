PFont titleFont;
//uses rect() & fill(), both value and default
void text(){
  
textAlign(CENTER,TOP); //Align X&Y, see Processing.org/refference
//Values: LEFT| CENTER| RIGHT & TOP| CENTER| BOTTOM| BASELINE
textFont(titleFont,40);//Change the number until it fits, largest font size
text(title,width/4,height*0,width/2,height*1/10);
  
}
