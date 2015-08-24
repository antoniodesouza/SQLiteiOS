//
//  ViewController.swift
//  SQLiteiOS
//
//  Created by bmbhh on 8/24/15.
//  Copyright (c) 2015 bmbhh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let db = SQLiteDB.sharedInstance()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //print all records
        printAllRecords()
        //example using query
        whoIsFromChina()
        //delete some records and printAllRecords again to see the result
        deleteRecord()
        printAllRecords()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //print all records
    func printAllRecords()
    {
        var result = db.query("select * from person", parameters: nil)
        println("===============================")
        for row in result
        {
            print(row["name"]!.asString())
            print(" is from ")
            println(row["country"]!.asString())
        }
    }
    //example using query
    func whoIsFromChina()
    {
        var result = db.query("select * from person where country = 'China'", parameters: nil)
        println("===============================")
        println("From China:")
        for row in result
        {
            println(row["name"]!.asString())
        }
    }
    //example using execute
    func deleteRecord()
    {
        db.execute("delete from person where country = 'US'", parameters: nil)
    }
}

