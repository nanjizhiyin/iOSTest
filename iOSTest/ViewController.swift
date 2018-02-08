//
//  ViewController.swift
//  iOSTest
//
//  Created by xuexin on 2018/2/8.
//  Copyright © 2018年 xuexin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //主线程中
        let lock = NSLock();
        
        DispatchQueue.global(qos: .default).async(execute: {() -> Void in
            print("线程1 strt")
            lock.lock()
            print("线程1")
            sleep(2)
            lock.unlock()
            print("线程1解锁成功")
        })
        //线程2
        DispatchQueue.global(qos: .default).async(execute: {() -> Void in
            
            print("线程2strte")
            //以保证让线程2的代码后执行
            lock.lock()
            print("线程2")
            lock.unlock()
        })

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

