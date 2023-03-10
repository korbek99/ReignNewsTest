//
//  AuthorNewsViewController.swift
//  ReignNewsTest
//
//  Created by Jose David Bustos H on 10-03-23.
//

import UIKit

class AuthorNewsViewController: UIViewController {

    var listAuthors = [Hit]()
    var searching = false
    var searchedMenu =  [Hit]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    
    // MARK: - IBOutlets
    lazy var tableView: UITableView = {
        let table: UITableView = .init()
        table.delegate = self
        table.dataSource = self
        table.register(AuthorNewsTableViewCell.self, forCellReuseIdentifier: "AuthorNewsTableViewCell")
        table.rowHeight = 200.0
        table.separatorColor = UIColor.orange
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    // MARK: - init
    init() {
        super.init(nibName: nil, bundle: nil)
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }

    private var authorListVM: AuthorListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setupVM()
        configureSearchController()
        
    }
    
    // MARK: - Private
    // MARK: - Functions
    
    func configureSearchController(){
        
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically  = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Buscar por nombre"
        
    }
    private func setupVM() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        webServicesNews().getArticles() { articles in
            if let articles = articles {
                self.authorListVM = AuthorListViewModel(listAuthorNews: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    private func setUpTableView() {
         view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant:  35.0).isActive = true
         tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
         tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
         tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
     }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func startloading(){
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func stoploading(){
        self.dismiss(animated: false, completion: nil)
    }

}
extension AuthorNewsViewController:  UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchBarDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchedMenu.count
        }else{
            return self.authorListVM == nil ? 0 : self.authorListVM.numberOfSections
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AuthorNewsTableViewCell") as? AuthorNewsTableViewCell else { return UITableViewCell() }
        
        if searching {
            let articleVM = searchedMenu[indexPath.row]
            cell.lblName.text = searchedMenu[indexPath.row].author
            cell.lbltitle.text = searchedMenu[indexPath.row].storyTitle
        } else {
            let articleVM = self.authorListVM.articleAtIndex(indexPath.row)
            cell.lblName.text = articleVM.listAuthorNews[indexPath.row].author
            cell.lbltitle.text = articleVM.listAuthorNews[indexPath.row].storyTitle
        }
        
    
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searching {
            
        } else {
            
        }
    }
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty {
            searching = true
            searchedMenu.removeAll()
            for item in authorListVM.listAuthorNews {
                if item.author.lowercased().contains(searchText.lowercased())
                {
                    searchedMenu.append(item)
                }
            }
        }else{
            searching = false
            searchedMenu.removeAll()
            searchedMenu = authorListVM.listAuthorNews
        }
        
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        searching = false
        searchedMenu.removeAll()
        tableView.reloadData()
    }
}

