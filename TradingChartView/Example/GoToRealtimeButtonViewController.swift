import UIKit
import LightweightCharts

class GoToRealtimeButtonViewController: UIViewController {

    private var chart: LightweightCharts!
    private var series: AreaSeries!
    private var timeScale: TimeScaleApi!
    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        
        setupUI()
        setupData()
        timeScale = chart.timeScale()
        timeScale.scrollToPosition(position: -20, animated: false)
        setupSubscription()
    }
    
    private func setupUI() {
        let options = ChartOptions(priceScale: PriceScaleOptions(scaleMargins: PriceScaleMargins(top: 0.2, bottom: 0.1)),
                                   timeScale: TimeScaleOptions(rightOffset: 2))
        let chart = LightweightCharts(options: options)
        view.addSubview(chart)
        chart.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                chart.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                chart.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                chart.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                chart.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        } else {
            NSLayoutConstraint.activate([
                chart.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                chart.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                chart.topAnchor.constraint(equalTo: view.topAnchor),
                chart.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
        self.chart = chart

        button.setTitle("⏩", for: .normal)
        button.tintColor = .darkText
        button.titleLabel?.font = .systemFont(ofSize: 32)
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -64),
                button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32)
            ])
        } else {
            NSLayoutConstraint.activate([
                button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
                button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32)
            ])
        }
    }
    
    private func setupData() {
        let options = AreaSeriesOptions(
            topColor: "rgba(245, 124, 0, 0.4)",
            bottomColor: "rgba(245, 124, 0, 0.4)",
            lineColor: "rgba(245, 124, 0, 1)",
            lineWidth: .two
        )
        let series = chart.addAreaSeries(options: options)
        let data = [
            LineData(time: .string("2016-07-18"), value: 26.10),
            LineData(time: .string("2016-07-25"), value: 26.19),
            LineData(time: .string("2016-08-01"), value: 26.24),
            LineData(time: .string("2016-08-08"), value: 26.22),
            LineData(time: .string("2016-08-15"), value: 25.98),
            LineData(time: .string("2016-08-22"), value: 25.85),
            LineData(time: .string("2016-08-29"), value: 25.98),
            LineData(time: .string("2016-09-05"), value: 25.71),
            LineData(time: .string("2016-09-12"), value: 25.84),
            LineData(time: .string("2016-09-19"), value: 25.89),
            LineData(time: .string("2016-09-26"), value: 25.65),
            LineData(time: .string("2016-10-03"), value: 25.69),
            LineData(time: .string("2016-10-10"), value: 25.67),
            LineData(time: .string("2016-10-17"), value: 26.11),
            LineData(time: .string("2016-10-24"), value: 25.80),
            LineData(time: .string("2016-10-31"), value: 25.70),
            LineData(time: .string("2016-11-07"), value: 25.40),
            LineData(time: .string("2016-11-14"), value: 25.32),
            LineData(time: .string("2016-11-21"), value: 25.48),
            LineData(time: .string("2016-11-28"), value: 25.08),
            LineData(time: .string("2016-12-05"), value: 25.06),
            LineData(time: .string("2016-12-12"), value: 25.11),
            LineData(time: .string("2016-12-19"), value: 25.34),
            LineData(time: .string("2016-12-26"), value: 25.20),
            LineData(time: .string("2017-01-02"), value: 25.33),
            LineData(time: .string("2017-01-09"), value: 25.56),
            LineData(time: .string("2017-01-16"), value: 25.32),
            LineData(time: .string("2017-01-23"), value: 25.71),
            LineData(time: .string("2017-01-30"), value: 25.85),
            LineData(time: .string("2017-02-06"), value: 25.77),
            LineData(time: .string("2017-02-13"), value: 25.94),
            LineData(time: .string("2017-02-20"), value: 25.67),
            LineData(time: .string("2017-02-27"), value: 25.60),
            LineData(time: .string("2017-03-06"), value: 25.54),
            LineData(time: .string("2017-03-13"), value: 25.84),
            LineData(time: .string("2017-03-20"), value: 25.96),
            LineData(time: .string("2017-03-27"), value: 25.90),
            LineData(time: .string("2017-04-03"), value: 25.97),
            LineData(time: .string("2017-04-10"), value: 26.00),
            LineData(time: .string("2017-04-17"), value: 26.13),
            LineData(time: .string("2017-04-24"), value: 26.02),
            LineData(time: .string("2017-05-01"), value: 26.30),
            LineData(time: .string("2017-05-08"), value: 26.27),
            LineData(time: .string("2017-05-15"), value: 26.24),
            LineData(time: .string("2017-05-22"), value: 26.02),
            LineData(time: .string("2017-05-29"), value: 26.20),
            LineData(time: .string("2017-06-05"), value: 26.12),
            LineData(time: .string("2017-06-12"), value: 26.20),
            LineData(time: .string("2017-06-19"), value: 26.46),
            LineData(time: .string("2017-06-26"), value: 26.39),
            LineData(time: .string("2017-07-03"), value: 26.52),
            LineData(time: .string("2017-07-10"), value: 26.57),
            LineData(time: .string("2017-07-17"), value: 26.65),
            LineData(time: .string("2017-07-24"), value: 26.45),
            LineData(time: .string("2017-07-31"), value: 26.37),
            LineData(time: .string("2017-08-07"), value: 26.13),
            LineData(time: .string("2017-08-14"), value: 26.21),
            LineData(time: .string("2017-08-21"), value: 26.31),
            LineData(time: .string("2017-08-28"), value: 26.33),
            LineData(time: .string("2017-09-04"), value: 26.38),
            LineData(time: .string("2017-09-11"), value: 26.38),
            LineData(time: .string("2017-09-18"), value: 26.50),
            LineData(time: .string("2017-09-25"), value: 26.39),
            LineData(time: .string("2017-10-02"), value: 25.95),
            LineData(time: .string("2017-10-09"), value: 26.15),
            LineData(time: .string("2017-10-16"), value: 26.43),
            LineData(time: .string("2017-10-23"), value: 26.22),
            LineData(time: .string("2017-10-30"), value: 26.14),
            LineData(time: .string("2017-11-06"), value: 26.08),
            LineData(time: .string("2017-11-13"), value: 26.27),
            LineData(time: .string("2017-11-20"), value: 26.30),
            LineData(time: .string("2017-11-27"), value: 25.92),
            LineData(time: .string("2017-12-04"), value: 26.10),
            LineData(time: .string("2017-12-11"), value: 25.88),
            LineData(time: .string("2017-12-18"), value: 25.82),
            LineData(time: .string("2017-12-25"), value: 25.82),
            LineData(time: .string("2018-01-01"), value: 25.81),
            LineData(time: .string("2018-01-08"), value: 25.95),
            LineData(time: .string("2018-01-15"), value: 26.03),
            LineData(time: .string("2018-01-22"), value: 26.04),
            LineData(time: .string("2018-01-29"), value: 25.96),
            LineData(time: .string("2018-02-05"), value: 25.99),
            LineData(time: .string("2018-02-12"), value: 26.00),
            LineData(time: .string("2018-02-19"), value: 26.06),
            LineData(time: .string("2018-02-26"), value: 25.77),
            LineData(time: .string("2018-03-05"), value: 25.81),
            LineData(time: .string("2018-03-12"), value: 25.88),
            LineData(time: .string("2018-03-19"), value: 25.72),
            LineData(time: .string("2018-03-26"), value: 25.75),
            LineData(time: .string("2018-04-02"), value: 25.70),
            LineData(time: .string("2018-04-09"), value: 25.73),
            LineData(time: .string("2018-04-16"), value: 25.74),
            LineData(time: .string("2018-04-23"), value: 25.69),
            LineData(time: .string("2018-04-30"), value: 25.76),
            LineData(time: .string("2018-05-07"), value: 25.89),
            LineData(time: .string("2018-05-14"), value: 25.89),
            LineData(time: .string("2018-05-21"), value: 26.00),
            LineData(time: .string("2018-05-28"), value: 25.79),
            LineData(time: .string("2018-06-04"), value: 26.11),
            LineData(time: .string("2018-06-11"), value: 26.43),
            LineData(time: .string("2018-06-18"), value: 26.30),
            LineData(time: .string("2018-06-25"), value: 26.58),
            LineData(time: .string("2018-07-02"), value: 26.33),
            LineData(time: .string("2018-07-09"), value: 26.33),
            LineData(time: .string("2018-07-16"), value: 26.32),
            LineData(time: .string("2018-07-23"), value: 26.20),
            LineData(time: .string("2018-07-30"), value: 26.03),
            LineData(time: .string("2018-08-06"), value: 26.15),
            LineData(time: .string("2018-08-13"), value: 26.17),
            LineData(time: .string("2018-08-20"), value: 26.28),
            LineData(time: .string("2018-08-27"), value: 25.86),
            LineData(time: .string("2018-09-03"), value: 25.69),
            LineData(time: .string("2018-09-10"), value: 25.69),
            LineData(time: .string("2018-09-17"), value: 25.64),
            LineData(time: .string("2018-09-24"), value: 25.67),
            LineData(time: .string("2018-10-01"), value: 25.55),
            LineData(time: .string("2018-10-08"), value: 25.59),
            LineData(time: .string("2018-10-15"), value: 26.19),
            LineData(time: .string("2018-10-22"), value: 25.81),
            LineData(time: .string("2018-10-29"), value: 25.74),
            LineData(time: .string("2018-11-05"), value: 25.75),
            LineData(time: .string("2018-11-12"), value: 25.75),
            LineData(time: .string("2018-11-19"), value: 25.72),
            LineData(time: .string("2018-11-26"), value: 25.41),
            LineData(time: .string("2018-12-03"), value: 25.39),
            LineData(time: .string("2018-12-10"), value: 25.52),
            LineData(time: .string("2018-12-17"), value: 25.66),
            LineData(time: .string("2018-12-24"), value: 25.68),
            LineData(time: .string("2018-12-31"), value: 25.71),
            LineData(time: .string("2019-01-07"), value: 25.92),
            LineData(time: .string("2019-01-14"), value: 25.60),
            LineData(time: .string("2019-01-21"), value: 25.80),
            LineData(time: .string("2019-01-28"), value: 25.60),
            LineData(time: .string("2019-02-04"), value: 25.72),
            LineData(time: .string("2019-02-11"), value: 25.89),
            LineData(time: .string("2019-02-18"), value: 26.00),
            LineData(time: .string("2019-02-25"), value: 25.86),
            LineData(time: .string("2019-03-04"), value: 25.94),
            LineData(time: .string("2019-03-11"), value: 26.11),
            LineData(time: .string("2019-03-18"), value: 25.88),
            LineData(time: .string("2019-03-25"), value: 25.77),
            LineData(time: .string("2019-04-01"), value: 26.16),
            LineData(time: .string("2019-04-08"), value: 26.04),
            LineData(time: .string("2019-04-15"), value: 26.00),
            LineData(time: .string("2019-04-22"), value: 25.88),
            LineData(time: .string("2019-04-29"), value: 26.02),
            LineData(time: .string("2019-05-06"), value: 26.08),
            LineData(time: .string("2019-05-13"), value: 26.09),
            LineData(time: .string("2019-05-20"), value: 26.16),
            LineData(time: .string("2019-05-27"), value: 26.23)
        ]
        series.setData(data: data)
        self.series = series
    }
    
    @objc private func buttonTap(_ sender: UIButton) {
        timeScale.scrollToRealTime()
    }
    
    private func setupSubscription() {
        chart.delegate = self
        chart.subscribeVisibleTimeRangeChange()
    }
    
}

// MARK: - ChartDelegate
extension GoToRealtimeButtonViewController: ChartDelegate {
    
    func didClick(onChart chart: ChartApi, parameters: MouseEventParams) {
        
    }
    
    func didCrosshairMove(onChart chart: ChartApi, parameters: MouseEventParams) {
        
    }
    
    func didVisibleTimeRangeChange(onChart chart: ChartApi, parameters: TimeRange?) {
        timeScale.scrollPosition { [weak self] position in
            let isHidden = (position ?? 0) >= 0
            if !isHidden {
                self?.button.isHidden = false
            }
            UIView.animate(withDuration: 0.33, animations: {
                self?.button.alpha = isHidden ? 0 : 1
            }, completion: { _ in
                self?.button.isHidden = isHidden
            })
        }
    }
    
}
