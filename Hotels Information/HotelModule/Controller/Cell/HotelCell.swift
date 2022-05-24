//
//  HotelCell.swift
//  Hotels Information
//
//  Created by User on 08.05.2022.
//

import UIKit

final class HotelCell: UICollectionViewCell{
    static var reuseId: String = "UserCell"
    
    var hotelImage: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 4
        return image
    }()
    var hotelName: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    let containerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
    }
    private func setupConstraints(){
        hotelImage.translatesAutoresizingMaskIntoConstraints = false
        hotelName.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        self.layer.cornerRadius = 4
        
        containerView.layer.cornerRadius = 4
        containerView.clipsToBounds = true
        
        //contentView.layer.shadowColor = UIColor(red: 189/255, green: 189/255, blue: 189/255, alpha: 1).cgColor
        containerView.backgroundColor = UIColor(red: 254/255, green: 254/255, blue: 237/255, alpha: 1)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
       
        
        addSubview(containerView)
        containerView.addSubview(hotelImage)
        containerView.addSubview(hotelName)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            hotelImage.topAnchor.constraint(equalTo: containerView.topAnchor),
            hotelImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            hotelImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            hotelImage.heightAnchor.constraint(equalToConstant: 150),
            
            hotelName.topAnchor.constraint(equalTo: hotelImage.bottomAnchor),
            hotelName.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            hotelName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            hotelName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
