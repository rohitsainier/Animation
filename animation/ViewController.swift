//
//  ViewController.swift
//  animation
//
//  Created by Rohit Saini on 12/04/18.
//  Copyright © 2018 SainiSaab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let curved  = curvedView(frame: view.frame)
//        curved.backgroundColor = UIColor.yellow
//        view.addSubview(curved)//CURVED
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
    }
    
    @objc func handleTap(){
        (0...10).forEach { (_) in
            generateRandomHearts()
        }
    }
    func generateRandomHearts(){
        let imageView = UIImageView()
        let dimention = 40 + drand48() * 10
        imageView.frame = CGRect(x: 0, y: 0, width: dimention, height: dimention)
        let image = drand48() > 0.5 ? #imageLiteral(resourceName: "heart") : #imageLiteral(resourceName: "teal-heart-md")
        imageView.image =  image
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = CustomPath().cgPath
        animation.duration = 2 + drand48() * 3
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        imageView.layer.add(animation, forKey: nil)
        view.addSubview(imageView)//IMAGEVIEW
    }
    
}
    
    func CustomPath() -> UIBezierPath{
        let  path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 400))
        let endPoint = CGPoint(x: 400, y:200)
        let random = 200 + drand48() * 300
        let cp1 = CGPoint(x: 300, y: 100 - random)
        let cp2 = CGPoint(x: 100, y: 200 + random)
        path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
        return path
    }

    class curvedView: UIView{
        override func draw(_ rect: CGRect) {
            
            let path = CustomPath()
            path.lineWidth = 5
            path.stroke()
        }
    }



