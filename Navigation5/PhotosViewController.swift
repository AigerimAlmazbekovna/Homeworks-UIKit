//
//  PhotosViewController.swift
//  Navigation5
//
//  Created by Айгерим on 04.04.2024.
//

import UIKit
import iOSIntPackage

class PhotosViewController: UIViewController {
    
    let facade = ImagePublisherFacade()
        
    var galleryImages: [UIImage] = []
    
    var photoGallery = Photo.makeImages()
    let photoIdent = "photoCell"
    
    var mycolor = UIColor.createColor(dark: .gray, any: .black)
    // MARK: Visual objects
    
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
        return layout
    }()

    lazy var photosCollectionView: UICollectionView = {
        let photos = UICollectionView(frame: .zero, collectionViewLayout: layout)
        photos.translatesAutoresizingMaskIntoConstraints = false
        photos.backgroundColor = .white
        photos.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: photoIdent)
        return photos
    }()
    
    // MARK: - Setup section
    
    override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = mycolor
            setupUI()
            setupConstraints()
            
            facade.subscribe(self)
            facade.addImagesWithTimer(time: 0.5, repeat: 20, userImages: photoGallery)
            
        }
    
    override var overrideUserInterfaceStyle: UIUserInterfaceStyle {
        get {
            .dark
        }
        set {
            
        }
    }
    
        override func viewWillDisappear(_ animated: Bool) {
            facade.removeSubscription(for: self)
        }
        
        override func viewWillTransition(
            to size: CGSize,
            with coordinator: UIViewControllerTransitionCoordinator
        ) {
            super.viewWillTransition(to: size, with: coordinator)
            
            coordinator.animate(alongsideTransition: { [weak self] context in
                guard let self = self else {
                    return
                }
                
                self.photosCollectionView.collectionViewLayout.invalidateLayout()
            }, completion: { context in })
        }

        
        
       //MARK: - Private
        
        private func setupUI() {
            title = "Photo Gallery"
            view.addSubview(photosCollectionView)
            photosCollectionView.dataSource = self
            photosCollectionView.delegate = self
        }
        
        // MARK: - Setting constraints
        
        private func setupConstraints() {
            NSLayoutConstraint.activate([
                photosCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
                photosCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                photosCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                photosCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.isNavigationBarHidden = false

        }
    }
   
// MARK: - Extensions

extension PhotosViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let countItem: CGFloat = 2
        let accessibleWidth = collectionView.frame.width - 32
        let widthItem = (accessibleWidth / countItem)
        return CGSize(width: widthItem, height: widthItem * 0.56)
    }
}

extension PhotosViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryImages.count
        //Photos.shared.examples.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoIdent, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell()}
        cell.configCellCollection(photo: galleryImages[indexPath.item])
                                    //Photos.shared.examples[indexPath.item])
        return cell
    }
}
extension PhotosViewController: ImageLibrarySubscriber {
    func receive(images: [UIImage]) {
        galleryImages = images
        photosCollectionView.reloadData()
    }
}
