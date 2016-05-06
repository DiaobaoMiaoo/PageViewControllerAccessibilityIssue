//
//  PageViewController.swift
//  naviTest
//
//  Created by Ke MA on 2016-05-06.
//  Copyright © 2016 Kemin. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    var orderedViewControllers: [UIViewController] = {
        return [UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("1"),
                UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("2")]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dataSource = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .Forward,
                               animated: true,
                               completion: nil)
        }
    
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(pageViewController: UIPageViewController,
                            viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        if previousIndex < 0 || previousIndex >= orderedViewControllers.count {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(pageViewController: UIPageViewController,
                            viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        if orderedViewControllersCount <= nextIndex {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
}