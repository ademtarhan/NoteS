//
//  AddViewController.swift
//  NoteS
//
//  Created by Adem Tarhan on 4.07.2022.
//

import CoreData
import UIKit

protocol AddViewController: AnyObject {
    var presenter: AddPresenter? { get set }
}

class AddViewControllerImpl: UIViewController, AddViewController {
    var presenter: AddPresenter?

    @IBOutlet var textViewNoteContext: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Finished", style: .plain, target: self, action: #selector(buttonFinished))
    }

    @objc func buttonFinished(_ sender: Any) {
    }
}
