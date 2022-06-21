main(){

  // final과 const의 차이

  final String name1 = '유비';
  // name1 = '조조'; -> 이름 안바뀜
  const String name2 = '관우';
  // name1 = '조조'; -> 이름 안바뀜

  // final : 실행(컴파일)할때 결정되는 타입임. 
  //그래서 시간(계속 바뀌는 값)이 출력이 됨
  final DateTime now1 = DateTime.now();

  // const : 시간 출력 안됨. 코딩할때 부터 정해진 값만 쓸 수 있음
  // const DateTime now1 = DateTime.now(); (에러)


}