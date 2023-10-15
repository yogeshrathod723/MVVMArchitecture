//
//  ViewController.swift
//  MVVMArchitecture
//
//  Created by yogesh rathod on 9/9/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    @IBOutlet weak var listTableView:UITableView!
    
    var ViewModel = QuestionViewModel()
    
    private var userList: [MUserList]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //            ViewModel.fetchFilms{ [weak self] in
        //                self?.userList = self?.ViewModel.userList
        //                DispatchQueue.main.async {
        //                    self?.listTableView.reloadData()
        //                }
        //            }
        
        
        ViewModel.fetchFilms{ [weak self] (userList) in
            self?.userList = userList
            DispatchQueue.main.async {
                self?.listTableView.reloadData()
            }
        }
    }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return userList?.count ?? 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
            cell.textLabel?.text = userList?[indexPath.row].login
            
            return cell
        }
    }
