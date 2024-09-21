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
        barChart.legend.enabled = false
        
        barChart.xAxis.enabled = true
        barChart.xAxis.drawAxisLineEnabled = true
        barChart.xAxis.drawGridLinesEnabled = false
        barChart.xAxis.labelTextColor = .white
        barChart.xAxis.labelPosition = .bottom
        
        barChart.leftAxis.enabled = true
        barChart.leftAxis.labelTextColor = .white
        
        barChart.rightAxis.enabled = false
        
        barChart.legend.enabled = false
        barChart.chartDescription.enabled = false
        barChart.gridBackgroundColor = .clear
    
        return barChart
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createChart()
    }
    
    private func createChart() {
        // Create bar chart
        view.addSubview(barChart)
        barChart.center = view.center
        barChart.delegate = self
        // Configure the axis
       
        
        // Configure legend
        
        
        // Supply data
        supplyData()
    }

    private func supplyData() {
        var entries = [BarChartDataEntry]()
        for i in 0 ..< 13 {
            let chartEntry = BarChartDataEntry(x: Double(i),
                                               y: Double.random(in: 0...30))
            entries.append(chartEntry)
        }
        
        let set = BarChartDataSet(entries: entries, label: "Cost")
        set.colors = ChartColorTemplates.colorful()
        set.colors = [
            NSUIColor(cgColor: UIColor.systemBlue.cgColor)
        ]
        let data = BarChartData(dataSet: set)
        
        barChart.data = data
    }

}

extension ViewController: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry.y)
    }
}
