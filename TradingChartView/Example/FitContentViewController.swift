import UIKit
import LightweightCharts

class FitContentViewController: UIViewController {

    private var chart: LightweightCharts!
    private var series: AreaSeries!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        
        setupUI()
        setupData()
        chart.timeScale().fitContent()
    }
    
    private func setupUI() {
        let options = ChartOptions(priceScale: PriceScaleOptions(scaleMargins: PriceScaleMargins(top: 0.1, bottom: 0.1)))
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
    }
    
    private func setupData() {
        let options = AreaSeriesOptions(
            topColor: "rgba(76, 175, 80, 0.56)",
            bottomColor: "rgba(76, 175, 80, 0.04)",
            lineColor: "rgba(76, 175, 80, 1)",
            lineWidth: .two
        )
        let series = chart.addAreaSeries(options: options)
        let data = [
            LineData(time: .string("2018-01-04"), value: 173.03),
            LineData(time: .string("2018-01-05"), value: 175.00),
            LineData(time: .string("2018-01-08"), value: 174.35),
            LineData(time: .string("2018-01-09"), value: 174.33),
            LineData(time: .string("2018-01-10"), value: 174.29),
            LineData(time: .string("2018-01-11"), value: 175.28),
            LineData(time: .string("2018-01-12"), value: 177.09),
            LineData(time: .string("2018-01-16"), value: 176.19),
            LineData(time: .string("2018-01-17"), value: 179.10),
            LineData(time: .string("2018-01-18"), value: 179.26),
            LineData(time: .string("2018-01-19"), value: 178.46),
            LineData(time: .string("2018-01-22"), value: 177.00),
            LineData(time: .string("2018-01-23"), value: 177.04),
            LineData(time: .string("2018-01-24"), value: 174.22),
            LineData(time: .string("2018-01-25"), value: 171.11),
            LineData(time: .string("2018-01-26"), value: 171.51),
            LineData(time: .string("2018-01-29"), value: 167.96),
            LineData(time: .string("2018-01-30"), value: 166.97),
            LineData(time: .string("2018-01-31"), value: 167.43),
            LineData(time: .string("2018-02-01"), value: 167.78),
            LineData(time: .string("2018-02-02"), value: 160.50),
            LineData(time: .string("2018-02-05"), value: 156.49),
            LineData(time: .string("2018-02-06"), value: 163.03),
            LineData(time: .string("2018-02-07"), value: 159.54),
            LineData(time: .string("2018-02-08"), value: 155.15),
            LineData(time: .string("2018-02-09"), value: 156.41),
            LineData(time: .string("2018-02-12"), value: 162.71),
            LineData(time: .string("2018-02-13"), value: 164.34),
            LineData(time: .string("2018-02-14"), value: 167.37),
            LineData(time: .string("2018-02-15"), value: 172.99),
            LineData(time: .string("2018-02-16"), value: 172.43),
            LineData(time: .string("2018-02-20"), value: 171.85),
            LineData(time: .string("2018-02-21"), value: 171.07),
            LineData(time: .string("2018-02-22"), value: 172.50),
            LineData(time: .string("2018-02-23"), value: 175.50),
            LineData(time: .string("2018-02-26"), value: 178.97),
            LineData(time: .string("2018-02-27"), value: 178.39),
            LineData(time: .string("2018-02-28"), value: 178.12),
            LineData(time: .string("2018-03-01"), value: 175.00),
            LineData(time: .string("2018-03-02"), value: 176.21),
            LineData(time: .string("2018-03-05"), value: 176.82),
            LineData(time: .string("2018-03-06"), value: 176.67),
            LineData(time: .string("2018-03-07"), value: 175.03),
            LineData(time: .string("2018-03-08"), value: 176.94),
            LineData(time: .string("2018-03-09"), value: 179.98),
            LineData(time: .string("2018-03-12"), value: 181.72),
            LineData(time: .string("2018-03-13"), value: 179.97),
            LineData(time: .string("2018-03-14"), value: 178.44),
            LineData(time: .string("2018-03-15"), value: 178.65),
            LineData(time: .string("2018-03-16"), value: 178.02),
            LineData(time: .string("2018-03-19"), value: 175.30),
            LineData(time: .string("2018-03-20"), value: 175.24),
            LineData(time: .string("2018-03-21"), value: 171.27),
            LineData(time: .string("2018-03-22"), value: 168.85),
            LineData(time: .string("2018-03-23"), value: 164.94),
            LineData(time: .string("2018-03-26"), value: 172.77),
            LineData(time: .string("2018-03-27"), value: 168.34),
            LineData(time: .string("2018-03-28"), value: 166.48),
            LineData(time: .string("2018-03-29"), value: 167.78),
            LineData(time: .string("2018-04-02"), value: 166.68),
            LineData(time: .string("2018-04-03"), value: 168.39),
            LineData(time: .string("2018-04-04"), value: 171.61),
            LineData(time: .string("2018-04-05"), value: 172.80),
            LineData(time: .string("2018-04-06"), value: 168.38),
            LineData(time: .string("2018-04-09"), value: 170.05),
            LineData(time: .string("2018-04-10"), value: 173.25),
            LineData(time: .string("2018-04-11"), value: 172.44),
            LineData(time: .string("2018-04-12"), value: 174.14),
            LineData(time: .string("2018-04-13"), value: 174.73),
            LineData(time: .string("2018-04-16"), value: 175.82),
            LineData(time: .string("2018-04-17"), value: 178.24),
            LineData(time: .string("2018-04-18"), value: 177.84),
            LineData(time: .string("2018-04-19"), value: 172.80),
            LineData(time: .string("2018-04-20"), value: 165.72),
            LineData(time: .string("2018-04-23"), value: 165.24),
            LineData(time: .string("2018-04-24"), value: 162.94),
            LineData(time: .string("2018-04-25"), value: 163.65),
            LineData(time: .string("2018-04-26"), value: 164.22),
            LineData(time: .string("2018-04-27"), value: 162.32),
            LineData(time: .string("2018-04-30"), value: 165.26),
            LineData(time: .string("2018-05-01"), value: 169.10),
            LineData(time: .string("2018-05-02"), value: 176.57),
            LineData(time: .string("2018-05-03"), value: 176.89),
            LineData(time: .string("2018-05-04"), value: 183.83),
            LineData(time: .string("2018-05-07"), value: 185.16),
            LineData(time: .string("2018-05-08"), value: 186.05),
            LineData(time: .string("2018-05-09"), value: 187.36),
            LineData(time: .string("2018-05-10"), value: 190.04),
            LineData(time: .string("2018-05-11"), value: 188.59),
            LineData(time: .string("2018-05-14"), value: 188.15),
            LineData(time: .string("2018-05-15"), value: 186.44),
            LineData(time: .string("2018-05-16"), value: 188.18),
            LineData(time: .string("2018-05-17"), value: 186.99),
            LineData(time: .string("2018-05-18"), value: 186.31),
            LineData(time: .string("2018-05-21"), value: 187.63),
            LineData(time: .string("2018-05-22"), value: 187.16),
            LineData(time: .string("2018-05-23"), value: 188.36),
            LineData(time: .string("2018-05-24"), value: 188.15),
            LineData(time: .string("2018-05-25"), value: 188.58),
            LineData(time: .string("2018-05-29"), value: 187.90),
            LineData(time: .string("2018-05-30"), value: 187.50),
            LineData(time: .string("2018-05-31"), value: 186.87),
            LineData(time: .string("2018-06-01"), value: 190.24),
            LineData(time: .string("2018-06-04"), value: 191.83),
            LineData(time: .string("2018-06-05"), value: 193.31),
            LineData(time: .string("2018-06-06"), value: 193.98),
            LineData(time: .string("2018-06-07"), value: 193.46),
            LineData(time: .string("2018-06-08"), value: 191.70),
            LineData(time: .string("2018-06-11"), value: 191.23),
            LineData(time: .string("2018-06-12"), value: 192.28),
            LineData(time: .string("2018-06-13"), value: 190.70),
            LineData(time: .string("2018-06-14"), value: 190.80),
            LineData(time: .string("2018-06-15"), value: 188.84),
            LineData(time: .string("2018-06-18"), value: 188.74),
            LineData(time: .string("2018-06-19"), value: 185.69),
            LineData(time: .string("2018-06-20"), value: 186.50),
            LineData(time: .string("2018-06-21"), value: 185.46),
            LineData(time: .string("2018-06-22"), value: 184.92),
            LineData(time: .string("2018-06-25"), value: 182.17),
            LineData(time: .string("2018-06-26"), value: 184.43),
            LineData(time: .string("2018-06-27"), value: 184.16),
            LineData(time: .string("2018-06-28"), value: 185.50),
            LineData(time: .string("2018-06-29"), value: 185.11),
            LineData(time: .string("2018-07-02"), value: 187.18),
            LineData(time: .string("2018-07-03"), value: 183.92),
            LineData(time: .string("2018-07-05"), value: 185.40),
            LineData(time: .string("2018-07-06"), value: 187.97),
            LineData(time: .string("2018-07-09"), value: 190.58),
            LineData(time: .string("2018-07-10"), value: 190.35),
            LineData(time: .string("2018-07-11"), value: 187.88),
            LineData(time: .string("2018-07-12"), value: 191.03),
            LineData(time: .string("2018-07-13"), value: 191.33),
            LineData(time: .string("2018-07-16"), value: 190.91),
            LineData(time: .string("2018-07-17"), value: 191.45),
            LineData(time: .string("2018-07-18"), value: 190.40),
            LineData(time: .string("2018-07-19"), value: 191.88),
            LineData(time: .string("2018-07-20"), value: 191.44),
            LineData(time: .string("2018-07-23"), value: 191.61),
            LineData(time: .string("2018-07-24"), value: 193.00),
            LineData(time: .string("2018-07-25"), value: 194.82),
            LineData(time: .string("2018-07-26"), value: 194.21),
            LineData(time: .string("2018-07-27"), value: 190.98),
            LineData(time: .string("2018-07-30"), value: 189.91),
            LineData(time: .string("2018-07-31"), value: 190.29),
            LineData(time: .string("2018-08-01"), value: 201.50),
            LineData(time: .string("2018-08-02"), value: 207.39),
            LineData(time: .string("2018-08-03"), value: 207.99),
            LineData(time: .string("2018-08-06"), value: 209.07),
            LineData(time: .string("2018-08-07"), value: 207.11),
            LineData(time: .string("2018-08-08"), value: 207.25),
            LineData(time: .string("2018-08-09"), value: 208.88),
            LineData(time: .string("2018-08-10"), value: 207.53),
            LineData(time: .string("2018-08-13"), value: 208.87),
            LineData(time: .string("2018-08-14"), value: 209.75),
            LineData(time: .string("2018-08-15"), value: 210.24),
            LineData(time: .string("2018-08-16"), value: 213.32),
            LineData(time: .string("2018-08-17"), value: 217.58),
            LineData(time: .string("2018-08-20"), value: 215.46),
            LineData(time: .string("2018-08-21"), value: 215.04),
            LineData(time: .string("2018-08-22"), value: 215.05),
            LineData(time: .string("2018-08-23"), value: 215.49),
            LineData(time: .string("2018-08-24"), value: 216.16),
            LineData(time: .string("2018-08-27"), value: 217.94),
            LineData(time: .string("2018-08-28"), value: 219.70),
            LineData(time: .string("2018-08-29"), value: 222.98),
            LineData(time: .string("2018-08-30"), value: 225.03),
            LineData(time: .string("2018-08-31"), value: 227.63),
            LineData(time: .string("2018-09-04"), value: 228.36),
            LineData(time: .string("2018-09-05"), value: 226.87),
            LineData(time: .string("2018-09-06"), value: 223.10),
            LineData(time: .string("2018-09-07"), value: 221.30),
            LineData(time: .string("2018-09-10"), value: 218.33),
            LineData(time: .string("2018-09-11"), value: 223.85),
            LineData(time: .string("2018-09-12"), value: 221.07),
            LineData(time: .string("2018-09-13"), value: 226.41),
            LineData(time: .string("2018-09-14"), value: 223.84),
            LineData(time: .string("2018-09-17"), value: 217.88),
            LineData(time: .string("2018-09-18"), value: 218.24),
            LineData(time: .string("2018-09-19"), value: 218.37),
            LineData(time: .string("2018-09-20"), value: 220.03),
            LineData(time: .string("2018-09-21"), value: 217.66),
            LineData(time: .string("2018-09-24"), value: 220.79),
            LineData(time: .string("2018-09-25"), value: 222.19),
            LineData(time: .string("2018-09-26"), value: 220.42),
            LineData(time: .string("2018-09-27"), value: 224.95),
            LineData(time: .string("2018-09-28"), value: 225.74),
            LineData(time: .string("2018-10-01"), value: 227.26),
            LineData(time: .string("2018-10-02"), value: 229.28),
            LineData(time: .string("2018-10-03"), value: 232.07),
            LineData(time: .string("2018-10-04"), value: 227.99),
            LineData(time: .string("2018-10-05"), value: 224.29),
            LineData(time: .string("2018-10-08"), value: 223.77),
            LineData(time: .string("2018-10-09"), value: 226.87),
            LineData(time: .string("2018-10-10"), value: 216.36),
            LineData(time: .string("2018-10-11"), value: 214.45),
            LineData(time: .string("2018-10-12"), value: 222.11),
            LineData(time: .string("2018-10-15"), value: 217.36),
            LineData(time: .string("2018-10-16"), value: 222.15),
            LineData(time: .string("2018-10-17"), value: 221.19),
            LineData(time: .string("2018-10-18"), value: 216.02),
            LineData(time: .string("2018-10-19"), value: 219.31),
            LineData(time: .string("2018-10-22"), value: 220.65),
            LineData(time: .string("2018-10-23"), value: 222.73),
            LineData(time: .string("2018-10-24"), value: 215.09),
            LineData(time: .string("2018-10-25"), value: 219.80),
            LineData(time: .string("2018-10-26"), value: 216.30),
            LineData(time: .string("2018-10-29"), value: 212.24),
            LineData(time: .string("2018-10-30"), value: 213.30),
            LineData(time: .string("2018-10-31"), value: 218.86),
            LineData(time: .string("2018-11-01"), value: 222.22),
            LineData(time: .string("2018-11-02"), value: 207.48),
            LineData(time: .string("2018-11-05"), value: 201.59),
            LineData(time: .string("2018-11-06"), value: 203.77),
            LineData(time: .string("2018-11-07"), value: 209.95),
            LineData(time: .string("2018-11-08"), value: 208.49),
            LineData(time: .string("2018-11-09"), value: 204.47),
            LineData(time: .string("2018-11-12"), value: 194.17),
            LineData(time: .string("2018-11-13"), value: 192.23),
            LineData(time: .string("2018-11-14"), value: 186.80),
            LineData(time: .string("2018-11-15"), value: 191.41),
            LineData(time: .string("2018-11-16"), value: 193.53),
            LineData(time: .string("2018-11-19"), value: 185.86),
            LineData(time: .string("2018-11-20"), value: 176.98),
            LineData(time: .string("2018-11-21"), value: 176.78),
            LineData(time: .string("2018-11-23"), value: 172.29),
            LineData(time: .string("2018-11-26"), value: 174.62),
            LineData(time: .string("2018-11-27"), value: 174.24),
            LineData(time: .string("2018-11-28"), value: 180.94),
            LineData(time: .string("2018-11-29"), value: 179.55),
            LineData(time: .string("2018-11-30"), value: 178.58),
            LineData(time: .string("2018-12-03"), value: 184.82),
            LineData(time: .string("2018-12-04"), value: 176.69),
            LineData(time: .string("2018-12-06"), value: 174.72),
            LineData(time: .string("2018-12-07"), value: 168.49),
            LineData(time: .string("2018-12-10"), value: 169.60),
            LineData(time: .string("2018-12-11"), value: 168.63),
            LineData(time: .string("2018-12-12"), value: 169.10),
            LineData(time: .string("2018-12-13"), value: 170.95),
            LineData(time: .string("2018-12-14"), value: 165.48),
            LineData(time: .string("2018-12-17"), value: 163.94),
            LineData(time: .string("2018-12-18"), value: 166.07),
            LineData(time: .string("2018-12-19"), value: 160.89),
            LineData(time: .string("2018-12-20"), value: 156.83),
            LineData(time: .string("2018-12-21"), value: 150.73),
            LineData(time: .string("2018-12-24"), value: 146.83),
            LineData(time: .string("2018-12-26"), value: 157.17),
            LineData(time: .string("2018-12-27"), value: 156.15),
            LineData(time: .string("2018-12-28"), value: 156.23),
            LineData(time: .string("2018-12-31"), value: 157.74),
            LineData(time: .string("2019-01-02"), value: 157.92),
            LineData(time: .string("2019-01-03"), value: 142.19),
            LineData(time: .string("2019-01-04"), value: 148.26),
            LineData(time: .string("2019-01-07"), value: 147.93),
            LineData(time: .string("2019-01-08"), value: 150.75),
            LineData(time: .string("2019-01-09"), value: 153.31),
            LineData(time: .string("2019-01-10"), value: 153.80),
            LineData(time: .string("2019-01-11"), value: 152.29),
            LineData(time: .string("2019-01-14"), value: 150.00),
            LineData(time: .string("2019-01-15"), value: 153.07),
            LineData(time: .string("2019-01-16"), value: 154.94),
            LineData(time: .string("2019-01-17"), value: 155.86),
            LineData(time: .string("2019-01-18"), value: 156.82),
            LineData(time: .string("2019-01-22"), value: 153.30),
            LineData(time: .string("2019-01-23"), value: 153.92),
            LineData(time: .string("2019-01-24"), value: 152.70),
            LineData(time: .string("2019-01-25"), value: 157.76),
            LineData(time: .string("2019-01-28"), value: 156.30),
            LineData(time: .string("2019-01-29"), value: 154.68),
            LineData(time: .string("2019-01-30"), value: 165.25),
            LineData(time: .string("2019-01-31"), value: 166.44),
            LineData(time: .string("2019-02-01"), value: 166.52),
            LineData(time: .string("2019-02-04"), value: 171.25),
            LineData(time: .string("2019-02-05"), value: 174.18),
            LineData(time: .string("2019-02-06"), value: 174.24),
            LineData(time: .string("2019-02-07"), value: 170.94),
            LineData(time: .string("2019-02-08"), value: 170.41),
            LineData(time: .string("2019-02-11"), value: 169.43),
            LineData(time: .string("2019-02-12"), value: 170.89),
            LineData(time: .string("2019-02-13"), value: 170.18),
            LineData(time: .string("2019-02-14"), value: 170.80),
            LineData(time: .string("2019-02-15"), value: 170.42),
            LineData(time: .string("2019-02-19"), value: 170.93),
            LineData(time: .string("2019-02-20"), value: 172.03),
            LineData(time: .string("2019-02-21"), value: 171.06),
            LineData(time: .string("2019-02-22"), value: 172.97),
            LineData(time: .string("2019-02-25"), value: 174.23),
            LineData(time: .string("2019-02-26"), value: 174.33),
            LineData(time: .string("2019-02-27"), value: 174.87),
            LineData(time: .string("2019-02-28"), value: 173.15),
            LineData(time: .string("2019-03-01"), value: 174.97),
            LineData(time: .string("2019-03-04"), value: 175.85),
            LineData(time: .string("2019-03-05"), value: 175.53),
            LineData(time: .string("2019-03-06"), value: 174.52),
            LineData(time: .string("2019-03-07"), value: 172.50),
            LineData(time: .string("2019-03-08"), value: 172.91),
            LineData(time: .string("2019-03-11"), value: 178.90),
            LineData(time: .string("2019-03-12"), value: 180.91),
            LineData(time: .string("2019-03-13"), value: 181.71),
            LineData(time: .string("2019-03-14"), value: 183.73),
            LineData(time: .string("2019-03-15"), value: 186.12),
            LineData(time: .string("2019-03-18"), value: 188.02),
            LineData(time: .string("2019-03-19"), value: 186.53),
            LineData(time: .string("2019-03-20"), value: 188.16),
            LineData(time: .string("2019-03-21"), value: 195.09),
            LineData(time: .string("2019-03-22"), value: 191.05),
            LineData(time: .string("2019-03-25"), value: 188.74),
            LineData(time: .string("2019-03-26"), value: 186.79),
            LineData(time: .string("2019-03-27"), value: 188.47),
            LineData(time: .string("2019-03-28"), value: 188.72),
            LineData(time: .string("2019-03-29"), value: 189.95),
            LineData(time: .string("2019-04-01"), value: 191.24),
            LineData(time: .string("2019-04-02"), value: 194.02),
            LineData(time: .string("2019-04-03"), value: 195.35),
            LineData(time: .string("2019-04-04"), value: 195.69),
            LineData(time: .string("2019-04-05"), value: 197.00),
            LineData(time: .string("2019-04-08"), value: 200.10),
            LineData(time: .string("2019-04-09"), value: 199.50),
            LineData(time: .string("2019-04-10"), value: 200.62),
            LineData(time: .string("2019-04-11"), value: 198.95),
            LineData(time: .string("2019-04-12"), value: 198.87),
            LineData(time: .string("2019-04-15"), value: 199.23),
            LineData(time: .string("2019-04-16"), value: 199.25),
            LineData(time: .string("2019-04-17"), value: 203.13),
            LineData(time: .string("2019-04-18"), value: 203.86),
            LineData(time: .string("2019-04-22"), value: 204.53),
            LineData(time: .string("2019-04-23"), value: 207.48),
            LineData(time: .string("2019-04-24"), value: 207.16),
            LineData(time: .string("2019-04-25"), value: 205.28),
            LineData(time: .string("2019-04-26"), value: 204.30),
            LineData(time: .string("2019-04-29"), value: 204.61),
            LineData(time: .string("2019-04-30"), value: 200.67),
            LineData(time: .string("2019-05-01"), value: 210.52),
            LineData(time: .string("2019-05-02"), value: 209.15),
            LineData(time: .string("2019-05-03"), value: 211.75),
            LineData(time: .string("2019-05-06"), value: 208.48),
            LineData(time: .string("2019-05-07"), value: 202.86),
            LineData(time: .string("2019-05-08"), value: 202.90),
            LineData(time: .string("2019-05-09"), value: 200.72),
            LineData(time: .string("2019-05-10"), value: 197.18),
            LineData(time: .string("2019-05-13"), value: 185.72),
            LineData(time: .string("2019-05-14"), value: 188.66),
            LineData(time: .string("2019-05-15"), value: 190.92),
            LineData(time: .string("2019-05-16"), value: 190.08),
            LineData(time: .string("2019-05-17"), value: 189.00),
            LineData(time: .string("2019-05-20"), value: 183.09),
            LineData(time: .string("2019-05-21"), value: 186.60),
            LineData(time: .string("2019-05-22"), value: 182.78),
            LineData(time: .string("2019-05-23"), value: 179.66),
            LineData(time: .string("2019-05-24"), value: 178.97),
            LineData(time: .string("2019-05-28"), value: 179.11)
        ]
        series.setData(data: data)
        self.series = series
    }

}
