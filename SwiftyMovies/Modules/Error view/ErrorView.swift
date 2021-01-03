//
//  ErrorView.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 28/12/20.
//

import UIKit

public final class ErrorView: UIViewController {
    
    private lazy var errorLabel: UILabel = {
        let label: UILabel = .init(frame: .zero)
        label.textAlignment = .center
        label.backgroundColor = .label
        label.textColor = .systemBackground
        view.addSubview(label)
        return label
    }()
    
    public var errorText: String? {
        get {
            return errorLabel.text
        }
        set {
            errorLabel.text = newValue
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        errorLabel.frame = view.bounds
    }
}
