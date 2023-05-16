//
//  productSearchViewController.swift
//  MyKcals
//
//  Created by Kacper on 16/05/2023.
//

import UIKit

class ProductSearchViewController: UIViewController  {

    private var products:[Product]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Add search bar onChange listener
        sbSearch.delegate = self
        
        do {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            self.products = try context.fetch(Product.fetchRequest())
        } catch {
            
        }
    }
    
    @IBOutlet weak var sbSearch: UISearchBar!
    @IBOutlet weak var tbvFoundProducts: UITableView!
    
    @IBAction func CancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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

extension ProductSearchViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText.isEmpty) { return }
        
        //Update an UI
        let filtered = self.products?.filter{$0.name.contains(searchText)}
       
    }
}
