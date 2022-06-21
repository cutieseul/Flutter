main(){
  checkVersion();
  print('End process');
}

// 비동기 함수 async 
Future checkVersion() async{
  var version = await lookupVersion(); //await: 순서를 기다리는것
}

int lookupVersion(){
  return 12;
}