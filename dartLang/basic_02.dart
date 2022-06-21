
main(){
  List threeKingdoms = [];
  //추가하기
  threeKingdoms.add("위");
  threeKingdoms.add("촉");
  threeKingdoms.add("오");

  print(threeKingdoms);
  print(threeKingdoms[0]);

  //수정하기
  threeKingdoms[0] = "We";
  print(threeKingdoms);

  //삭제하기
  threeKingdoms.removeAt(1);
  print(threeKingdoms);

  threeKingdoms.remove('We');
  print(threeKingdoms);

  //몇개인지
  print(threeKingdoms.length);

  //1도 출력이됨
  threeKingdoms.add(1);
  print(threeKingdoms);

  //리스트에 타입 설정하기
  List<String> threeKingdoms2 = [];

  //------------
  // Map : Key와 Value로 이루어진 Collection
  Map fruits = {
    'apple' : '사과',
    'grape' : '포도',
    'watermelon' : '수박',
  };

  print(fruits['apple']);
  //바꾸기
  fruits['watermelon'] = '시원한수박';

  //추가하기
  fruits['Banana'] = '바나나';
  print(fruits);

  Map<String, int> fruitsPrice = {
    'apple' : 1000,
    'grape' : 2000,
    'watermelon' : 3000,
  };
  print(fruitsPrice['apple']);
  
  //null safety
  int applePrice = fruitsPrice['apple']!;


  // null값이 들어간다는 것을 알려주기
  int numA = 10;
  int? numB = 100;
  numB = null;
}