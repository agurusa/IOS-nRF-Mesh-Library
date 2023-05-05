//
//  GenericUserPropertyServerCell.swift
//  nRF Mesh
//
//  Created by Aarthi Gurusami on 5/2/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit


class GenericUserPropertyServerCell: BaseModelControlCell<GenericUserPropertyServerDelegate> {
    @IBOutlet weak var icon: UIImageView!
    
    var progress: UIView!
    
    override func setup(_ model: GenericUserPropertyServerDelegate?) {
        icon.tintColor = .nordicFall
        
    }
    
}
