//
//  InstructionCustomView.swift
//  alt_liveness3d
//
//  Created by altbank on 07/01/23.
//


import Foundation
import FaceCaptcha

class InstructionCustomView: UIView, CustomInstructionView {
    
    
    func changeLoadingVisibility(to visibility: FaceCaptcha.LoadingVisibility) {
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    
    @IBOutlet weak var lampidaImage: UIImageView!
    @IBOutlet weak var sorrisinImage: UIImageView!
    @IBOutlet weak var ocrosImage: UIImageView!
    @IBOutlet weak var bunehImage: UIImageView!
    
    @IBOutlet weak var titleLablel: UILabel!
    @IBOutlet weak var text1Lablel: UILabel!
    @IBOutlet weak var text2Lablel: UILabel!
    
    
    // MARK: - Lifecycle
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }
    
    // MARK: - Methods
    
    private func loadFromNib() {
        let bundle = Bundle(for: type(of: self))
        bundle.loadNibNamed("\(type(of: self))", owner: self, options: nil)
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        lampidaImage.image = UIImage(named: "lampida")
        sorrisinImage.image = UIImage(named: "sorrisin")
        ocrosImage.image = UIImage(named: "ocros")
        bunehImage.image = UIImage(named: "buneh")
        
        titleLablel.text = NSLocalizedString("instructions_screen_title", comment: "")
        
        text1Lablel.text = NSLocalizedString("instructions_screen_text1", comment: "")
        
        text2Lablel.text = NSLocalizedString("instructions_screen_text2", comment: "")
        
        continueButton.setTitle(NSLocalizedString("instructions_screen_continue_button", comment: ""), for: .normal)
        
        backButton.frame = CGRect(x: 58, y: 32, width: 47, height: 47)
        backButton.setImage(UIImage(named: "close_button"), for: .normal)
 
        addSubview(view)
    }
}
