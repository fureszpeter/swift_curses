//
//  ViewController.swift
//  Ora14
//
//  Created by Furesz Peter on 2018. 05. 08..
//  Copyright © 2018 PeterFuresz. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
//    private let rectContainer = UIView();
    private let rect1 = UIView();
    private let rect2 = UIView();
    private let rect3 = UIView();

    override func viewDidLoad() {
        super.viewDidLoad()

//        rectContainer.backgroundColor = UIColor.purple;
        rect1.backgroundColor = UIColor.red;
        rect2.backgroundColor = UIColor.blue;
        rect3.backgroundColor = UIColor.yellow;

//        view.addSubview(rectContainer)
//        view.clipsToBounds = true
        view.addSubview(rect1)
        view.addSubview(rect2)
        view.addSubview(rect3)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let rect1Width = view.frame.width * 0.5;
        let rect1Height = view.frame.height * 0.5;

        rect1.frame = CGRect(
                x: 0,
                y: 0,
                width: rect1Width,
                height: rect1Height
        )

        rect1.center = view.center;

        let spacing = CGFloat(10);
        let rect2Width = rect1Width * 0.45
        let rect2Height = view.frame.height - rect1.frame.maxY - spacing * 2;

        rect2.frame = CGRect(
                x: rect1.frame.origin.x ,
                y: rect1.frame.maxY + spacing,
                width: rect2Width,
                height: rect2Height
        )
        rect3.frame = CGRect(
                x: rect1.frame.maxX - rect2Width,
                y: rect1.frame.maxY + spacing,
                width: rect2Width,
                height: rect2Height
        )
    }

    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }



}
