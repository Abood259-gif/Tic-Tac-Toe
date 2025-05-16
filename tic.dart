  import 'dart:io';
  import 'dart:math';




  void main() {
  the_grid() ;
  }
  void the_grid(){
    bool turn = true ;
    Map<int , bool> play = {} ;
    Map<int , String> ch_pos = {} ;
    for(int i = 1 ; i <= 9 ; i++)play[i] = false ;
    int t = 10 ;
    while(t-- > 0){
  for(int i = 0 ; i <3 ; i++){
        if(i == 0){
          for(int x = 1 ; x <= 3 ; x++){
            if(play[x] == true){
            if(x != 3) {
            if(ch_pos[x] == 'X') stdout.write("  X   | ");
            else stdout.write("  O   | ") ;
              }
            else{ if(ch_pos[x] == 'X')stdout.write("  X   ") ;
            else stdout.write("  O   ") ;
            }
              }
            else {
              if(x != 3)stdout.write("     | ");
              else stdout.write("      ") ;}
          }
        }else if(i == 1){
          for(int x = 4 ; x <= 6 ; x++){
          if(play[x] == true){
            if(x != 6) {
            if(ch_pos[x] == 'X') stdout.write("  X   | ");
            else stdout.write("  O   | ") ;
              }
            else{ if(ch_pos[x] == 'X')stdout.write("  X   ") ;
            else stdout.write("  O   ") ;
            }
              }
            else {
              if(x != 6)stdout.write("     | ");
              else stdout.write("      ") ;}
          }
        }else {
          for(int x = 7 ; x <= 9 ; x++){
          if(play[x] == true){
            if(x != 9) {
            if(ch_pos[x] == 'X') stdout.write("  X   | ");
            else stdout.write("  O   | ") ;
              }
            else{ if(ch_pos[x] == 'X')stdout.write("  X   ") ;
            else stdout.write("  O   ") ;
            }
              }
            else {
              if(x != 9)stdout.write("     | ");
              else stdout.write("      ") ;}
          }
        }
        print("") ;
      if(i != 2)print("- - - - - - - - -") ;
    }
      if(t!=9)turn = !turn ;
    if( ch_winner_tow(ch_pos) == true){
      print("Player Tow Wins!") ;
      print("Do you want to play again? (y/n)") ;
      String? try_ = stdin.readLineSync() ;
  if(try_ == "y"){
    the_grid() ;
  }else if(try_ == "n"){
    break ;
  }
    } if(ch_winner_one(ch_pos) == true){
      print("Player One Wins!") ;
      print("Do you want to play again? (y/n)") ;
      String? try_ = stdin.readLineSync() ;
  if(try_ == "y"){
    the_grid() ;
  }else if(try_ == "n"){
    break ;
  }
    }
    if(ch_winner_one(ch_pos) == false && t == 0){
      print("No one win !") ;
      break ;
    }
    get_inp(play , ch_pos , turn) ;
    }
  }
  void get_inp(Map<int , bool> mp , Map<int , String> ch_pos ,  bool ch){
    String? inp_ = stdin.readLineSync();
  
  while(inp_ == null || inp_.length > 1 || inp_.codeUnitAt(0) < 48 || inp_.codeUnitAt(0) > 57){
    stdout.write("Please Enter a valid position: ");
    inp_ = stdin.readLineSync();
  }
  int num = int.parse(inp_!) ;
  while(mp[num] == true){
     stdout.write("Please Enter a valid position: ") ;
    inp_ = stdin.readLineSync() ;
    num = int.parse(inp_!) ;
  }
  mp[num] = true ;
  if(ch)ch_pos[num] = 'X' ;
  else ch_pos[num] = 'O' ;
  }
  bool ch_winner_one(Map<int , String> ch_win){
  if(ch_win[1] == 'X' && ch_win[2] == 'X' && ch_win[3] == 'X')return true ;
  if(ch_win[4] == 'X'&& ch_win[5] =='X' && ch_win[6] == 'X')return true ;
  if(ch_win[7] == "X" && ch_win[8] == "X" && ch_win[9] == 'X')return true ;
  if(ch_win[1] == 'X' && ch_win[4] =='X' && ch_win[7] == 'X')return true ;
  if(ch_win[2] == 'X' && ch_win[5] == 'X' && ch_win[8] == 'X')return true ;
  if(ch_win[3] == 'X' && ch_win[6] == 'X' && ch_win[9] == 'X')return true ;
  if(ch_win[1] == 'X' && ch_win[5] == 'X' && ch_win[9] == 'X')return true ;
  if(ch_win[3] == 'X' && ch_win[5] == 'X' && ch_win[7] == 'X')return true ;
  return false ;
  }
  bool ch_winner_tow(Map<int , String> ch_win){
  if(ch_win[1] == 'O' && ch_win[2] == 'O' && ch_win[3] == 'O')return true ;
  if(ch_win[4] == 'O' && ch_win[5] == 'O' && ch_win[6] == 'O')return true ;
  if(ch_win[7] == 'O' && ch_win[8] == 'O' && ch_win[9] == 'O')return true ;
  if(ch_win[1] == 'O' && ch_win[4] == 'O' && ch_win[7] == 'O')return true ;
  if(ch_win[2] == 'O' && ch_win[5] == 'O' && ch_win[8] == 'O')return true ;
  if(ch_win[3] == 'O' && ch_win[6] == 'O' && ch_win[9] == 'O')return true ;
  if(ch_win[1] == 'O' && ch_win[5] == 'O' && ch_win[9] == 'O')return true ;
  if(ch_win[3] == 'O' && ch_win[5] == 'O' && ch_win[7] == 'O')return true ;
  return false ;
  }
