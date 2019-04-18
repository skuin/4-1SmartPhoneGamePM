//
//  CustomScollViewController.swift
//  ScrollViews
//
//  Created by kpugame on 2019. 4. 8..
//  Copyright © 2019년 JEONGUN JO. All rights reserved.
//

import UIKit

class CustomScollViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet var scrollViewCustom: UIScrollView!
    var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let containerSize = CGSize(width: 640.0, height: 640.0)
        containerView = UIView(frame: CGRect(origin: CGPoint(x:0,y:0), size: containerSize))
        scrollViewCustom.addSubview(containerView)
        
        let redView = UIView(frame: CGRect(x: 0, y: 0, width: 640, height: 80))
        redView.backgroundColor = UIColor.red
        containerView.addSubview(redView)
        
        let blueView = UIView(frame: CGRect(x: 0, y: 560, width: 640, height: 80))
        blueView.backgroundColor = UIColor.blue
        containerView.addSubview(blueView)
        
        let greenView = UIView(frame: CGRect(x: 160, y: 160, width: 320, height: 320))
        greenView.backgroundColor = UIColor.green
        containerView.addSubview(greenView)
        
        let imageView = UIImageView(image: UIImage(named: "slow.png"))
        imageView.addSubview(imageView)
        
        scrollViewCustom.contentSize = containerSize
        
        let scrollViewFrame = scrollViewCustom.frame
        let scaleWidth = scrollViewFrame.size.width / scrollViewCustom.contentSize.width
        let scaleHeight = scrollViewFrame.size.height / scrollViewCustom.contentSize.height
        let minScale = min(scaleWidth, scaleHeight)
        scrollViewCustom.minimumZoomScale = minScale
        
        scrollViewCustom.maximumZoomScale = 1.0
        scrollViewCustom.zoomScale = minScale
        
        centerScollViewContents()
    }
    
    func centerScollViewContents(){
        let boundsSize = scrollViewCustom.bounds.size
        var contentsFrame = containerView.frame
        
        if contentsFrame.size.width < boundsSize.width{
            contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0
        } else {
            contentsFrame.origin.x = 0.0
        }
        if contentsFrame.size.height < boundsSize.height{
            contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0
        } else {
            contentsFrame.origin.y = 0.0
        }
        containerView.frame = contentsFrame
    }
    
    func viewForZooming(in scrollViewCustom: UIScrollView) -> UIView? {
        return containerView
    }
    
    func scrollViewDidZoom(_ scrollViewCustom: UIScrollView) {
        centerScollViewContents()
    }
}
