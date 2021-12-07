1. Table Calendar 패키지 사용 시 선택 일자 데이터는 바뀌는데 마커가 반영되지 않는 문제가 있음
 - selectedDayPredicate 필드에서 (day) {return isSameDay(selectedDay, day);}으로 isSameDay라는 내부함수를 써야했는데 이 정보가 공식 설명에 나와 있지 않아서 애를 먹음.
 - 결국 공식 예제를 하나하나 뜯어보고 해결. 패키지 평가가 130점 만점인 패키지이기 때문에 기능 상 문제가 없을 거라고 생각했지만 점수가 높다고 꼭 설명이 친절한 것은 아니었음. 
 - 앞으로 패키지 사용 시 설명이 부족하다고 느낀다면 예제를 뜯어볼 것.

2. 프로바이더 상태관리 시 showDialog 내부 변화를 감지하지 못하는 문제가 있음
 - showDialog의 빌더에서 ChangeNotifierProvider.value를 리턴하고 ChangeNotifierProvider.value의 value 필드에 프로바이더 인스턴스를 연동, child에 Consumer<해당 프로바이더>를 두고 빌더에 이하 원하는 위젯을 리턴함으로서 해결
 - 정확히 어떤 문제이고 내부에서 어떤 원리로 동작하여 해결하는지 아직 모름. 다시 한 번 알아볼 필요 있음.
