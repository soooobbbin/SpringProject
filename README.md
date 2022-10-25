# SpringProject
ECO4U project
[메인화면]
![eco4u 메인페이지](https://user-images.githubusercontent.com/109573488/197812259-805ff894-d459-4c94-a6ec-b8746417e126.png)
------------------------------------------
![제품상세](https://user-images.githubusercontent.com/109573488/197812412-74bed514-0ff9-4f47-b26d-3a54dfb984f9.png)
제품 상세 페이지에서 장바구니 버튼 클릭 시 상품이 장바구니에, 하트 아이콘 클릭 시 관심상품에 담깁니다.
![장바구니 페이지](https://user-images.githubusercontent.com/109573488/197812419-d9fbd8cd-26f5-490c-a3ad-f90402dfbe9d.png)
장바구니에 담긴 상품은 개별 삭제 or 선택/전체 삭제가 가능합니다.
![위시리스트](https://user-images.githubusercontent.com/109573488/197812423-fc797dc5-e313-4f8a-a5b9-0b4499896185.png)
관심상품 페이지는 담은 상품이 많아졌을 경우 가시성을 위하여 상품을 카테고리별로 볼 수 있도록 구성하였습니다.
관심상품 목록에 담긴 상품 또한 개별/선택/전체 삭제가 가능하며 관심상품에 담은 상품을 장바구니에 추가할 수 있습니다.

[장바구니 - 상품 선택 삭제 오류]
 : 체크박스로 선택한 상품들을 배열에 담아서 가져오려는데 값이 안불러와짐
<img width="654" alt="스크린샷 2022-10-21 오후 6 12 58" src="https://user-images.githubusercontent.com/109573488/197809445-e9883613-5dc2-4a15-a13f-e1ba65ad3330.png">
array로 설정했던 체크박스 값을 .toString으로 변환해서 controller로 전송
<img width="662" alt="스크린샷 2022-10-21 오후 6 12 24" src="https://user-images.githubusercontent.com/109573488/197809693-70b54768-f6ec-4ce2-be3d-e3a5c6c931ee.png">

service에 String del_product 값을 받는 deleteCartchecked를 생성한 뒤
string 값으로 받은 배열을 구분자 ,로 split해서 값을 가져옴
split로 가져온 값을 반복문으로 장바구니에서 delete함
