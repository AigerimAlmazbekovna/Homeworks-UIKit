//
//  ErrorViewController.swift
//  Navigation5
//
//  Created by Айгерим on 24.08.2024.
//

import UIKit

class ErrorViewController: UIViewController {

        
        private let networkService = NetworkService()
        
        private lazy var btn: UIButton = {
            let btn = UIButton()
            btn.backgroundColor = .black
            btn.setTitle("Сделать что-то", for: .normal)
            btn.layer.cornerRadius = 6
            btn.addTarget(self, action: #selector(tapBtn), for: .touchUpInside)
            btn.translatesAutoresizingMaskIntoConstraints = false
            return btn
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            makeLayout()
        }

        private func makeLayout() {
            view.addSubview(btn)
            view.backgroundColor = .green
            NSLayoutConstraint.activate([
                btn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
                btn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
                btn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                btn.heightAnchor.constraint(equalToConstant: 60)
            ])
        }
        
        @objc
        private func tapBtn() {
         // showDoCatch()
         //  showOptionalTry()
         // showNoOptionalTry()
        fetchResult(with: urlStringGlobal)
        }
        
        private func showNoOptionalTry() {
            let image = try! networkService.getPhoto(stringUrl: "https")
            print(image)
        }
        
        private func showOptionalTry() {
            guard let image = try? networkService.getPhoto(stringUrl: "") else {
                // срабатывает только в дебаг версии
                assertionFailure()
                // срабатывает при выполнении определенного условия
                let count = 10
                assert(count == 9)
                // 100%
                fatalError()
    //            print("Error")
                return
            }
            print(image)
        }
        
        private func showDoCatch() {
            do {
                let image = try networkService.getPhoto(stringUrl: "https://yandex.ru")
                print(image)
            } catch ApiError.badRequest {
                print("badRequest")
            } catch ApiError.unowned {
                print("unowned")
            } catch ApiError.notFound {
                print("notFound")
            } catch {
                print("default")
            }
        }
        
        private func handleError(with error: ApiError) {
            switch error {
                case .badRequest:
                    print("badRequest")
                case .notFound:
                    print("notFound")
                case .unAuth:
                    print("unauth")
                case .unowned:
                    print("unowned")
                case .forbidden:
                    print("forbidden")
            }
        }
        
        private func fetchResult(with text: String) {
            networkService.getNetworkRequest(stringUrl: text) { [weak self] result in
                guard let self else { return }
                switch result {
                        case .success(let image):
                            print(image)
                        case .failure(let error):
                            print("error")
                    }
                }
            }
        }

    
