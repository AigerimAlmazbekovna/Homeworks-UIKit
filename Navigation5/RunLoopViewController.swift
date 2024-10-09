//
//  RunLoopViewController.swift
//  Navigation5
//
//  Created by Айгерим on 22.08.2024.
//

import UIKit

class RunLoopViewController: UIViewController {
        
        private var timer: Timer?
        
        private var counter = 10
        
        private lazy var timerLabel: UILabel = {
            let label = UILabel()
            label.text = "10"
            label.backgroundColor = .gray
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private lazy var btn: UIButton = {
            let btn = UIButton()
            btn.setTitle("Start timer", for: .normal)
            btn.layer.cornerRadius = 6
            btn.backgroundColor = .black
            btn.addTarget(self, action: #selector(tapOnBtnAction), for: .touchUpInside)
            btn.translatesAutoresizingMaskIntoConstraints = false
            return btn
        }()

        override func viewDidLoad() {
            super.viewDidLoad()
            makeLayout()
    //        createTimer()
        }
        
        private func makeLayout() {
            view.backgroundColor = .white
            view.addSubview(btn)
            view.addSubview(timerLabel)
            
            NSLayoutConstraint.activate([
                btn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                btn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                btn.heightAnchor.constraint(equalToConstant: 60),
                btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                btn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
                
                timerLabel.bottomAnchor.constraint(equalTo: btn.topAnchor, constant: -20),
                timerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                timerLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
                timerLabel.heightAnchor.constraint(equalToConstant: 60)
            ])
        }

    //    private func createTimer() {
    //        let timer = Timer.scheduledTimer(
    //            timeInterval: 1.0,
    //            target: self,
    //            selector: #selector(timerAction),
    //            userInfo: nil,
    //            repeats: true
    //        )
    //    }
        
    //    @objc
    //    private func timerAction() {
    //        print("timerAction")
    //    }
        
        private func createTimerBtn() {
            timer = Timer.scheduledTimer(
                withTimeInterval: 1.0,
                repeats: true) { [weak self] timer in
                    guard let self else { return }
                    counter -= 1
                    
                    timerLabel.text = counter <= 0 ? "Время истекло" : "\(counter)"
                    if counter <= 0 {
                        self.timer?.invalidate()
                        self.timer = nil
                        print("Timer удален")
                    }
                }
    //        timer?.tolerance = 0.1
        }
        
        private func makeGlobalRunLoopTimer() {
            timer = Timer.scheduledTimer(
                withTimeInterval: 1.0,
                repeats: true) { [weak self] timer in
                    guard let self else { return }
                    counter -= 1
                    timerLabel.text = counter <= 0 ? "Время истекло" : "\(counter)"
                    timer.tolerance = 0.7
                    if counter <= 0 {
                        self.timer?.invalidate()
                        self.timer = nil
                    }
                }
            guard let timer else { return }
            RunLoop.current.add(timer, forMode: .common)
            RunLoop.current.run()
        }
        
        @objc
        private func tapOnBtnAction() {
    //        createTimerBtn()
            makeGlobalRunLoopTimer()
        }
    }
