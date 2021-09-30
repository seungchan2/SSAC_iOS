//
//  ViewController.swift
//  SSAC_Nextflix
//
//  Created by 김승찬 on 2021/09/28.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Property
    let imageArray = [UIImage(named: "poster1"), UIImage(named: "poster2"), UIImage(named: "poster3"), UIImage(named: "poster4"), UIImage(named: "poster5"), UIImage(named: "poster6"), UIImage(named: "poster7"), UIImage(named: "poster8"), UIImage(named: "poster9"), UIImage(named: "poster10"), UIImage(named: "아바타"), UIImage(named: "어벤져스엔드게임")]
    
    // MARK: @IBOutlets
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var playImage: UIImageView!
    @IBOutlet weak var firstPosterImageView: UIImageView!
    @IBOutlet weak var secondPosterImageView: UIImageView!
    @IBOutlet weak var thirdPosterImageView: UIImageView!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        attributeImage()
        playImageAction()
    }
    
    // MARK: Functions
    private func playImageAction() {
        self.playImage.isUserInteractionEnabled = true
        self.playImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.viewTapped)))
    }
    
    private func attributeImage() {
        [firstPosterImageView, thirdPosterImageView, secondPosterImageView].forEach {
            $0?.layer.cornerRadius = 60
            $0?.layer.borderColor = UIColor.gray.cgColor
            $0?.layer.borderWidth = 2
        }
    }
    
    // MARK: @Objc Functions
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
     
    }
}
