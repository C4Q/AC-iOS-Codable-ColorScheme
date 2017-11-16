//
//  ViewController.swift
//  CodableReview
//
//  Created by C4Q  on 11/16/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var schemeColors = [Color]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        self.tableView.dataSource = self
        for color in schemeColors {
            print(color.name.value)
        }
    }

    func loadData() {
        guard let path = Bundle.main.path(forResource: "colorinfo", ofType: "json") else {
            return
        }
        let myURL = URL(fileURLWithPath: path)
        guard let data = try? Data(contentsOf: myURL) else {return}
        let myDecoder = JSONDecoder()
        do {
            let myScheme = try myDecoder.decode(ColorScheme.self, from: data)
            self.schemeColors = myScheme.colors
        }
        catch {
            print(error)
        }
    }
    
    //MARK: - Table View Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.schemeColors.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let color = self.schemeColors[indexPath.row]
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Color Cell", for: indexPath)
        let red = CGFloat(color.rgb.fraction.r)
        let green = CGFloat(color.rgb.fraction.g)
        let blue = CGFloat(color.rgb.fraction.b)
        cell.backgroundColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1.0)
        cell.textLabel?.text = ""
        cell.detailTextLabel?.text = ""
        return cell
    }

}

