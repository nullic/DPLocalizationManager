//
//  ViewController.swift
//  LocalizationDemoSwift
//
//  Created by Dmitriy Petrusevich on 24/05/2017.
//  Copyright © 2017 Dmitriy Petrusevich. All rights reserved.
//

import UIKit
import DPLocalization

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel?
    @IBOutlet weak var startup: UILabel?
    @IBOutlet weak var langSelector: UISegmentedControl?
    @IBOutlet weak var fileSelector: UISegmentedControl?
    @IBOutlet weak var imageView: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView?.autolocalizationImageName = "image"

        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .none

        let dateValue = DPFormattedValue(value: NSDate(), formatter: formatter)!

        self.startup?.text = DPLocalizedString("TITLE", nil)
        self.label?.autolocalizationKey = "LABEL_TEXT"
        self.label?.updateAutolocalizationArguments(["Hello", 12.34, dateValue])
        self.autolocalizationKey = "TITLE"

        print("Preffered language:", DPLocalizationManager.preferredLanguage())
        print("Selected language:", dp_get_current_language())
        print("Supported language:", DPLocalizationManager.supportedLanguages())

        self.updateLangSelector()
        NotificationCenter.default.addObserver(forName: NSNotification.Name.DPLanguageDidChange, object: nil, queue: OperationQueue.main) { (_ :Notification) in
            self.updateLangSelector()
        }
    }

    @IBAction func languageChangeAction(_ sender: Any?) {
        switch (self.langSelector?.selectedSegmentIndex ?? 0) {
        case 0:
            dp_set_current_language("en")
        case 1:
            dp_set_current_language("ru")
        case 2:
            dp_set_current_language("de")
        default:
            dp_set_current_language(nil)
        }
    }

    @IBAction func localizationFileChangeName(_ sender: Any?) {
        switch (self.fileSelector?.selectedSegmentIndex ?? 0) {
        case 0:
            DPLocalizationManager.current().defaultStringTableName = "Localizable"
        case 1:
            DPLocalizationManager.current().defaultStringTableName = "Localizable1"
        default:
            DPLocalizationManager.current().defaultStringTableName = nil
        }
    }

    func updateLangSelector() {
        if dp_get_current_language() == "en" {
            self.langSelector?.selectedSegmentIndex = 0;
        }
        else if dp_get_current_language() == "ru" {
            self.langSelector?.selectedSegmentIndex = 1;
        }
        else if dp_get_current_language() == "de" {
            self.langSelector?.selectedSegmentIndex = 2;
        }
        else if dp_get_current_language() == nil {
            self.langSelector?.selectedSegmentIndex = 3;
        }
    }
}

