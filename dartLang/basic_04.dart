main(){
  int? num1 = null;
  print(num1);
  // num1이 null이면 8을출력. 
  num1 ??= 8;
  print(num1);

  // 삼항연산자
  bool isPublic = true;
  var visibility = isPublic ? 'public' : 'private';
  print(visibility);

  int sum = 0;
  for(int i=1; i <= 10; i++){
  sum += i;
  }
  print(sum);

  sum = 0;
  List<int> numList =[1,2,5,6,8];
  for(int i in numList){
    sum+=i;
  }
  print(sum);
  
}