//
//  ViewController.swift
//  BarChartExample
//
//  Created by Vuslat Yolcu on 21.09.2024.
//

import UIKit
import DGCharts

class ViewController: UIViewController {

    private lazy var barChart: BarChartView = {
        let barChart = BarChartView(frame: CGRect(x: 0, y: 0, width: Int(view.frame.size.width), height: Int(view.frame.size.width)))
        barChart.translatesAutoresizingMaskIntoConstraints = false
        return barChart
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createChart()
    }
    
    private func createChart() {
        // Create bar chart
        
        
        // Configure the axis
        
        // Configure legend
        
        
        
        // Supply data
        supplyData()
        
        view.addSubview(barChart)
        barChart.center = view.center
    }

    private func supplyData() {
        var entries = [BarChartDataEntry]()
        for i in 0 ..< 10 {
            let chartEntry = BarChartDataEntry(x: Double(i),
                                               y: Double.random(in: 0...30))
            entries.append(chartEntry)
        }
        
        let set = BarChartDataSet(entries: entries, label: "cost")
        let data = BarChartData(dataSet: set)
        
        barChart.data = data
    }

}

