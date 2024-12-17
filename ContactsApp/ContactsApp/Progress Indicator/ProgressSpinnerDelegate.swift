//
//  ProgressSpinnerDelegate.swift
//  ContactsApp
//
//  Created by Jiali Han on 11/5/24.
//
import Foundation

// usecase: when a user clicks on the register button, the app should display the indicator view, and when the user is created, and their profile is updated, we will remove it.
protocol ProgressSpinnerDelegate{
    func showActivityIndicator()
    func hideActivityIndicator()
}
