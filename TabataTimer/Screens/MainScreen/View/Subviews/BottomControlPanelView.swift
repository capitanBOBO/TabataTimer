//
//  BottomControlPanelView.swift
//  TabataTimer
//
//  Created by Иван Савин on 05.05.2020.
//  Copyright © 2020 Иван Савин. All rights reserved.
//

import UIKit

class BottomControlPanelView : UIView {
    
    lazy var idleStateContainerView = UIView()
    
    lazy var workoutStateContainerView: UIView = {
        let v = UIView()
        v.isHidden = true
        v.alpha = 0
        return v
    }()
    
    lazy var startTimerButton: UIButton = UIButton.defaultButton(title: "Start")
    
    lazy var editTimerButton: UIButton = UIButton.defaultButton(image: UIImage(systemName: "gear"))
    
    lazy var pauseTimerButton: UIButton = UIButton.defaultButton(title: "Pause")
    
    lazy var stopTimerButton: UIButton = UIButton.defaultButton(title: "Stop")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func customInit() {
        backgroundColor = .clear
        idleStateContainerView.addSubviews(startTimerButton, editTimerButton)
        workoutStateContainerView.addSubviews(pauseTimerButton, stopTimerButton)
        addSubviews(idleStateContainerView, workoutStateContainerView)
        idleStateContainerView.setAnchors(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor)
        workoutStateContainerView.setAnchors(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor)
        editTimerButton.setSizeAnchor(size: .init(width: 45, height: 45))
        editTimerButton.setAnchors(top: idleStateContainerView.topAnchor, bottom: idleStateContainerView.bottomAnchor, trailing: idleStateContainerView.trailingAnchor)
        startTimerButton.setAnchors(top: idleStateContainerView.topAnchor, bottom: idleStateContainerView.bottomAnchor, leading: idleStateContainerView.leadingAnchor, trailing: editTimerButton.leadingAnchor, trailingPadding: 10)
        pauseTimerButton.setAnchors(top: workoutStateContainerView.topAnchor, bottom: workoutStateContainerView.bottomAnchor, leading: workoutStateContainerView.leadingAnchor, trailing: stopTimerButton.leadingAnchor, trailingPadding: 10, widthAnchor: stopTimerButton.widthAnchor, heightConstant: 45)
        stopTimerButton.setAnchors(top: workoutStateContainerView.topAnchor, bottom: workoutStateContainerView.bottomAnchor, trailing: workoutStateContainerView.trailingAnchor, widthAnchor: pauseTimerButton.widthAnchor, heightConstant: 45)
    }
    
    func toggleState() {
        idleStateContainerView.isHidden = false
        workoutStateContainerView.isHidden = false
        UIView.animateKeyframes(withDuration: 0.25, delay: 0, options: .calculationModePaced, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                self.workoutStateContainerView.alpha = self.workoutStateContainerView.alpha == 1 ? 0 : 1
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                self.idleStateContainerView.alpha = self.idleStateContainerView.alpha == 1 ? 0 : 1
            }
        }) { (_) in
            self.idleStateContainerView.isHidden = self.idleStateContainerView.alpha == 0
            self.workoutStateContainerView.isHidden = self.workoutStateContainerView.alpha == 0
        }
    }
}
