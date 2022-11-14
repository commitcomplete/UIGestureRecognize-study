# UIGestureRecognize-study
---
# UIGestureRecognizer 
GestureRecognizer는 일련의 터치(또는 기타 입력)을 인식하고 해당 인식에 따라 작동하는 로직을 분리한다.
UIGestureRecognizer가 제스처의 변경을 인식하면 지정된 각 대상 객체에 작업 메세지를 보낸다.    
각 대상 개체는 다음과 같다.
* UITapGestureRecognizer
* UIPinchGestureRecognizer
* UIRotationGestureRecognizer
* UISwipeGestureRecognizer
* UIPanGestureRecognizer
* UIScreenEdgePanGestureRecognizer
* UILongPressGestureRecognizer
* UIHoverGestureRecognizer

위의 클래스들은 delegate 패턴을 지원하고 특정행동에 대한 커스텀도 지원한다.
특정 뷰에 대한 터치를 인식하고 그뷰의 서브뷰에 대한 터치도 같이 인식한다.
그리고 이렇게 뷰에 대한 터치를 인식하려면 addGestureRecognizer()를 호출해주어야 한다.
gesture recognize는 뷰의 'responder chain' 에 들어가지 않는다. 
```
responder chain이란 해당 뷰에서 이벤트가 일어났지만 그 이벤트를 핸들링하지 않을 경우 
점점 상위계층으로 올라가서 이벤트 핸들링을 물어보는것. 끝까지 없으면 아무일도 일어나지 않는다. 
ex : UILabel -> UIView -> UIViewController -> UIWindow 
-> UIApplication -> UIApplicationDelegate
참고 : https://seizze.github.io/2019/11/26/iOS%EC%9D%98-Responder%EC%99%80-Responder-Chain-%EC%9D%B4%ED%95%B4%ED%95%98%EA%B8%B0.html
```


