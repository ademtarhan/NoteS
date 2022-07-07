//
//  HomeViewController.swift
//  NoteS
//
//  Created by Adem Tarhan on 1.07.2022.
//

import CoreData
import UIKit


protocol HomeViewController: AnyObject{
    var presenter: HomePresenter? {get set}
}

class HomeViewControllerImpl: UIViewController,NSFetchedResultsControllerDelegate,HomeViewController {
    @IBOutlet var tableView: UITableView!

    var presenter: HomePresenter?
    var fetchResultsController = NSFetchedResultsController<NSFetchRequestResult>()
    var persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    // ..fetch data in database
    func fetchRequest() -> NSFetchRequest<NSFetchRequestResult> {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        let sorter = NSSortDescriptor(key: "noteDate", ascending: true)
        fetchRequest.sortDescriptors = [sorter]
        return fetchRequest
    }

    func getFetchResultController() -> NSFetchedResultsController<NSFetchRequestResult> {
        
        fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest(), managedObjectContext: persistentContainer, sectionNameKeyPath: nil, cacheName: nil)
        return fetchResultsController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        let nibCell = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: "cell")
        fetchResultsController = getFetchResultController()
        fetchResultsController.delegate = self
        
        do{
            try fetchResultsController.performFetch()
        }catch{
            print(error)
            return
        }
        self.tableView.reloadData()
        
        navigationItem.title = "NoteS"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
    }

    @objc func addTapped(){
        print("tapped")
        let addVC = AddViewControllerImpl(nibName: "AddViewController", bundle: nil)
        navigationController?.pushViewController(addVC, animated: true)
    }
   
    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}

extension HomeViewControllerImpl: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = fetchResultsController.sections?[section].numberOfObjects
        return numberOfRows!
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let dataRow = fetchResultsController.object(at: indexPath) as! Note
       
        cell.labelNoteContext.text = dataRow.noteText
        return cell
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }
}
