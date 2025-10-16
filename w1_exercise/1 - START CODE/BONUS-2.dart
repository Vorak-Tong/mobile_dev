bool checkedMatching(String text){
  List<String> stack = [];
  for(int i = 0; i < text.length; i++){
    if(text[i] == '(' || text[i] == '{' || text[i] == '['){
      stack.add(text[i]);
    }
    else if(text[i] == ')' || text[i] == '}' || text[i] == ']'){
      if(stack.isEmpty){
        return false;
      }
      else if(stack.last == '(' && text[i] != ')' ||
              stack.last == '{' && text[i] != '}' ||
              stack.last == '[' && text[i] != ']'){
        return false;
      }
      else{
        stack.removeLast();
    }
    }
  }
  return stack.isEmpty? true : false;
}

void main() {
  List<String> input = ['{what is (42)}?', '[text}', '{[[(a)b]c]d}', '}{'];
  for(var str in input){
    if(checkedMatching(str) == true){
      print('Balanced');
    }else{
      print('Not balanced');
    }
  }
}