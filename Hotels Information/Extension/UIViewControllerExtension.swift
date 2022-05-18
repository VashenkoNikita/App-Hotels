//
//  UIViewControllerExtension.swift
//  Hotels Information
//
//  Created by User on 09.05.2022.
//

import UIKit

extension UIViewController{
    
    func fetchPhoto(model: HotelPhotoModel, comletion: @escaping (Data) -> Void) {
        DispatchQueue(label: "New", qos: .userInteractive).async {
            guard let url = URL(string: model.hotelPhoto) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            comletion(data)
        }
    }
    func setupContraintsActivityIndicator(activityIndicator: UIActivityIndicatorView) {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
