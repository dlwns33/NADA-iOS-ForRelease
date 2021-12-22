//
//  CardCreationPreviewViewController.swift
//  NADA-iOS-forRelease
//
//  Created by kimhyungyu on 2021/11/21.
//

import UIKit

class CardCreationPreviewViewController: UIViewController {
    
    public var frontCardDataModel: FrontCardDataModel?
    public var backCardDataModel: BackCardDataModel?
    public var cardBackgroundImage: UIImage?
    public var defaultImageIndex: Int?
    
    private var isFront = true
    private var cardCreationRequest: CardCreationRequest?
    private var isShareable = false
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var noticeLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setBackgroundImage()
        setFrontCard()
        setGestureRecognizer()
    }
    @IBAction func touchCompleteButton(_ sender: Any) {
        guard let frontCardDataModel = frontCardDataModel, let backCardDataModel = backCardDataModel else { return }
        
        guard let userID = UserDefaults.standard.string(forKey: Const.UserDefaults.userID) else { return }
        
        cardCreationRequest = CardCreationRequest(userID: userID, frontCard: frontCardDataModel, backCard: backCardDataModel)
        guard let cardCreationRequest = cardCreationRequest,
              let cardBackgroundImage = cardBackgroundImage else { return }

        cardCreationWithAPI(request: cardCreationRequest, image: cardBackgroundImage)
    }
    @IBAction func touchBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Extensions

extension CardCreationPreviewViewController {
    private func setUI() {
        navigationController?.navigationBar.isHidden = true
        
        noticeLabel.font = .textRegular04
        noticeLabel.textColor = .primary

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 3
        paragraphStyle.alignment = .center
        let attributeString = NSMutableAttributedString(string: noticeLabel?.text ?? "")
        attributeString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributeString.length))
        noticeLabel.attributedText = attributeString
        
        completeButton.titleLabel?.font = .button01
        // MARK: - #available(iOS 15.0, *)
        if #available(iOS 15.0, *) {
            var config = UIButton.Configuration.filled()
            config.background.cornerRadius = 15
            config.baseBackgroundColor = .mainColorNadaMain
            config.baseForegroundColor = .white
            completeButton.configuration = config
            
            let configHandler: UIButton.ConfigurationUpdateHandler = { button in
                switch button.state {
                default:
                    button.configuration?.title = "생성"
                }
            }
            completeButton.configurationUpdateHandler = configHandler
        } else {
            // TODO: - QA/iOS 13 테스트. selected 설정.
            completeButton.setTitle("생성", for: .normal)
            completeButton.layer.cornerRadius = 15
            completeButton.setBackgroundImage(UIImage(named: "enableButtonBackground"), for: .normal)
            completeButton.setTitleColor(.white, for: .normal)
        }
    }
    private func setFrontCard() {
        guard let frontCard = FrontCardCell.nib().instantiate(withOwner: self, options: nil).first as? FrontCardCell else { return }
        
        frontCard.frame = CGRect(x: 0, y: 0, width: cardView.frame.width, height: cardView.frame.height)
        guard let frontCardDataModel = frontCardDataModel else { return }
        frontCard.initCell(cardBackgroundImage,
                           frontCardDataModel.title,
                           frontCardDataModel.description,
                           frontCardDataModel.name,
                           frontCardDataModel.birthDate,
                           frontCardDataModel.mbti,
                           frontCardDataModel.instagramID,
                           frontCardDataModel.linkURL,
                           isShareable: isShareable)
        
        cardView.addSubview(frontCard)
    }
    private func setGestureRecognizer() {
        let swipeLeftGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(transitionCardWithAnimation(_:)))
        swipeLeftGestureRecognizer.direction = .left
        self.cardView.addGestureRecognizer(swipeLeftGestureRecognizer)
        
        let swipeRightGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(transitionCardWithAnimation(_:)))
        swipeRightGestureRecognizer.direction = .right
        self.cardView.addGestureRecognizer(swipeRightGestureRecognizer)
    }
    private func setBackgroundImage() {
        if frontCardDataModel?.defaultImage == 0 {
            return
        } else if frontCardDataModel?.defaultImage == 1 {
            cardBackgroundImage = UIImage(named: "imgCardBg01")
        } else if frontCardDataModel?.defaultImage == 2 {
            cardBackgroundImage = UIImage(named: "imgCardBg02")
        } else if frontCardDataModel?.defaultImage == 3 {
            cardBackgroundImage = UIImage(named: "imgCardBg03")
        } else if frontCardDataModel?.defaultImage == 4 {
            cardBackgroundImage = UIImage(named: "imgCardBg04")
        } else if frontCardDataModel?.defaultImage == 5 {
            cardBackgroundImage = UIImage(named: "imgCardBg05")
        } else if frontCardDataModel?.defaultImage == 6 {
            cardBackgroundImage = UIImage(named: "imgCardBg06")
        } else {
            cardBackgroundImage = UIImage(named: "imgCardBg07")
        }
    }

    // MARK: - @objc Methods
    
    @objc
    private func transitionCardWithAnimation(_ swipeGesture: UISwipeGestureRecognizer) {
        if isFront {
            guard let backCard = BackCardCell.nib().instantiate(withOwner: self, options: nil).first as? BackCardCell else { return }
            guard let backCardDataModel = backCardDataModel else { return }
            backCard.frame = CGRect(x: 0, y: 0, width: cardView.frame.width, height: cardView.frame.height)
            backCard.initCell(cardBackgroundImage,
                              backCardDataModel.isMincho,
                              backCardDataModel.isSoju,
                              backCardDataModel.isBoomuk,
                              backCardDataModel.isSauced,
                              backCardDataModel.firstTMI,
                              backCardDataModel.secondTMI,
                              backCardDataModel.thirdTMI,
                              isShareable: isShareable)
            
            cardView.addSubview(backCard)
            isFront = false
        } else {
            guard let frontCard = FrontCardCell.nib().instantiate(withOwner: self, options: nil).first as? FrontCardCell else { return }
            
            frontCard.frame = CGRect(x: 0, y: 0, width: cardView.frame.width, height: cardView.frame.height)
            guard let frontCardDataModel = frontCardDataModel else { return }
            frontCard.initCell(cardBackgroundImage,
                               frontCardDataModel.title,
                               frontCardDataModel.description,
                               frontCardDataModel.name,
                               frontCardDataModel.birthDate,
                               frontCardDataModel.mbti,
                               frontCardDataModel.instagramID,
                               frontCardDataModel.linkURL,
                               isShareable: isShareable)
            
            cardView.addSubview(frontCard)
            isFront = true
        }
        if swipeGesture.direction == .right {
            UIView.transition(with: cardView, duration: 0.5, options: .transitionFlipFromLeft, animations: nil) { _ in
                self.cardView.subviews[0].removeFromSuperview()
            }
        } else {
            UIView.transition(with: cardView, duration: 0.5, options: .transitionFlipFromRight, animations: nil) { _ in
                self.cardView.subviews[0].removeFromSuperview()
            }
        }
        
    }
    
    // MARK: - Network
    
    func cardCreationWithAPI(request: CardCreationRequest, image: UIImage) {
        CardAPI.shared.cardCreation(request: request, image: image) { response in
            switch response {
            case .success:
                print("cardCreationWithAPI - success")
                self.dismiss(animated: true, completion: nil)
            case .requestErr(let message):
                print("cardCreationWithAPI - requestErr: \(message)")
            case .pathErr:
                print("cardCreationWithAPI - pathErr")
            case .serverErr:
                print("cardCreationWithAPI - serverErr")
            case .networkFail:
                print("cardCreationWithAPI - networkFail")
            }
        }
    }
    
}
