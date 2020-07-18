import UIKit
import LightweightCharts

class CustomFontFamilyViewController: UIViewController {

    private var chart: LightweightCharts!
    private var series: AreaSeries!
    private let fonts = ["Helvetica", "Trebuchet MS", "Serif"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        
        setupUI()
        setupData()
    }
    
    private func setupUI() {
        let segmentedControl = UISegmentedControl(items: fonts)
        segmentedControl.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                segmentedControl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                segmentedControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        } else {
            NSLayoutConstraint.activate([
                segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                segmentedControl.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
        
        let options = ChartOptions(
            layout: LayoutOptions(fontFamily: fonts[0]),
            priceScale: PriceScaleOptions(borderColor: "rgba(197, 203, 206, 1)"),
            timeScale: TimeScaleOptions(borderColor: "rgba(197, 203, 206, 1)")
        )
        let chart = LightweightCharts(options: options)
        view.addSubview(chart)
        chart.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                chart.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                chart.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                chart.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                chart.bottomAnchor.constraint(equalTo: segmentedControl.topAnchor, constant: -16)
            ])
        } else {
            NSLayoutConstraint.activate([
                chart.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                chart.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                chart.topAnchor.constraint(equalTo: view.topAnchor),
                chart.bottomAnchor.constraint(equalTo: segmentedControl.topAnchor, constant: -16)
            ])
        }
        self.chart = chart
        
        segmentedControl.selectedSegmentIndex = 0
    }
    
    private func setupData() {
        let options = AreaSeriesOptions(
            topColor: "rgba(33, 150, 243, 0.56)",
            bottomColor: "rgba(33, 150, 243, 0.04)",
            lineColor: "rgba(33, 150, 243, 1)",
            lineWidth: .two
        )
        let series = chart.addAreaSeries(options: options)
        let data = [
            LineData(time: .string("2018-10-19"), value: 46.33),
            LineData(time: .string("2018-10-22"), value: 45.97),
            LineData(time: .string("2018-10-23"), value: 46.36),
            LineData(time: .string("2018-10-24"), value: 46.73),
            LineData(time: .string("2018-10-25"), value: 46.51),
            LineData(time: .string("2018-10-26"), value: 45.92),
            LineData(time: .string("2018-10-29"), value: 46.46),
            LineData(time: .string("2018-10-30"), value: 47.63),
            LineData(time: .string("2018-10-31"), value: 47.88),
            LineData(time: .string("2018-11-01"), value: 47.74),
            LineData(time: .string("2018-11-02"), value: 48.00),
            LineData(time: .string("2018-11-05"), value: 48.69),
            LineData(time: .string("2018-11-06"), value: 49.11),
            LineData(time: .string("2018-11-07"), value: 49.37),
            LineData(time: .string("2018-11-08"), value: 49.33),
            LineData(time: .string("2018-11-09"), value: 49.68),
            LineData(time: .string("2018-11-12"), value: 49.87),
            LineData(time: .string("2018-11-13"), value: 49.86),
            LineData(time: .string("2018-11-14"), value: 49.76),
            LineData(time: .string("2018-11-15"), value: 49.74),
            LineData(time: .string("2018-11-16"), value: 50.17),
            LineData(time: .string("2018-11-19"), value: 50.51),
            LineData(time: .string("2018-11-20"), value: 49.38),
            LineData(time: .string("2018-11-21"), value: 48.73),
            LineData(time: .string("2018-11-23"), value: 49.02),
            LineData(time: .string("2018-11-26"), value: 48.87),
            LineData(time: .string("2018-11-27"), value: 49.37),
            LineData(time: .string("2018-11-28"), value: 49.71),
            LineData(time: .string("2018-11-29"), value: 48.98),
            LineData(time: .string("2018-11-30"), value: 50.40),
            LineData(time: .string("2018-12-03"), value: 49.69),
            LineData(time: .string("2018-12-04"), value: 49.58),
            LineData(time: .string("2018-12-06"), value: 49.38),
            LineData(time: .string("2018-12-07"), value: 49.09),
            LineData(time: .string("2018-12-10"), value: 49.24),
            LineData(time: .string("2018-12-11"), value: 49.54),
            LineData(time: .string("2018-12-12"), value: 49.22),
            LineData(time: .string("2018-12-13"), value: 49.47),
            LineData(time: .string("2018-12-14"), value: 49.34),
            LineData(time: .string("2018-12-17"), value: 48.33),
            LineData(time: .string("2018-12-18"), value: 48.32),
            LineData(time: .string("2018-12-19"), value: 47.90),
            LineData(time: .string("2018-12-20"), value: 47.54),
            LineData(time: .string("2018-12-21"), value: 47.57),
            LineData(time: .string("2018-12-24"), value: 45.96),
            LineData(time: .string("2018-12-26"), value: 46.94),
            LineData(time: .string("2018-12-27"), value: 47.53),
            LineData(time: .string("2018-12-28"), value: 47.20),
            LineData(time: .string("2018-12-31"), value: 47.35),
            LineData(time: .string("2019-01-02"), value: 46.93),
            LineData(time: .string("2019-01-03"), value: 46.64),
            LineData(time: .string("2019-01-04"), value: 47.57),
            LineData(time: .string("2019-01-07"), value: 46.95),
            LineData(time: .string("2019-01-08"), value: 47.48),
            LineData(time: .string("2019-01-09"), value: 46.57),
            LineData(time: .string("2019-01-10"), value: 47.07),
            LineData(time: .string("2019-01-11"), value: 47.34),
            LineData(time: .string("2019-01-14"), value: 47.15),
            LineData(time: .string("2019-01-15"), value: 47.57),
            LineData(time: .string("2019-01-16"), value: 46.92),
            LineData(time: .string("2019-01-17"), value: 47.06),
            LineData(time: .string("2019-01-18"), value: 47.61),
            LineData(time: .string("2019-01-22"), value: 47.72),
            LineData(time: .string("2019-01-23"), value: 48.27),
            LineData(time: .string("2019-01-24"), value: 47.69),
            LineData(time: .string("2019-01-25"), value: 47.37),
            LineData(time: .string("2019-01-28"), value: 47.17),
            LineData(time: .string("2019-01-29"), value: 47.40),
            LineData(time: .string("2019-01-30"), value: 47.86),
            LineData(time: .string("2019-01-31"), value: 48.13),
            LineData(time: .string("2019-02-01"), value: 48.70),
            LineData(time: .string("2019-02-04"), value: 49.25),
            LineData(time: .string("2019-02-05"), value: 49.26),
            LineData(time: .string("2019-02-06"), value: 49.26),
            LineData(time: .string("2019-02-07"), value: 49.42),
            LineData(time: .string("2019-02-08"), value: 49.50),
            LineData(time: .string("2019-02-11"), value: 49.61),
            LineData(time: .string("2019-02-12"), value: 49.66),
            LineData(time: .string("2019-02-13"), value: 49.79),
            LineData(time: .string("2019-02-14"), value: 45.59),
            LineData(time: .string("2019-02-15"), value: 45.24),
            LineData(time: .string("2019-02-19"), value: 44.83),
            LineData(time: .string("2019-02-20"), value: 45.10),
            LineData(time: .string("2019-02-21"), value: 45.86),
            LineData(time: .string("2019-02-22"), value: 45.28),
            LineData(time: .string("2019-02-25"), value: 44.94),
            LineData(time: .string("2019-02-26"), value: 44.69),
            LineData(time: .string("2019-02-27"), value: 44.94),
            LineData(time: .string("2019-02-28"), value: 45.34),
            LineData(time: .string("2019-03-01"), value: 45.38),
            LineData(time: .string("2019-03-04"), value: 45.65),
            LineData(time: .string("2019-03-05"), value: 45.60),
            LineData(time: .string("2019-03-06"), value: 45.45),
            LineData(time: .string("2019-03-07"), value: 45.28),
            LineData(time: .string("2019-03-08"), value: 44.84),
            LineData(time: .string("2019-03-11"), value: 46.18),
            LineData(time: .string("2019-03-12"), value: 46.05),
            LineData(time: .string("2019-03-13"), value: 46.22),
            LineData(time: .string("2019-03-14"), value: 45.70),
            LineData(time: .string("2019-03-15"), value: 45.30),
            LineData(time: .string("2019-03-18"), value: 45.41),
            LineData(time: .string("2019-03-19"), value: 45.56),
            LineData(time: .string("2019-03-20"), value: 45.53),
            LineData(time: .string("2019-03-21"), value: 45.51),
            LineData(time: .string("2019-03-22"), value: 45.93),
            LineData(time: .string("2019-03-25"), value: 46.03),
            LineData(time: .string("2019-03-26"), value: 46.64),
            LineData(time: .string("2019-03-27"), value: 46.61),
            LineData(time: .string("2019-03-28"), value: 46.58),
            LineData(time: .string("2019-03-29"), value: 46.86),
            LineData(time: .string("2019-04-01"), value: 46.72),
            LineData(time: .string("2019-04-02"), value: 46.57),
            LineData(time: .string("2019-04-03"), value: 46.18),
            LineData(time: .string("2019-04-04"), value: 46.48),
            LineData(time: .string("2019-04-05"), value: 46.47),
            LineData(time: .string("2019-04-08"), value: 46.55),
            LineData(time: .string("2019-04-09"), value: 46.67),
            LineData(time: .string("2019-04-10"), value: 46.64),
            LineData(time: .string("2019-04-11"), value: 46.71),
            LineData(time: .string("2019-04-12"), value: 46.74),
            LineData(time: .string("2019-04-15"), value: 47.00),
            LineData(time: .string("2019-04-16"), value: 46.95),
            LineData(time: .string("2019-04-17"), value: 47.28),
            LineData(time: .string("2019-04-18"), value: 47.48),
            LineData(time: .string("2019-04-22"), value: 47.40),
            LineData(time: .string("2019-04-23"), value: 48.21),
            LineData(time: .string("2019-04-24"), value: 47.98),
            LineData(time: .string("2019-04-25"), value: 47.84),
            LineData(time: .string("2019-04-26"), value: 48.26),
            LineData(time: .string("2019-04-29"), value: 48.42),
            LineData(time: .string("2019-04-30"), value: 49.06),
            LineData(time: .string("2019-05-01"), value: 48.59),
            LineData(time: .string("2019-05-02"), value: 48.39),
            LineData(time: .string("2019-05-03"), value: 48.72),
            LineData(time: .string("2019-05-06"), value: 48.47),
            LineData(time: .string("2019-05-07"), value: 48.00),
            LineData(time: .string("2019-05-08"), value: 47.85),
            LineData(time: .string("2019-05-09"), value: 47.40),
            LineData(time: .string("2019-05-10"), value: 48.19),
            LineData(time: .string("2019-05-13"), value: 48.05),
            LineData(time: .string("2019-05-14"), value: 48.69),
            LineData(time: .string("2019-05-15"), value: 49.18),
            LineData(time: .string("2019-05-16"), value: 49.58),
            LineData(time: .string("2019-05-17"), value: 49.20),
            LineData(time: .string("2019-05-20"), value: 48.85),
            LineData(time: .string("2019-05-21"), value: 48.60),
            LineData(time: .string("2019-05-22"), value: 49.65),
            LineData(time: .string("2019-05-23"), value: 49.85),
            LineData(time: .string("2019-05-24"), value: 49.61),
            LineData(time: .string("2019-05-28"), value: 49.24)
        ]
        series.setData(data: data)
        self.series = series
    }

    @objc private func valueChanged(_ sender: UISegmentedControl) {
        chart.applyOptions(options: ChartOptions(layout: LayoutOptions(fontFamily: fonts[sender.selectedSegmentIndex])))
    }
    
}
