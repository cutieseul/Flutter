main(){
  ThreeKingdoms threeKingdoms = ThreeKingdoms();
  print(threeKingdoms.name); // name : 밑에 변수 이름
  threeKingdoms.sayName();

  ThreeKingdoms2 threeKingdoms2 = ThreeKingdoms2("유비", "촉");
  threeKingdoms2.saySomthing();
} // main

class ThreeKingdoms{  //class 이름은 대문자
  // Field
  String name = '유비';
  // Constructor

  // Method or Function
  sayName(){
    print("내 이름은 ${this.name} 입니다."); // this : field에 있는 변수값임
  }
}

class ThreeKingdoms2{
  // Field
  // 생성자를 받아서 출력하려고 함

  //방법1
  late String name; // late : 대출받는 용도. 데이터가 없지만 나중에주겠다는 뜻
  //방법2
  String? nation; // numm safety 로 설정

  //Constructor
  ThreeKingdoms2(String name, String nation)
  : this.name =name,
    this.nation = nation;

  // Method
  saySomthing(){
    print("제 이름은 ${this.name}이고, 조국은 ${this.nation} 입니다.");
  }
}