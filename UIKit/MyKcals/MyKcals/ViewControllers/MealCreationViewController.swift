//
//  MealCreationViewController.swift
//  MyKcals
//
//  Created by Kacper on 16/05/2023.
//

import UIKit

class MealCreationViewController: UIViewController {

    @IBOutlet private weak var tfName: UITextField!
    @IBOutlet private weak var btnAddProduct: UIButton!
    @IBOutlet private weak var btnCancel: UIButton!
    @IBOutlet private weak var btnSave: UIButton!
    @IBOutlet private weak var tbvProductList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //self.isModalInPresentation = true
    }
    
    @IBAction func btnSaveTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    @IBAction func btnCancellTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func addProductButtonTapped(_ sender: UIButton) {
        let productSearchVC =  self.storyboard!.instantiateViewController(withIdentifier: "productSearchViewController") as! ProductSearchViewController
        productSearchVC.loadViewIfNeeded()
        productSearchVC.view.backgroundColor = .systemGray
        
        
        self.present(productSearchVC, animated:  true, completion: nil )
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
