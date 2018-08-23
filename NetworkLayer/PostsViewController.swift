//
//  PostsViewController.swift
//  NetworkLayer
//
//  Created by Bharat malhotra on 23/08/18.
//  Copyright © 2018 Bharat malhotra. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {
    var posts : [Posts]?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.getPosts()
    }
    
    func getPosts(){
        let endpoint = Endpoint(path: "/posts", httpMethod: .get)
        //Specify the class type of the api response
        NetworkManager().apiRequest(for: [Posts].self, from: endpoint) { result in
            switch result {
            case .success(let postsResult):
                guard let posts = postsResult else {
                    print("falied parsing")
                    return }
                self.posts = posts
                self.tableView.reloadData()
            case .failure(let error):
                print("the error \(error)")
            }
        }
    }
    
    func displayAlert(title: String, message: String?) {
        let alert = UIAlertController(title:title, message:message, preferredStyle:.alert)
        alert.addAction(UIAlertAction.init(title:"ok", style:.cancel, handler:nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension PostsViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let post = posts else {
            return 0
        }
        return post.count
    }
    
    fileprivate func updatePosts(_ indexPath: IndexPath, _ cell: UITableViewCell) {
        cell.textLabel?.numberOfLines = 0
        guard let post = posts else {
            cell.textLabel?.text = "No Data"
            return
        }
        let extractedExpr: String? = post[indexPath.row].title
        if let title = extractedExpr , let id = post[indexPath.row].id{
            cell.textLabel?.text = "\(title) + \(id)"
        } else {
            cell.textLabel?.text = "No Data"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        updatePosts(indexPath, cell)
        
        return cell
    }
}
