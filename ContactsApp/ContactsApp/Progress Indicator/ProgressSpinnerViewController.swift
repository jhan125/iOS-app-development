//
//  ProgressSpinnerViewController.swift
//  ContactsApp
//
//  Created by Jiali Han on 11/5/24.
//

import UIKit

class ProgressSpinnerViewController: UIViewController {
    
    var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .blue
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        
        // attached the indicator to the current view.
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.25)
        view.addSubview(activityIndicator)
        
        // anchor the indicator to the center of the screen.
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }

}
