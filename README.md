1. Table Calendar 패키지 사용 시 선택 일자 데이터는 바뀌는데 마커가 반영되지 않는 문제가 있음
 - selectedDayPredicate 필드에서 (day) {return isSameDay(selectedDay, day);}으로 isSameDay라는 내부함수를 써야했는데 이 정보가 공식 설명에 나와 있지 않아서 애를 먹음.
 - 결국 공식 예제를 하나하나 뜯어보고 해결. 패키지 평가가 130점 만점인 패키지이기 때문에 기능 상 문제가 없을 거라고 생각했지만 점수가 높다고 꼭 설명이 친절한 것은 아니었음. 
 - 앞으로 패키지 사용 시 설명이 부족하다고 느낀다면 예제를 뜯어볼 것.

2. 프로바이더 상태관리 시 showDialog 내부 변화를 감지하지 못하는 문제가 있음
 - showDialog의 빌더에서 ChangeNotifierProvider.value를 리턴하고 ChangeNotifierProvider.value의 value 필드에 프로바이더 인스턴스를 연동, child에 Consumer<해당 프로바이더>를 두고 빌더에 이하 원하는 위젯을 리턴함으로서 해결
 - 정확히 어떤 문제이고 내부에서 어떤 원리로 동작하여 해결하는지 아직 모름. 다시 한 번 알아볼 필요 있음.

3. 편집창이 뜨는 경우 OK버튼을 눌러야 임시 키값과 임시 날짜가 초기화되어서 OK버튼을 누르지 않고 닫은 다음, 추가/수정 버튼을 누르면 임시 키값과 임시 날짜가 그대로 불러와지고 저장 시 임시 키값에 맞춰 값을 저장해서 있었던 값이 덮어쓰이져는 현상 발생
 - 추가로 들어오는지 수정으로 들어오는지 분기를 나눌 필요가 있음.
 - 분기를 나누고 진행할지 그냥 한번 설계 후 갈아엎을지 선택해야 함. 참고로 지금 설계 없이 그냥 만드는 바람에 굉장히 헷갈리고, 성능면에서 비효율이 발생할 수도 있다고 의심됨.
