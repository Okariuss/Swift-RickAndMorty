//
//  RickAndMortyViewController.swift
//  RickAndMortyApp
//
//  Created by Okan Orkun on 1.07.2023.
//

import UIKit
import SnapKit

protocol RickAndMortyOutput {
    func changeLoading(isLoad: Bool)
    func saveDatas(values: [Result])
}

final class RickAndMortyViewController: UIViewController {
    
    private let labelTitle: UILabel = UILabel()
    private let box: UIView = UIView()
    private let indicator: UIActivityIndicatorView = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.addSubview(labelTitle)
        view.addSubview(box)
        view.addSubview(indicator)
        
        drawDesign()
        
        makeLabelTitle()
        
        makeIndicator()
        
        makeBox()
    }
    
    private func drawDesign() {
        DispatchQueue.main.async {
            self.view.backgroundColor = .white
            self.box.backgroundColor = .red
            
            self.labelTitle.text = "oO10"
            self.indicator.color = .red
        }
        indicator.startAnimating()
    }
}
extension RickAndMortyViewController : RickAndMortyOutput {
    func changeLoading(isLoad: Bool) {
        isLoad ? self.indicator.startAnimating() : self.indicator.stopAnimating()
    }
    
    func saveDatas(values: [Result]) {
        <#code#>
    }
    
    
}
extension RickAndMortyViewController {
    private func makeBox() {
        box.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(10)
            make.bottom.equalToSuperview()
            make.left.right.equalTo(labelTitle)
        }
    }
    
    private func makeIndicator() {
        indicator.snp.makeConstraints { make in
            make.height.equalTo(labelTitle)
            make.right.equalTo(labelTitle).offset(-5)
            make.top.equalTo(labelTitle)
        }
    }
    
    private func makeLabelTitle() {
        labelTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.greaterThanOrEqualTo(10)
        }
    }
}
