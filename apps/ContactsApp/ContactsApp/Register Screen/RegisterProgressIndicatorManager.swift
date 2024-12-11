//
//  RegisterProgressIndicatorManager.swift
//  ContactsApp
//
//  Created by Jiali Han on 11/5/24.
//

import Foundation

extension RegisterViewController:ProgressSpinnerDelegate{
    func showActivityIndicator(){
        // add the indicator as a child view of the current view
        addChild(childProgressView)
        view.addSubview(childProgressView.view)
        // attach and display the indicator on top of the current view
        childProgressView.didMove(toParent: self)
    }
    
    func hideActivityIndicator(){
        // detach the indicator
        childProgressView.willMove(toParent: nil)
        childProgressView.view.removeFromSuperview()
        // remove the indicator views from their parent
        childProgressView.removeFromParent()
    }
}
