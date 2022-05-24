//
//  ViewController.swift
//  Hotels Information
//
//  Created by User on 08.05.2022.
//

import UIKit

final class HotelViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    let searchController = UISearchController()
    var presenter: HotelPresenterOutputProtocol!
    var filterInfo: [HotelModel]?
    var filterPhoto: [HotelPhotoModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupCollectionView()
        createSecrchBar()
        setupContraintsActivityIndicator(activityIndicator: activityIndicator)
        changeTheDataFilter()
    }
}
extension HotelViewController{
    private func setupCollectionView () {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 36, bottom: 0, right: 36)
        layout.itemSize = CGSize(width: 160 , height: 210)
        
        collectionView = UICollectionView (frame: view.bounds, collectionViewLayout:layout )
        collectionView.autoresizingMask = [ .flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 239/255, alpha: 1)
        collectionView.register (HotelCell.self, forCellWithReuseIdentifier: HotelCell.reuseId)
        
        view.addSubview (collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    private func createSecrchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск отелей по названию"
        searchController.searchBar.delegate = self
    }
    private func changeTheDataFilter(){
        guard let filterPresenterData = presenter.modelInfo else { return }
        guard let filterPhoto = presenter.modelImage else { return }

        self.filterInfo = filterPresenterData
        self.filterPhoto = filterPhoto
    }
}

//MARK: - DataSourse

extension HotelViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchController.isActive{
            return filterInfo?.count ?? 0
        }
        return presenter.modelInfo?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotelCell.reuseId, for: indexPath) as? HotelCell else {fatalError("Cell is not create")}
        return cellConfiguration(cell: cell, indexPath: indexPath)
    }
}

//MARK: - Delegate
extension HotelViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let infoHotel:HotelModel?
        let photoHotel:HotelPhotoModel?
        
        if searchController.isActive{
            guard let filterInfo = filterInfo else { return }
            guard let filterPhoto = filterPhoto else { return }
            infoHotel = filterInfo[indexPath.row]
            photoHotel = filterPhoto[indexPath.row]
        } else {
            infoHotel = presenter.modelInfo?[indexPath.row]
            photoHotel = presenter.modelImage?[indexPath.row]
        }
        
        guard let photoHotel = photoHotel else { return }
        guard let infoHotel = infoHotel else { return }
        
        presenter.tapOnTheData(modelInfo: infoHotel, modelImage: photoHotel)
    }
}

//MARK: - SearchBarDelegate

extension HotelViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        reloadData(with: searchText)
    }
    private func reloadData(with searchText:String?){
        
        guard let filterData = searchText!.isEmpty ? presenter.modelInfo : presenter.modelInfo?.filter({ hotelModel in
            return hotelModel.contains(filter: searchText)
        }) else { return }
        
        guard let filterPhotos = searchText!.isEmpty ? presenter.modelImage : presenter.modelImage?.filter({ photoModel in
            return photoModel.contains(filter: searchText)
        }) else { return }
        
        filterInfo = filterData
        filterPhoto = filterPhotos
        
        collectionView.reloadData()
    }
}

//MARK: - ProtocolInput
extension HotelViewController: HotelVCProtocolInput{
    func success() {
        collectionView.reloadData()
    }
    func failure(error: Error) {
        showAlert(text: error.localizedDescription)
    }
}

extension HotelViewController{
    private func showAlert (text: String) {
        
        let alertController = UIAlertController(title: text, message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    private func cellConfiguration(cell: HotelCell, indexPath: IndexPath ) -> HotelCell {
        if let modelInfo = presenter.modelInfo , let modelPhoto = presenter.modelImage {            
            let infoHotel:HotelModel?
            let photo:HotelPhotoModel?

            if searchController.isActive{
                guard let filterInfo = filterInfo else { return cell }
                guard let filterPhoto = filterPhoto else { return cell}
                photo = filterPhoto[indexPath.row]
                infoHotel = filterInfo[indexPath.row]
            }else {
                photo = modelPhoto[indexPath.row]
                infoHotel = modelInfo[indexPath.row]
            }
            createLoadActInd(activityIndIsVisible: false, collecctionIsVisible: true, viewIsVisible: false)
            
            guard let photo = photo else { return cell}
            guard let infoHotel = infoHotel else { return cell }
            
            fetchPhoto(model: photo) { [weak self] dataPhoto in
                DispatchQueue.main.async {
                    cell.hotelImage.image = UIImage(data: dataPhoto)
                    self?.createLoadActInd(activityIndIsVisible: true, collecctionIsVisible: false, viewIsVisible: true)
                }
            }
            cell.hotelName.text = infoHotel.name
        }
        return cell
    }
    
    private func createLoadActInd(activityIndIsVisible: Bool, collecctionIsVisible: Bool, viewIsVisible: Bool) {
        activityIndicator.isHidden = activityIndIsVisible
        self.view.isUserInteractionEnabled = viewIsVisible
        self.collectionView.isHidden = collecctionIsVisible
        
        if activityIndIsVisible {
            activityIndicator.stopAnimating()
        }else {
            activityIndicator.startAnimating()
        }
    }
}
