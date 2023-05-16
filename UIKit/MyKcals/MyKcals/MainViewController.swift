//
//  ViewController.swift
//  MyKcals
//
//  Created by Kacper on 14/05/2023.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    
    //How to get to persistent context ref. and  Managed Object Context
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var eatingDays:[EatingDay]?
    private var products:[Product]?
    private var meals:[Meal]?
    
    @IBOutlet var TEST_btnProduct: UIButton!
    @IBAction func TEST_btnAddProduct(_ sender: UIButton) {
        print("TEST_btnProduct ")
        createProduct()
    }
    
    @IBOutlet var TEST_btnMeal: UIButton!
    @IBAction func TEST_btnAddMeal(_ sender: UIButton) {
        print("TEST_btnAddMeal")
        createMeal()
    }
    
    @IBOutlet var TEST_btnFlush: UIButton!
    @IBAction func TEST_btnFlushData(_ sender: UIButton) {
        print("TEST_btnFlush ")
        flushData()
    }
    
    override func viewDidLoad() {
        //deleteDumpData()
        fetchData()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func fetchData(){
        do {
            self.products = try context.fetch(Product.fetchRequest())
            self.meals = try context.fetch(Meal.fetchRequest())
            self.eatingDays = try context.fetch(EatingDay.fetchRequest())
        } catch {
        }
    }

    private func createProduct(){
        //Dump Data Product
        var alert : UIAlertController
        alert = UIAlertController(title: "Add",
                                      message: "Insert details to add new product!",
                                      preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Save", style: .default) { _ in
            //Validation
            if let productName = alert.textFields?[0].text?.lowercased().trimmingCharacters(in: .whitespacesAndNewlines),
               let productKcals = Int(alert.textFields?[1].text?.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) ?? "0") {
                print("Input : ", productName, " ", productKcals )
                if (self.products != nil && self.products?.filter{$0.name == productName && $0.kcalories == productKcals }.count != 0 ) {
                    print("Product : ", productName, " ", productKcals, " already exists" )
                    
                    let alert2 = UIAlertController(title: "Caption",
                                                  message: "Product already exists!",
                                                  preferredStyle: .alert)
                    let alert2Action = UIAlertAction(title: "Ok", style: .default) { _ in
                    }
                    alert2.addAction(alert2Action)
                    self.present(alert2, animated: true, completion: nil)
                    return
                }
                do{
                    let product = Product(context: self.context)
                        product.name = productName
                        product.kcalories = Int64(productKcals)
                        try self.context.save()
                        print("Product added: ", productName, " ", productKcals )
                        self.fetchData()
                }catch{
                }
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in }
        alert.addTextField { textField in
            textField.placeholder = "Please enter your new Item"
        }
        alert.addTextField{ textField in
            textField.keyboardType = .numberPad
            textField.placeholder = "Please enter kcalories amount"
        }
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)

        // 3. Show
        present(alert, animated: true, completion: nil)
    }
    
    private func createMeal(){
        //Additional View
        let mealVC =  self.storyboard!.instantiateViewController(withIdentifier: "mealCreationViewController") as! MealCreationViewController
        mealVC.loadViewIfNeeded()
        mealVC.view.backgroundColor = .systemGray
        
        
        self.present(mealVC, animated:  true, completion: nil )
    }
    
    func flushData(){
        if let products = try?  context.fetch(Product.fetchRequest()),
        let meals = try?  context.fetch(Meal.fetchRequest()),
        let eatingDays = try?  context.fetch(EatingDay.fetchRequest()){
            for object in products {
                context.delete(object)
            }
            for object in meals {
                context.delete(object)
            }
            for object in eatingDays {
                context.delete(object)
            }
        }
        do{
            try self.context.save()
            fetchData()
        } catch {
            
        }
    }
}

