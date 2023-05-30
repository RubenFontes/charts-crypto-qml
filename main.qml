import QtQuick 2.15
import QtQuick.Window 2.15
import QtCharts 2.15
import QtQuick.Controls 2.15

Item {

    Grid{
        columns: 4
        rows: 2
        spacing: 0
        //rowSpacing: 0
        //columnSpacing: 0
        anchors.centerIn: parent

        ChartView{
            id: chart1
            title: "Cryptocurrency: Total Market Capitalization in Trillions US$"
            width: 350
            height: 400
            legend.alignment: Qt.AlignTop
            antialiasing: true

            BarSeries{
                id: barSeries1
                axisX: BarCategoryAxis {
                categories: ["2018","2019","2020","2021","2022"]
            }
                axisY:   ValueAxis {
                    id: yAxis1
                    onRangeChanged: {
                             applyNiceNumbers();
                       }
                }

                BarSet{
                   label:"Total Market Cap"
                   //color: black
                   values: [0.117,0.185,0.755,2.2,1.0]
                }

            }

        }

        ChartView{
            id: chart2
            title: "BTC X ETH: Total Market Cap in Billions US$"
            width: 350
            height: 400
            legend.alignment: Qt.AlignTop
            antialiasing: true

            BarSeries{
                id: barSeries2
                axisX: BarCategoryAxis {
                categories: ["2018","2019","2020","2021","2022"]
            }
                axisY:   ValueAxis {
                    id: yAxis2
                    onRangeChanged: {
                             applyNiceNumbers();
                       }
                }

                BarSet{
                   label:"Bitcoin"
                   values: [65,130,540,870,315]
                }

                BarSet{
                   label:"Ethereum"
                   values: [14,15,84,435,145]
                }
            }

        }

        ChartView{
            id: chart3
            title: "BTC X GOLD x SPX: Price variation in US$"
            width: 350
            height: 400
            legend.alignment: Qt.AlignTop
            antialiasing: true

            BarSeries{
                id: barSeries3
                axisX: BarCategoryAxis {
                categories: ["2018","2019","2020","2021","2022"]
            }
                axisY:   ValueAxis {
                    id: yAxis3
                    onRangeChanged: {
                             applyNiceNumbers();
                       }
                }

                BarSet{
                   label:"Bitcoin"
                   values: [3700,7000,30000,46000,17000]
                }

                BarSet{
                   label:"Gold"
                   values: [1250,1500,1900,1820,1800]
                }
                BarSet{
                   label:"S&P500"
                   values: [2500,3200,3750,4700,3800]
                }
            }

        }

        ChartView {
            id: chart4
            title: "Crypto Total DeFi Market Cap in Billions US$"
            width: 350
            height: 400
            legend.alignment: Qt.AlignTop
            antialiasing: true

            LineSeries {
                id: lineSeries1
                name: "DeFi (Decentralized Finance)"
                axisY:   ValueAxis {
                    id: yAxis4
                    onRangeChanged: {
                             applyNiceNumbers();
                       }
                }
                XYPoint { x: 2018; y: 2 }
                XYPoint { x: 2019; y: 20 }
                XYPoint { x: 2020; y: 160 }
                XYPoint { x: 2021; y: 30 }
                XYPoint { x: 2022; y: 40 }
            }
        }

        ChartView {
            id: chart5
            title: "Top Cryptos Dominance in Percentage (%)"
            width: 350
            height: 400
            legend.alignment: Qt.AlignTop
            antialiasing: true

            StackedBarSeries {
                axisX: BarCategoryAxis { categories: ["2018", "2019", "2020", "2021", "2022"] }
                BarSet { label: "BTC"; values: [55, 70, 71, 70, 40] }
                BarSet { label: "ETH"; values: [12, 7, 11, 20, 10] }
                BarSet { label: "XRP"; values: [12, 4.5, 1.3, 1.8, 2.3] }
                BarSet { label: "LTC"; values: [1.5, 1.4, 1, 0.5, 0.7] }
                BarSet { label: "Others"; values: [19.5, 17.1, 15.7, 7.7, 47] }
            }
        }

        ChartView {
            id: chart6
            title: "Top General Tokens by Market Capitalization"
            width: 350
            height: 400
            legend.alignment: Qt.AlignTop
            antialiasing: true

            HorizontalPercentBarSeries {
                axisY: BarCategoryAxis { categories: ["2018", "2019", "2020", "2021", "2022" ] }
                BarSet { label: "BTC"; values: [65,130,540,870,315] }
                BarSet { label: "ETH"; values: [14,15,84,435,145] }
                BarSet { label: "XRP"; values: [14, 9, 22, 43, 24 ] }
                BarSet { label: "LTC"; values: [1.5, 2.3, 9, 11, 6] }
            }
        }

        ChartView {
            id: chart7
            width: 350
            height: 400
            antialiasing: true
            title: "Top Privacy Tokens by Market Capitalization"

            PieSeries {
                id: pieSeries

                PieSlice { label: "XMR"; value: 2765437599 }
                PieSlice { label: "ZEC"; value: 535476432 }
                PieSlice { label: "DASH"; value: 477465415 }
                PieSlice { label: "ROSE"; value: 296655827 }
                PieSlice { label: "DCR"; value: 246003317 }
            }
        }

        ChartView {
            id: chart8
            width: 350
            height: 400
            antialiasing: true
            title: "Bitcoin x World's Largest Fiat Currencies: Market Cap"

            PieSeries {
                id: pieSeries2

                PieSlice { label: "CNY"; value: 1482195505 }
                PieSlice { label: "USD"; value: 893574500 }
                PieSlice { label: "EUR"; value: 594374526 }
                PieSlice { label: "JPY"; value: 418891531 }
                PieSlice { label: "BTC"; value: 19385562 }
            }
        }
    }
}

/*

#COMENTÁRIOS

- Trabalhei na ideia de um layout flexível (responsivo), mas notei um delay enorme na renderização e abortei.
Talvez até por limitação da minha CPU em recalcular a largura e redesenhar os elementos.

- Não lembro exatamente qual a configuração usada no setup da criação do projeto, mas acredito que foi feito em cima do arquivo (modeloinfografia)
postado no sigaa. Se faltar alguma dependência, me avisa.

- Tentei aplicar algumas mudanças na interface, porém algumas propriedades foram modificadas nas builds mais recentes do kit
 e acabou não rolando.

Ah e foi mal pela identação e nomeação do ids kkk dava pra melhorar.

*/


