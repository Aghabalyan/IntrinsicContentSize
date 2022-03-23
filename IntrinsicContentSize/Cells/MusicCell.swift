//
//  MusicCell.swift
//  IntrinsicContentSize
//
//  Created by Grigor Aghabalyan on 10.03.22.
//

import UIKit

class MusicCell: UICollectionViewCell {
    
    // MARK: - IBOutlets

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var conteinerView: UIView!
    
    // MARK: - Variables
    
    static let cellIdentifier = "MusicCell"
    
    // MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        conteinerView.borderWidth = 1
        conteinerView.borderColor = .systemBlue
        conteinerView.cornerRadius = conteinerView.bounds.height / 2
    }
    
    // MARK: - Configure
    
    func configureCell(music: Music) {
        titleLabel.text = music.title
        
        if music.isSelected {
            conteinerView.backgroundColor = .systemBlue
            titleLabel.textColor = .white
        }else {
            conteinerView.backgroundColor = .white
            titleLabel.textColor = .black
        }
    }
}
