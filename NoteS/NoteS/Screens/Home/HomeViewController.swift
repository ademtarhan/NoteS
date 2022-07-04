//
//  HomeViewController.swift
//  NoteS
//
//  Created by Adem Tarhan on 1.07.2022.
//

import CoreData
import UIKit

class HomeViewController: UIViewController,NSFetchedResultsControllerDelegate {
    @IBOutlet var tableView: UITableView!

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
    }

   
    @IBAction func buttonAdd(_ sender: Any) {
        print("tapped button")
        let addVC = AddViewController(nibName: "AddViewController", bundle: nil)
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

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = fetchResultsController.sections?[section].numberOfObjects
        return numberOfRows!
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let dataRow = fetchResultsController.object(at: indexPath) as! Note
        cell.labelNoteDate.text = "1221121"
        cell.labelNoteContext.text = dataRow.noteText
        return cell
    }
}
