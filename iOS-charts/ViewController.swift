//
//  ViewController.swift
//  iOS-charts
//
//  Created by Yasin Shamrat on 27/5/20.
//  Copyright © 2020 Yasin Shamrat. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    @IBOutlet weak var pieChart: PieChartView!
    
    @IBOutlet weak var lineChart: LineChartView!
    
    var totalDeaths: PieChartDataEntry?
    var totalRecovered: PieChartDataEntry?
    var totalActive: PieChartDataEntry?
    var pieEntries = [PieChartDataEntry]()
    var pieData = [PieChartDataEntry]()
    let lineValues : [ChartDataEntry] = [
        ChartDataEntry(x: 0.5, y: 1),
        ChartDataEntry(x: 1, y: 2),
        ChartDataEntry(x: 1.5, y: 3),
        ChartDataEntry(x: 2, y: 10),
        ChartDataEntry(x: 3, y: 5),
        ChartDataEntry(x: 4, y: 11),
        ChartDataEntry(x: 7, y: 2),
        ChartDataEntry(x: 8, y: 20)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupPie()
        updatePie()
        updateLine()
    }
    func setupLine() {
        
    }
    func updateLine() {
        let dataSet = ChartDataSet(values: lineValues)
        let data = ChartData(dataSet: dataSet)
        lineChart.data = data
    }
    func setupPie(){
        let active = 8211 - (525 + 2012)
        totalActive = PieChartDataEntry(value: Double(active))
        totalDeaths = PieChartDataEntry(value: 525)
        totalRecovered = PieChartDataEntry(value: 1150)
        totalActive!.label = "Active Cases"
        totalDeaths!.label = "Deaths"
        totalRecovered!.label = "Recovered"
        pieEntries = [totalActive!,totalDeaths!,totalRecovered!]
    }
    
    func updatePie(){
        let dataSet = PieChartDataSet(values: pieEntries, label: nil)
        let data = PieChartData(dataSet: dataSet)
        let colors = [UIColor.blue,UIColor.red,UIColor.green]
        dataSet.colors = colors
        pieChart.data = data
        pieChart.animate(yAxisDuration: 10)
    }
    
}

