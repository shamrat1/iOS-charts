//
//  ViewController.swift
//  iOS-charts
//
//  Created by Yasin Shamrat on 27/5/20.
//  Copyright © 2020 Yasin Shamrat. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController,ChartViewDelegate {
    
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
        ChartDataEntry(x: 8, y: 20),
        ChartDataEntry(x: 10.5, y: 1),
        ChartDataEntry(x: 15, y: 2),
        ChartDataEntry(x: 17.5, y: 3),
        ChartDataEntry(x: 20, y: 10),
        ChartDataEntry(x: 23, y: 5),
        ChartDataEntry(x: 34, y: 11),
        ChartDataEntry(x: 37, y: 2),
        ChartDataEntry(x: 38, y: 20),
        ChartDataEntry(x: 40.5, y: 1),
        ChartDataEntry(x: 41, y: 2),
        ChartDataEntry(x: 41.5, y: 3),
        ChartDataEntry(x: 42, y: 10),
        ChartDataEntry(x: 53, y: 5),
        ChartDataEntry(x: 54, y: 11),
        ChartDataEntry(x: 70, y: 2),
        ChartDataEntry(x: 80, y: 20)
    ]
    
    let lineValues2 : [ChartDataEntry] = [
        ChartDataEntry(x: 1, y: 0.1),
        ChartDataEntry(x: 2, y: 0.2),
        ChartDataEntry(x: 3, y: 0.3),
        ChartDataEntry(x: 4, y: 1),
        ChartDataEntry(x: 5, y: 0.5),
        ChartDataEntry(x: 6, y: 1.10),
        ChartDataEntry(x: 7, y: 12),
        ChartDataEntry(x: 8, y: 2),
        ChartDataEntry(x: 10.5, y: 10),
        ChartDataEntry(x: 15, y: 5),
        ChartDataEntry(x: 17.5, y: 4),
        ChartDataEntry(x: 20, y: 7),
        ChartDataEntry(x: 23, y: 6),
        ChartDataEntry(x: 34, y: 14),
        ChartDataEntry(x: 37, y: 20),
        ChartDataEntry(x: 38, y: 19),
        ChartDataEntry(x: 40.5, y: 14),
        ChartDataEntry(x: 41, y: 15),
        ChartDataEntry(x: 41.5, y: 16),
        ChartDataEntry(x: 42, y: 20),
        ChartDataEntry(x: 53, y: 20),
        ChartDataEntry(x: 54, y: 20),
        ChartDataEntry(x: 70, y: 20),
        ChartDataEntry(x: 80, y: 20)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupPie()
        updatePie()
        setupLine()
        updateLine()
        
    }
    func setupLine() {
        
        lineChart.backgroundColor = UIColor(named: "oceanicBlue")!
        lineChart.xAxis.labelPosition = .bottom
        lineChart.xAxis.labelTextColor = .white
        
        lineChart.xAxis.labelFont = .boldSystemFont(ofSize: 12)
        lineChart.leftAxis.labelTextColor = .white
        lineChart.leftAxis.labelFont = .boldSystemFont(ofSize: 12)
//        lineChart.leftAxis.labelPosition = .
        lineChart.rightAxis.enabled = false
        
        lineChart.animate(xAxisDuration: 2.5)
    }
    func updateLine() {
        let dataSet = LineChartDataSet(values: lineValues, label: nil)
        dataSet.label = "Evolution"
        dataSet.drawCirclesEnabled = false
        dataSet.mode = .cubicBezier
        dataSet.lineWidth = 2
        dataSet.setColor(.white)
        dataSet.fill = Fill(color: .white)
        dataSet.fillAlpha = 0.5
        dataSet.drawFilledEnabled = true
        dataSet.drawHorizontalHighlightIndicatorEnabled = false
        dataSet.highlightColor = .red
        
        let dataSet2 = LineChartDataSet(values: lineValues2, label: nil)
        dataSet2.drawCirclesEnabled = false
        dataSet2.mode = .cubicBezier
        dataSet2.lineWidth = 2
        dataSet2.setColor(.purple)
        dataSet2.fill = Fill(color: .purple)
        dataSet2.fillAlpha = 0.3
        dataSet2.drawFilledEnabled = true
        dataSet2.drawHorizontalHighlightIndicatorEnabled = false
        dataSet2.highlightColor = .red
        
        let data = LineChartData(dataSets: [dataSet,dataSet2])
        data.setDrawValues(false)
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
        pieChart.animate(yAxisDuration: 2.5)
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
}

