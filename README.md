<img src="https://user-images.githubusercontent.com/20789760/235415279-c25c2152-0435-47ac-985d-b05d89a113ea.png" />
<h3 align="center">최강영감: EZ</h3>
<p align="center">EZ를 통해 재미있게 자기상태를 체크해 보아요!</p>

<div style="display: flex; flex-direction: column;" align="center" >
  <a href="https://www.apple.com/kr/store">
    <img src="https://user-images.githubusercontent.com/81340603/204947353-18c33fe9-c49b-443a-b1e2-7cf9a85bb91b.png" width=180px />
  </a>
<p3>&nbsp;&nbsp;&nbsp;</p3>
  <a href="https://github.com/DeveloperAcademy-POSTECH/MC2-Team11-EZ">
    <img src="https://user-images.githubusercontent.com/81340603/205491490-1ec07066-5b90-4277-9907-42b1ef47fe45.png" width=60px/>
  </a>
</div>

<h2>🧐 Preview</h2>
<img src="https://user-images.githubusercontent.com/20789760/235419131-b47ccaeb-b63f-4ac2-9acc-bb757f37c905.png" />
<div align="center">
  ➿
  상세설명 작성예정
  ➿
</div>

<br>

<h2>🗂 Directory Structure</h2>


➿
상세설명 작성예정
➿
<br>

<h2>🔩 Tech & Skills</h2>

➿
상세설명 작성예정
➿

<br>

<h2>🛠 Development Environment</h2>

<img width="100" src="https://img.shields.io/badge/IOS-16%2B-silver"> <img width="125" src="https://img.shields.io/badge/Xcode-14.3-blue">

<br>


<h2>🔏 License</h2>
<img width="170" src="https://img.shields.io/badge/MIT License-2.0-yellow">


<br>

<h2>👨‍🎨 Authors</h2>

|[Malty / 김예현](https://github.com)|[SEEZ / 김승은](https://github.com)|[Genie / 박혜진](https://github.com)|[Flynn / 김민서](https://github.com)|[Puppy / 최영재](https://github.com)|
|:---:|:---:|:---:|:---:|:---:|
| <img width=200px src="https://user-images.githubusercontent.com/20789760/235421605-88c06903-ed11-4e18-a66f-681122554acd.png"/> | <img width=200px src="https://user-images.githubusercontent.com/20789760/235421653-9ddce3cc-4294-4f24-992b-ac88ed914700.jpg"/> | <img width=200px src="https://user-images.githubusercontent.com/20789760/235421794-e7bb55c6-833b-447d-b1d2-63fbffcc73c0.jpeg"/> | <img width=200px src="https://user-images.githubusercontent.com/20789760/235421927-a57c616a-d310-4ab7-a161-b7c50d1a66bf.PNG"/> | <img width=200px src="https://user-images.githubusercontent.com/20789760/235421976-8eb2a63d-aa17-4205-b6e0-46a69809f1c1.png"/> | 
|<center>iOS Lead Developer</center>|<center>iOS Lead Developer</center>|<center>iOS Lead Developer</center>|<center>iOS Lead Developer</center>|<center>iOS Lead Developer</center>|


<br>

<h2> 🚨 최강영감 Git Workflow </h2>

1. 우리팀 상황
- 팀원 5명
- 협업툴이 모두 다르며 , 사용이 익숙치 않은 팀원이 다수
- Git 익숙하지 않은 팀원이 다수
- 개발 초기라 자주 컨셉이 변경 될 가능성이 있음.

2. 브랜치 정의
- main: 제품으로 출시될 수 있는 브랜치 (사용)
- develop : 다음 출시 버전을 개발하는 브랜치 (사용)
- feature : 기능을 개발하는 브랜치 (사용)
- release : 이번 출시 버전을 준비하는 브랜치 (미사용)
- hotfix : 출시 버전에서 발생한 버그를 수정 하는 브랜치 (미사용)

<img src="https://user-images.githubusercontent.com/20789760/235433624-399b14a2-caf9-4b1b-8941-9f8241f8aa24.png" />

3. 커밋 메세지 규칙 (대문자)
- FIX : 버그 수정, 에러 해결 등
- ADD : 파일 / UI / API 추가
- FEAT : 기능 추가
- DELETE : 파일 삭제
- REFACTOR : 기존 파일 개선/보완
- MOVE : 파일 위치 변경 / 이름 변경 등 실제 코드 내용 변경 없을 시
- CHORE : 기타 
- SETTING : 세팅
- 첫 줄에 커밋 제목 작성, 추가 설명이 필요한 경우 줄 바꿈 후 여러 줄에 내역 작성
- ex) [FEAT] 로그아웃 및 회원탈퇴 구현 (#320), [CHORE] 코드리뷰 반영 (#204), [FIX] 초대코드 복사 토스트가 계속 내려오는 문제 해결 (#197), [ADD] ToastView 컴포넌트화

4. 깃 조작방법 
- 새로운 feature 개발: 최신 develop의 변경사항을 local에 반영시킨다.
- 이슈를 열어서 이슈번호를 확인한다. 라벨로 표기하면 더욱 보기에 좋다. ex) [FEAT] 팀 관리 모달 api 연결 
- $ git checkout develop : develop 브랜치로 checkout
- $ git pull : develop 브랜치의 최신 변경사항을 로컬로 가져온다. 
- $ git checkout -b <닉네임_branch명/이슈번호> :명령어를 통해 브랜치 생성 후 checkout한다 ex) puppy_feat/#320
- 코드작성
- $ git add <file 명>: git add . 를 통해 모든 파일을 staging area에 추가할 수 있다. 
- $ git commit -m "커밋메세지" ex) 커밋 규칙 확인
- $ git push origin <feature branch>: origin(원격 저장소)의 feature branch로 로컬 변경 내역을 push
- github에서 develop branch <- feature branch 방향으로  Pull Request 진행
- 리뷰가 종료되고 모두 Approve 된다면 Merge한다. 

5. PR 규칙
 - 템플릿 예정

<br>
