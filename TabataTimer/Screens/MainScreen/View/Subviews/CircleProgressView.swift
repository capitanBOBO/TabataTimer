//
//  CircleProgressView.swift
//  TabataTimer
//
//  Created by Иван Савин on 04.05.2020.
//  Copyright © 2020 Иван Савин. All rights reserved.
//

import UIKit

class ProgressCanvasView : UIView {
    
    var progress: CGFloat = 0 {
        willSet {
            let degree = newValue*360
            endAngle = degree.radian()
            setNeedsDisplay()
        }
    }
    
    private var endAngle : CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        transform = CGAffineTransform(rotationAngle: (.pi*3)/2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawBackgroundCircle()
        drawProgressLine()
       }
    
    private func drawProgressLine() {
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        let radius = bounds.width/2 - 20
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: self.endAngle, clockwise: true)
        path.lineWidth = 12
        path.lineCapStyle = .round
        UIColor.circleProgressGreen.setStroke()
        path.stroke()
    }
    
    private func drawBackgroundCircle() {
        let path = UIBezierPath(ovalIn: .init(x: 20, y: 20, width: bounds.width-40, height: bounds.height-40))
        path.lineWidth = 12
        UIColor.circleProgressGreenWithAlpha.setStroke()
        path.stroke()
    }
}

class CircleProgressView : UIView {
    
    var progress: CGFloat = 0 {
        willSet {
            canvasView.progress = newValue
        }
    }
    
    lazy var canvasView: ProgressCanvasView = {
        let v = ProgressCanvasView()
        return v
    }()
    
    lazy var timerLabel: UILabel = {
        let v = UILabel()
        v.textAlignment = .center
        v.textColor = .label
        v.font = .systemFont(ofSize: 60, weight: .bold)
        v.text = "0.0"
        return v
    }()
    
    lazy var stateLabel: UILabel = {
        let v = UILabel()
        v.textAlignment = .center
        v.textColor = .secondaryLabel
        v.font = .systemFont(ofSize: 22, weight: .semibold)
        v.text = "Rest"
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customInit() {
        backgroundColor = .clear
        let containerView = UIView()
        containerView.backgroundColor = .clear
        containerView.addSubviews(timerLabel, stateLabel)
        addSubviews(canvasView, containerView)
        canvasView.fillInSuperview()
        containerView.setCenterAnchor()
        timerLabel.setAnchors(top: containerView.topAnchor, leading: containerView.leadingAnchor, trailing: containerView.trailingAnchor)
        stateLabel.setAnchors(top: timerLabel.bottomAnchor, topPadding: 10, bottom: containerView.bottomAnchor, leading: containerView.leadingAnchor, trailing: containerView.trailingAnchor)
    }
    
}

//MARK: Private

extension CircleProgressView {
    
}
