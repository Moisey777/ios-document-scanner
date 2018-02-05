//
//  ViewController.swift
//  docscanner
//
//  Created by xiao on 01/02/2018.
//

import UIKit

class ViewController: UIViewController {

    var openVideoViewButton:UIButton!
    var dcsView:DcsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dcsView = DcsView.self.init(frame:CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        view.addSubview(dcsView)
        
        // Show video view when DcsView is loaded.
        dcsView.currentView = DVE_VIDEOVIEW

        // Set the video view capture mode.
        dcsView.videoView.mode = DME_DOCUMENT

        // Set the next view after the cancel or capture button is clicked.
        dcsView.videoView.nextViewAfterCancel = DVE_IMAGEGALLERYVIEW
        dcsView.videoView.nextViewAfterCapture = DVE_EDITORVIEW

        // Create a button to show video view
        openVideoViewButton = UIButton(frame:CGRect(x:self.view.center.x-100, y:self.view.center.y-20, width: 200, height: 40))
        openVideoViewButton.setTitle("Back to Camera", for: .normal)
        openVideoViewButton.setTitleColor(UIColor.blue, for: .normal)
        openVideoViewButton.addTarget(self, action:#selector(onClick), for:UIControlEvents.touchUpInside);
        dcsView.imageGalleryView.addSubview(openVideoViewButton);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func onClick(){
        dcsView.currentView = DVE_VIDEOVIEW
    }
}

