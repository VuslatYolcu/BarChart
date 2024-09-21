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
        
        barChart.zoom(scaleX: 2, scaleY: 1, x: 0, y: 0)
        barChart.legend.enabled = false
        barChart.chartDescription.enabled = false
        barChart.gridBackgroundColor = .clear
        barChart.dragEnabled = true
        barChart.scaleXEnabled = false
        barChart.scaleYEnabled = false
        barChart.doubleTapToZoomEnabled = false
        barChart.pinchZoomEnabled = false
        barChart.drawGridBackgroundEnabled = false
        barChart.chartDescription.text = ""
        
        // x axis
        let xAxis = barChart.xAxis
        xAxis.enabled = true
        xAxis.drawAxisLineEnabled = false
        xAxis.drawGridLinesEnabled = false
        xAxis.labelTextColor = .white
        xAxis.labelPosition = .bottom
        xAxis.axisMaximum = -0.45
        xAxis.granularityEnabled = true
        xAxis.granularity = 1
        
        // right axis
        let rightAxis = barChart.rightAxis
        rightAxis.enabled = false
        rightAxis.drawLabelsEnabled = false
        rightAxis.spaceBottom = 0.0
        
        // left axis
        let leftAxis = barChart.leftAxis
        leftAxis.enabled = true
        leftAxis.labelTextColor = .white
        leftAxis.drawGridLinesEnabled = true
        leftAxis.spaceBottom = 0.0
        leftAxis.axisMinimum = 0
        
        return barChart
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createChart()
    }
    
    private func createChart() {
        // Add the barChart to the view
        view.addSubview(barChart)
        barChart.center = view.center
        barChart.delegate = self
        
        // Supply data to the chart
        supplyData()
        barChart.moveViewToAnimated(xValue: 12, yValue: 0, axis: .left, duration: 3)
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
        barChart.barData?.setDrawValues(true)
        barChart.xAxis.axisMaximum = data.xMax + 0.45
    }
}

extension ViewController: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry.y)
    }
}
