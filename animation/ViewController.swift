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
//        let curved  = curvedView(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.height - 100))
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
    
    //MARK:- sendEmoji
    func sendEmoji(emojiIcon: UIImage){
        let imageView = UIImageView()
        let dimention = 40 + drand48() * 10
        imageView.frame = CGRect(x: 0, y: 0, width: dimention, height: dimention)
        imageView.image = emojiIcon
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = CustomPath().cgPath
        animation.duration = 2 + drand48() * 3
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        imageView.layer.add(animation, forKey: nil)
        view.addSubview(imageView)
    }
    
    @IBAction func clickBtn1(_ sender: UIButton) {
        (0...10).forEach { (_) in
            sendEmoji(emojiIcon: #imageLiteral(resourceName: "chat-bubble"))
        }
    }
    
    @IBAction func clickBtn2(_ sender: UIButton) {
        (0...10).forEach { (_) in
            sendEmoji(emojiIcon: #imageLiteral(resourceName: "heart"))
        }
    }
    @IBAction func clickBtn3(_ sender: UIButton) {
        (0...10).forEach { (_) in
            sendEmoji(emojiIcon: #imageLiteral(resourceName: "connector"))
        }
    }
    
    @IBAction func clickBtn4(_ sender: UIButton) {
        (0...10).forEach { (_) in
            sendEmoji(emojiIcon: #imageLiteral(resourceName: "loving"))
        }
    }
    @IBAction func clickBtn5(_ sender: UIButton) {
        (0...10).forEach { (_) in
            sendEmoji(emojiIcon: #imageLiteral(resourceName: "favourite"))
        }
    }
    @IBAction func clickBtn6(_ sender: UIButton) {
        (0...10).forEach { (_) in
            sendEmoji(emojiIcon: #imageLiteral(resourceName: "india"))
        }
    }
    
}
    
    func CustomPath() -> UIBezierPath{
        let  path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        let random = 0 + drand48() * 600
        let endPoint = CGPoint(x: random, y:1000)
        
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



