//
//  ActionDetailViewController.swift
//  FullCircle
//
//  Created by Sunni Tang on 6/12/20.
//  Copyright © 2020 FullCircle. All rights reserved.
//

import UIKit
import MessageUI
import MapKit
import CoreLocation

class ActionDetailViewController: UIViewController {
    
    var action: Action!
    private let padding: CGFloat = 10.0
   

    let lat = 40.6739
    let long = -73.9701

    let initialLocation = CLLocation(latitude: 40.6739, longitude: -73.9701)
    let searchRadius: Double = 2000
    
    private lazy var orgLogoView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: self.action.organization.logoString)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var orgNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .headline), size: 25)
        label.text = self.action.organization.name
        return label
    }()
    
    private lazy var activityTypeIconView: UIImageView = {
        let iconView = UIImageView()
        iconView.image = UIImage(named: self.action.iconString)
        return iconView
    }()
    
    private lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .black
        textView.font = UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .body), size: 20)
        textView.textColor = .white
        textView.text = self.action.description
        textView.isUserInteractionEnabled = false
        return textView
    }()
    
    private lazy var takeActionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Take Action", for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(takeActionButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.isHidden = true
        mapView.isUserInteractionEnabled = false
        return mapView
    }()
    
    lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.isUserInteractionEnabled = false
        button.backgroundColor = .lightGray
        button.setTitle("Dismiss", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(dismissButtonPressed), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        addSubviews()
        setupDelegates()
        getAnnotation()
        constrainSubviews()
    }
    
    @objc private func takeActionButtonPressed() {
        if action.organization.name == "Black Lives Matter" {
            showMap()
        } else if action.organization.name == "Color of Change" {
            sendEmail()
        } else {
            let alert = UIAlertController(title: "Please Contact Us For More Info", message: "\(action.organization.email)\n\(action.organization.phone)", preferredStyle: .alert)
            let action = UIAlertAction(title: "DISMISS", style: .default, handler: nil)
            alert.addAction(action)
            DispatchQueue.main.async {[weak self] in
                self?.present(alert, animated: true)
            }
        }
    }
    
    @objc private func dismissButtonPressed() {
        mapView.isHidden = true
        mapView.isUserInteractionEnabled = false
        dismissButton.isUserInteractionEnabled = false
        dismissButton.isHidden = true
        navigationController?.navigationBar.isHidden = false
        view.sendSubviewToBack(mapView)
    }
    
    private func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["localrep@government.gov"])
            mail.setMessageBody("<p>Dear local lawmaker: Please pledge your support for the new police reform bill</p>", isHTML: true)

            present(mail, animated: true)
        } else {
            print("Could not send mail")
            // show failure alert
        }
    }
    
    private func showMap() {
        mapView.isHidden = false
        mapView.isUserInteractionEnabled = true
        dismissButton.isHidden = false
        dismissButton.isUserInteractionEnabled = true
        navigationController?.navigationBar.isHidden = true
        view.bringSubviewToFront(mapView)
    }
    
    private func setupDelegates() {
        mapView.delegate = self
        mapView.userTrackingMode = .follow
       
    }
    
    private func addSubviews() {
        view.addSubview(orgLogoView)
        view.addSubview(orgNameLabel)
        view.addSubview(descriptionTextView)
        descriptionTextView.addSubview(activityTypeIconView)
        view.addSubview(takeActionButton)
        view.addSubview(mapView)
        mapView.addSubview(dismissButton)
    }
    
    private func constrainSubviews() {
        constrainOrgLogoView()
        constrainOrgNameLabel()
        constrainDescriptionTextView()
        constrainActivityTypeIconView()
        constrainTakeActionButton()
        constrainMapView()
        constrainDismissButton()
    }
    
    private func constrainOrgLogoView() {
        orgLogoView.translatesAutoresizingMaskIntoConstraints = false
        [orgLogoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
         orgLogoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
         orgLogoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding), orgLogoView.heightAnchor.constraint(equalToConstant: 150)].forEach {$0.isActive = true}
        
    }
    private func constrainOrgNameLabel() {
        orgNameLabel.translatesAutoresizingMaskIntoConstraints = false
        [orgNameLabel.topAnchor.constraint(equalTo: orgLogoView.bottomAnchor, constant: padding),
         orgNameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)].forEach {$0.isActive = true}
    }
    
    private func constrainDescriptionTextView() {
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        [descriptionTextView.topAnchor.constraint(equalTo: orgNameLabel.bottomAnchor, constant: padding),
         descriptionTextView.bottomAnchor.constraint(equalTo: takeActionButton.topAnchor, constant: -padding),
         descriptionTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding), descriptionTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)].forEach {$0.isActive = true}
    }
    
    private func constrainActivityTypeIconView() {
        activityTypeIconView.translatesAutoresizingMaskIntoConstraints = false
        [activityTypeIconView.topAnchor.constraint(equalTo: descriptionTextView.topAnchor),
         activityTypeIconView.trailingAnchor.constraint(equalTo: descriptionTextView.trailingAnchor),
         activityTypeIconView.heightAnchor.constraint(equalToConstant: 30)].forEach {$0.isActive = true}
    }
    
    private func constrainTakeActionButton() {
        takeActionButton.translatesAutoresizingMaskIntoConstraints = false
        [takeActionButton.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: padding),
         takeActionButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
         takeActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: (-4 * padding)),
         takeActionButton.heightAnchor.constraint(equalToConstant: 30),
         takeActionButton.widthAnchor.constraint(equalToConstant: 180)].forEach {$0.isActive = true}
    }
    
    private func constrainMapView() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        [mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
         mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)].forEach {$0.isActive = true}
    }
    
    private func constrainDismissButton() {
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        [dismissButton.leadingAnchor.constraint(equalTo: mapView.safeAreaLayoutGuide.leadingAnchor, constant: padding),
         dismissButton.bottomAnchor.constraint(equalTo: mapView.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
         dismissButton.heightAnchor.constraint(equalToConstant: 20),
         dismissButton.widthAnchor.constraint(equalToConstant: 80)].forEach {$0.isActive = true}
    }

}

extension ActionDetailViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result.rawValue {
        case MFMailComposeResult.cancelled.rawValue:
            print("Cancelled")
        case MFMailComposeResult.saved.rawValue:
            print("Saved")
        case MFMailComposeResult.sent.rawValue:
            print("Sent")
        case MFMailComposeResult.failed.rawValue:
            print("Error: \(String(describing: error?.localizedDescription))")
        default:
            break
        }
        controller.dismiss(animated: true, completion: nil)
    }
}
