//
//  BackCardCell.swift
//  NADA-iOS-forRelease
//
//  Created by 민 on 2021/10/11.
//

import UIKit
import VerticalCardSwiper

class BackCardCell: CardCell {
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var tasteTitleLabel: UILabel!
    @IBOutlet weak var mintImageView: UIImageView!
    @IBOutlet weak var noMintImageView: UIImageView!
    @IBOutlet weak var sojuImageView: UIImageView!
    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var pourEatImageView: UIImageView!
    @IBOutlet weak var putSauceEatImageView: UIImageView!
    @IBOutlet weak var sauceChickenImageView: UIImageView!
    @IBOutlet weak var friedChickenImageView: UIImageView!
    @IBOutlet weak var tmiTitleLabel: UILabel!
    @IBOutlet weak var firstTmiLabel: UILabel!
    @IBOutlet weak var secondTmiLabel: UILabel!
    @IBOutlet weak var thirdTmiLabel: UILabel!
    
    // MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    // MARK: - Functions
    static func nib() -> UINib {
        return UINib(nibName: Const.Xib.backCardCell, bundle: Bundle(for: BackCardCell.self))
    }
}

// MARK: - Extensions
extension BackCardCell {
    private func setUI() {
        tasteTitleLabel.font = .title02
        tasteTitleLabel.textColor = .white
        tmiTitleLabel.font = .title02
        tmiTitleLabel.textColor = .white
        firstTmiLabel.font = .textRegular04
        firstTmiLabel.textColor = .white
        secondTmiLabel.font = .textRegular04
        secondTmiLabel.textColor = .white
        thirdTmiLabel.font = .textRegular04
        thirdTmiLabel.textColor = .white
    }
    
    /// 서버에서 image 를 URL 로 가져올 경우 사용.
    func initCell(_ backgroundImageString: String,
                  _ isMint: Bool,
                  _ isSoju: Bool,
                  _ isBoomuk: Bool,
                  _ isSauced: Bool,
                  _ firstTMI: String,
                  _ secondTMI: String,
                  _ thirdTMI: String) {
        if let bgImage = UIImage(named: backgroundImageString) {
            self.backgroundImageView.image = bgImage
        }
        
        self.mintImageView.image = isMint == true ?
        UIImage(named: "iconTasteOnMincho") : UIImage(named: "iconTasteOffMincho")
        self.noMintImageView.image = isMint == false ?
        UIImage(named: "iconTasteOnBanmincho") : UIImage(named: "iconTasteOffBanmincho")
        
        self.sojuImageView.image = isSoju == true ?
        UIImage(named: "iconTasteOnSoju") : UIImage(named: "iconTasteOffSoju")
        self.beerImageView.image = isSoju == false ?
        UIImage(named: "iconTasteOnBeer") : UIImage(named: "iconTasteOffBeer")
        
        self.pourEatImageView.image = isBoomuk == true ?
        UIImage(named: "iconTasteOnBumeok") : UIImage(named: "iconTasteOffBumeok")
        self.putSauceEatImageView.image = isBoomuk == false ?
        UIImage(named: "iconTasteOnZzik") : UIImage(named: "iconTasteOffZzik")
        
        self.sauceChickenImageView.image = isSauced == true ?
        UIImage(named: "iconTasteOnSeasoned") : UIImage(named: "iconTasteOffSeasoned")
        self.friedChickenImageView.image = isSauced == false ?
        UIImage(named: "iconTasteOnFried") : UIImage(named: "iconTasteOffFried")
        
        self.firstTmiLabel.text = firstTMI
        self.secondTmiLabel.text = secondTMI
        self.thirdTmiLabel.text = thirdTMI
    }
    
    /// 명함생성할 때 image 를 UIImage 로 가져올 경우 사용
    func initCell(_ backgroundImage: UIImage?,
                  _ isMint: Bool,
                  _ isSoju: Bool,
                  _ isBoomuk: Bool,
                  _ isSauced: Bool,
                  _ firstTMI: String,
                  _ secondTMI: String,
                  _ thirdTMI: String) {
        self.backgroundImageView.image = backgroundImage ?? UIImage()
        self.mintImageView.image = isMint == true ?
        UIImage(named: "iconTasteOnMincho") : UIImage(named: "iconTasteOffMincho")
        self.noMintImageView.image = isMint == false ?
        UIImage(named: "iconTasteOnBanmincho") : UIImage(named: "iconTasteOffBanmincho")
        
        self.sojuImageView.image = isSoju == true ?
        UIImage(named: "iconTasteOnSoju") : UIImage(named: "iconTasteOffSoju")
        self.beerImageView.image = isSoju == false ?
        UIImage(named: "iconTasteOnBeer") : UIImage(named: "iconTasteOffBeer")
        
        self.pourEatImageView.image = isBoomuk == true ?
        UIImage(named: "iconTasteOnBumeok") : UIImage(named: "iconTasteOffBumeok")
        self.putSauceEatImageView.image = isBoomuk == false ?
        UIImage(named: "iconTasteOnZzik") : UIImage(named: "iconTasteOffZzik")
        
        self.sauceChickenImageView.image = isSauced == true ?
        UIImage(named: "iconTasteOnSeasoned") : UIImage(named: "iconTasteOffSeasoned")
        self.friedChickenImageView.image = isSauced == false ?
        UIImage(named: "iconTasteOnFried") : UIImage(named: "iconTasteOffFried")
        
        self.firstTmiLabel.text = firstTMI
        self.secondTmiLabel.text = secondTMI
        self.thirdTmiLabel.text = thirdTMI
    }
}
