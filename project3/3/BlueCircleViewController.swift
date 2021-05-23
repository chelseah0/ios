//
//  BlueCircleViewController.swift
//  3
//
//  Created by Lucas Ho on 07/03/2021.
//

import UIKit

class BlueCircleViewController: UIViewController {
    
    weak var delegate: NameDelegate?
    var titleString: String?

    var button: UIButton!
    var textField: UITextField!
    
    let placeHolderText: String = ""
    /*
    weak var delegate: NameDelegate?
    var titleString: String?

    var button: UIButton!
    var textField: UITextField!
    
    let placeHolderText: String
    
    init(placeHolder: String) {
        self.placeHolderText = placeHolder
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Blue Circle Arena"
    }
    
}
