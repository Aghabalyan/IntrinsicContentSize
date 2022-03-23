//
//  MusicViewController.swift
//  IntrinsicContentSize
//
//  Created by Grigor Aghabalyan on 10.03.22.
//

import UIKit

class MusicViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Variables
    
    private var musics: [Music] = []
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCell()
        
        musics.append(Music(title: "Classical music", isSelected: true))
        musics.append(Music(title: "Jazz", isSelected: false))
        musics.append(Music(title: "Pop music", isSelected: false))
        musics.append(Music(title: "Hip hop music", isSelected: false))
        musics.append(Music(title: "Electronic music", isSelected: false))
        musics.append(Music(title: "Folk music", isSelected: false))
        musics.append(Music(title: "Blues", isSelected: false))
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - Registers
    
    private func registerCell() {
        
        let nib = UINib(nibName: MusicCell.cellIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: MusicCell.cellIdentifier)
    }
}

// MARK: - UICollectionViewDataSource

extension MusicViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MusicCell.cellIdentifier, for: indexPath) as? MusicCell
        cell?.configureCell(music: musics[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    
}

// MARK: - UICollectionViewDelegate

extension MusicViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for music in musics {
            music.isSelected = false
        }
        musics[indexPath.row].isSelected = true
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MusicViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}

