//
//  DetailInfoHotelVC.swift
//  Hotels Information
//
//  Created by User on 08.05.2022.
//

import UIKit

final class DetailInfoHotelVC: UIViewController {
    
    var presenter: DetailPresenterProtocolOutput!
    private let activityIndicator = UIActivityIndicatorView(style: .large)

    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 254/255, green: 254/255, blue: 237/255, alpha: 1)
        return view
    }()
    var imageView: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    var nameLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    var aboutHotelLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    var detailInfoLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupContraintsActivityIndicator(activityIndicator: activityIndicator)
                
        createConstraint()
        presenter.setData()
    }
}

extension DetailInfoHotelVC: DetailViewProtocolInput {
    func getData(dataHotel: HotelModel, imageHotel: HotelPhotoModel) {
        createLoad(activityIndicator: false, true)
        fetchPhoto(model: imageHotel) { [weak self] dataPhoto in
            DispatchQueue.main.async {
                self?.imageView.image = UIImage(data: dataPhoto)
                self?.createLoad(activityIndicator: true, false)
            }
        }
        nameLabel.text = dataHotel.name
        aboutHotelLabel.text = dataHotel.address
        detailInfoLabel.text = "Stars - \(dataHotel.stars)\nDistance - \(dataHotel.distance)"
    }
}

extension DetailInfoHotelVC{
    private func createConstraint(){
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutHotelLabel.translatesAutoresizingMaskIntoConstraints = false
        detailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 30
        
        view.addSubview(imageView)
        view.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(aboutHotelLabel)
        containerView.addSubview(detailInfoLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: containerView.topAnchor,constant: 30),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 206)
        ])
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 35),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24)
        ])
        NSLayoutConstraint.activate([
            aboutHotelLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 8),
            aboutHotelLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            aboutHotelLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24)
        ])
        NSLayoutConstraint.activate([
            detailInfoLabel.topAnchor.constraint(equalTo: aboutHotelLabel.bottomAnchor,constant: 8),
            detailInfoLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            detailInfoLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
        ])
    }
}

extension DetailInfoHotelVC{
    private func createLoad(activityIndicator: Bool, _ view: Bool) {
        self.activityIndicator.isHidden = activityIndicator
        self.view.isUserInteractionEnabled = view
        self.imageView.isHidden = view
        self.containerView.isHidden = view
        
        if activityIndicator{
            self.activityIndicator.stopAnimating()
        }else {
            self.activityIndicator.startAnimating()
        }
        
    }
}
