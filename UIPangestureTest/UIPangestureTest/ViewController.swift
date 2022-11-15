//
//  ViewController.swift
//  UIPangestureTest
//
//  Created by dohankim on 2022/11/15.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var circleView = UIView()
    var circleView1 = UIView()
    var circleView2 = UIView()
    var circleView3 = UIView()
    var settingview : UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingview = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        settingview!.layer.cornerRadius = 50
        settingview!.backgroundColor = .blue
        
        view.addSubview(UIImageView(image: UIImage(named: "back")))
        circleView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        circleView.center = CGPoint( // circleView의 가운데가 중심점이 되어 이동한다!!
            x: UIScreen.main.bounds.width / 2,
            y: UIScreen.main.bounds.height / 2
        )
        circleView.layer.cornerRadius = 25 // 원 모양으로 만듬
        circleView.backgroundColor = UIColor.red
        self.view.addSubview(circleView)
        // 여기서 view는 ViewController가 가지고 있는 view!!
        // UIPanGestureRecognizer는 target(ViewController)에서 drag가 감지되면 action을 실행한다.
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.drag))
        // panGesture가 보는 view는 circleView가 된다.
        circleView.addGestureRecognizer(panGesture)
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.longPress))
        circleView.addGestureRecognizer(longPressGesture)
        circleView1.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        circleView1.center = CGPoint( // circleView의 가운데가 중심점이 되어 이동한다!!
            x: UIScreen.main.bounds.width / 3,
            y: UIScreen.main.bounds.height / 3
        )
        circleView1.layer.cornerRadius = 25 // 원 모양으로 만듬
        circleView1.backgroundColor = UIColor.red
        self.view.addSubview(circleView1) // 여기서 view는 ViewController가 가지고 있는 view!!
        
        // UIPanGestureRecognizer는 target(ViewController)에서 drag가 감지되면 action을 실행한다.
        let panGesture1 = UIPanGestureRecognizer(target: self, action: #selector(self.drag))
        // panGesture가 보는 view는 circleView가 된다.
        circleView1.addGestureRecognizer(panGesture1)
        
        circleView2.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        circleView2.center = CGPoint( // circleView의 가운데가 중심점이 되어 이동한다!!
            x: UIScreen.main.bounds.width / 4,
            y: UIScreen.main.bounds.height / 4
        )
        circleView2.layer.cornerRadius = 25 // 원 모양으로 만듬
        circleView2.backgroundColor = UIColor.blue
        self.view.addSubview(circleView2) // 여기서 view는 ViewController가 가지고 있는 view!!
        
        // UIPanGestureRecognizer는 target(ViewController)에서 drag가 감지되면 action을 실행한다.
        let panGesture2 = UIPanGestureRecognizer(target: self, action: #selector(self.drag))
        // panGesture가 보는 view는 circleView가 된다.
        circleView2.addGestureRecognizer(panGesture2)
        
        circleView3.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        circleView3.center = CGPoint( // circleView의 가운데가 중심점이 되어 이동한다!!
            x: UIScreen.main.bounds.width / 5,
            y: UIScreen.main.bounds.height / 5
        )
        circleView3.layer.cornerRadius = 25 // 원 모양으로 만듬
        circleView3.backgroundColor = UIColor.blue
        self.view.addSubview(circleView3) // 여기서 view는 ViewController가 가지고 있는 view!!
        
        // UIPanGestureRecognizer는 target(ViewController)에서 drag가 감지되면 action을 실행한다.
        let panGesture3 = UIPanGestureRecognizer(target: self, action: #selector(self.drag))
        // panGesture가 보는 view는 circleView가 된다.
        circleView3.addGestureRecognizer(panGesture3)
        
    }
    // #select가 objective-c 문법이기 때문에 앞에 annotation(@)objc를 붙인다
    @objc func drag(sender: UIPanGestureRecognizer) {
        // self는 여기서 ViewController이므로 self.view ViewController가 기존에가지고 있는 view이다.
        let translation = sender.translation(in: self.view) // translation에 움직인 위치를 저장한다.
        print(sender.velocity(in: self.view))
        // sender의 view는 sender가 바라보고 있는 circleView이다. 드래그로 이동한 만큼 circleView를 이동시킨다.
        sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
        sender.setTranslation(.zero, in: self.view)
        // 0으로 움직인 값을 초기화 시켜준다.
    }
    
    @objc func longPress(sender : UILongPressGestureRecognizer){
        switch sender.state{
        case .possible:
            print("possible")
        case .began:
            let point = sender.location(in: self.view)
            settingview?.center = circleView.center
            super.view.addSubview(settingview!)
        case .changed:
            print(sender.location(in: self.view))
        case .ended:
            settingview?.removeFromSuperview()
        case .cancelled:
            print("possible")
        case .failed:
            print("possible")
        @unknown default:
            print("possible")
        }
       
    }
}

