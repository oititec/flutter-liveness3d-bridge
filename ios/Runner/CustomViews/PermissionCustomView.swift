//
//  PermissionCustomView.swift
//  alt_liveness3d
//
//  Created by altbank on 08/01/23.
//

import Foundation
import FaceCaptcha

class PermissionCustomView: UIView, CustomCameraPermissionView {
    var checkPermissionButton: UIButton!
    
    var openSettingsButton: UIButton!
    
    var closeButton: UIButton!
    
    func showBottomSheet(visibility: FaceCaptcha.Visibility) {
        
    
    }
    
    // MARK: - Outlets

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    
    @IBOutlet weak var deviceImage: UIImageView!
    
    @IBOutlet weak var titleLablel: UILabel!
    @IBOutlet weak var textLablel: UILabel!

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
        
       
        
        continueButton.setTitle(NSLocalizedString("bt_check", comment: ""), for: .normal)
        
        backButton.frame = CGRect(x: 58, y: 32, width: 47, height: 47)
        backButton.setImage(UIImage(named: "close_button"), for: .normal)
            

        
        addSubview(view)
    }
}
