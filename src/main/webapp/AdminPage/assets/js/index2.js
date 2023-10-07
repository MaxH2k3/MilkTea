$.ajax({
    url: "GetOrderWaiting", // Đây là URL của servlet, sử dụng annotation @WebServlet
    type: "GET",
    dataType: "json",
    success: function (data) {
        list = data;
        renderChartsTotalOrderWaiting(list);
    },
    error: function (jqXHR, textStatus, errorThrown) {
        console.log("Error: " + textStatus + " - " + errorThrown);
    }
});

$.ajax({
    url: "GetOrderAccept", // Đây là URL của servlet, sử dụng annotation @WebServlet
    type: "GET",
    dataType: "json",
    success: function (data) {
        list = data;
        renderChartsTotalOrderAccept(list);
    },
    error: function (jqXHR, textStatus, errorThrown) {
        console.log("Error: " + textStatus + " - " + errorThrown);
    }
});

$.ajax({
    url: "GetAmountProduct", // Đây là URL của servlet, sử dụng annotation @WebServlet
    type: "GET",
    dataType: "json",
    success: function (data) {
        list = data;
        renderChartsTotalProduct(list);
    },
    error: function (jqXHR, textStatus, errorThrown) {
        console.log("Error: " + textStatus + " - " + errorThrown);
    }
});

$.ajax({
    url: "GetTotalIncome", // Đây là URL của servlet, sử dụng annotation @WebServlet
    type: "GET",
    dataType: "json",
    success: function (data) {
        data = Math.round((data / 2000 * 100) * 100) / 100;
        renderChartsTargetIncome(data);
    },
    error: function (jqXHR, textStatus, errorThrown) {
        console.log("Error: " + textStatus + " - " + errorThrown);
    }
});

$.ajax({
    url: "GetPriceEachMonth", // Đây là URL của servlet, sử dụng annotation @WebServlet
    type: "GET",
    dataType: "json",
    success: function (data) {
        renderPriceEachMonth(data);
    },
    error: function (jqXHR, textStatus, errorThrown) {
        console.log("Error: " + textStatus + " - " + errorThrown);
    }
});

function renderChartsTotalOrderWaiting(list) {
    // chart 1
    var options = {
        series: [{
                name: 'Total Orders',
                data: list
            }],
        chart: {
            type: 'area',
            height: 65,
            toolbar: {
                show: false
            },
            zoom: {
                enabled: false
            },
            dropShadow: {
                enabled: true,
                top: 3,
                left: 14,
                blur: 4,
                opacity: 0.12,
                color: '#f41127',
            },
            sparkline: {
                enabled: true
            }
        },
        markers: {
            size: 0,
            colors: ["#f41127"],
            strokeColors: "#fff",
            strokeWidth: 2,
            hover: {
                size: 7,
            }
        },
        plotOptions: {
            bar: {
                horizontal: false,
                columnWidth: '45%',
                endingShape: 'rounded'
            },
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            show: true,
            width: 2.4,
            curve: 'smooth'
        },
        colors: ["#f41127"],
        xaxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        },
        fill: {
            opacity: 1
        },
        tooltip: {
            theme: 'dark',
            fixed: {
                enabled: false
            },
            x: {
                show: false
            },
            y: {
                title: {
                    formatter: function (seriesName) {
                        return ''
                    }
                }
            },
            marker: {
                show: false
            }
        }
    };
    var chart = new ApexCharts(document.querySelector("#chart1"), options);
    chart.render();
}

function renderChartsTotalOrderAccept(list) {
    // chart 2
    var options = {
        series: [{
                name: 'Total Income',
                data: list
            }],
        chart: {
            type: 'area',
            height: 65,
            toolbar: {
                show: false
            },
            zoom: {
                enabled: false
            },
            dropShadow: {
                enabled: true,
                top: 3,
                left: 14,
                blur: 4,
                opacity: 0.12,
                color: '#8833ff',
            },
            sparkline: {
                enabled: true
            }
        },
        markers: {
            size: 0,
            colors: ["#8833ff"],
            strokeColors: "#fff",
            strokeWidth: 2,
            hover: {
                size: 7,
            }
        },
        plotOptions: {
            bar: {
                horizontal: false,
                columnWidth: '45%',
                endingShape: 'rounded'
            },
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            show: true,
            width: 2.4,
            curve: 'smooth'
        },
        colors: ["#8833ff"],
        xaxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        },
        fill: {
            opacity: 1
        },
        tooltip: {
            theme: 'dark',
            fixed: {
                enabled: false
            },
            x: {
                show: false
            },
            y: {
                title: {
                    formatter: function (seriesName) {
                        return ''
                    }
                }
            },
            marker: {
                show: false
            }
        }
    };
    var chart = new ApexCharts(document.querySelector("#chart2"), options);
    chart.render();
}

function renderChartsTotalProduct(list) {
    // chart 3
    var options = {
        series: [{
                name: 'Total Users',
                data: list
            }],
        chart: {
            type: 'area',
            height: 65,
            toolbar: {
                show: false
            },
            zoom: {
                enabled: false
            },
            dropShadow: {
                enabled: true,
                top: 3,
                left: 14,
                blur: 4,
                opacity: 0.12,
                color: '#ffb207',
            },
            sparkline: {
                enabled: true
            }
        },
        markers: {
            size: 0,
            colors: ["#ffb207"],
            strokeColors: "#fff",
            strokeWidth: 2,
            hover: {
                size: 7,
            }
        },
        plotOptions: {
            bar: {
                horizontal: false,
                columnWidth: '45%',
                endingShape: 'rounded'
            },
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            show: true,
            width: 2.4,
            curve: 'smooth'
        },
        colors: ["#ffb207"],
        xaxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        },
        fill: {
            opacity: 1
        },
        tooltip: {
            theme: 'dark',
            fixed: {
                enabled: false
            },
            x: {
                show: false
            },
            y: {
                title: {
                    formatter: function (seriesName) {
                        return ''
                    }
                }
            },
            marker: {
                show: false
            }
        }
    };
    var chart = new ApexCharts(document.querySelector("#chart3"), options);
    chart.render();
}

function renderChartsTargetIncome(data) {
    // chart 6
    var options = {
        chart: {
            height: 300,
            type: 'radialBar',
            toolbar: {
                show: false
            }
        },
        plotOptions: {
            radialBar: {
                //startAngle: -135,
                //endAngle: 225,
                hollow: {
                    margin: 0,
                    size: '78%',
                    //background: '#fff',
                    image: undefined,
                    imageOffsetX: 0,
                    imageOffsetY: 0,
                    position: 'front',
                    dropShadow: {
                        enabled: false,
                        top: 3,
                        left: 0,
                        blur: 4,
                        color: 'rgba(0, 169, 255, 0.25)',
                        opacity: 0.65
                    }
                },
                track: {
                    background: '#f0e6ff',
                    //strokeWidth: '67%',
                    margin: 0, // margin is in pixels
                    dropShadow: {
                        enabled: false,
                        top: -3,
                        left: 0,
                        blur: 4,
                        color: 'rgba(0, 169, 255, 0.85)',
                        opacity: 0.65
                    }
                },
                dataLabels: {
                    showOn: 'always',
                    name: {
                        offsetY: -25,
                        show: true,
                        color: '#6c757d',
                        fontSize: '16px'
                    },
                    value: {
                        formatter: function (val) {
                            return val + "%";
                        },
                        color: '#000',
                        fontSize: '45px',
                        show: true,
                        offsetY: 10,
                    }
                }
            }
        },
        fill: {
            type: 'gradient',
            gradient: {
                shade: 'light',
                type: 'horizontal',
                shadeIntensity: 0.5,
                gradientToColors: ['#8833ff'],
                inverseColors: false,
                opacityFrom: 1,
                opacityTo: 1,
                stops: [0, 100]
            }
        },
        colors: ["#8833ff"],
        series: [data],
        stroke: {
            lineCap: 'round',
            //dashArray: 4
        },
        labels: ['Reached'],
    }
    var chart = new ApexCharts(document.querySelector("#chart6"), options);
    chart.render();
}

function renderPriceEachMonth(list) {
    // chart 1
    var options = {
        series: [{
                name: 'Likes',
                data: list
            }],
        chart: {
            foreColor: '#9ba7b2',
            height: 360,
            type: 'line',
            zoom: {
                enabled: false
            },
            toolbar: {
                show: true
            },
            dropShadow: {
                enabled: true,
                top: 3,
                left: 14,
                blur: 4,
                opacity: 0.10,
            }
        },
        stroke: {
            width: 5,
            curve: 'smooth'
        },
        xaxis: {
            type: 'month',
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', "Oct", "Nov", "Dec"],
        },
        title: {
            text: 'Income a month',
            align: 'left',
            style: {
                fontSize: "16px",
                color: '#666'
            }
        },
        fill: {
            type: 'gradient',
            gradient: {
                shade: 'light',
                gradientToColors: ['#8833ff'],
                shadeIntensity: 1,
                type: 'horizontal',
                opacityFrom: 1,
                opacityTo: 1,
                stops: [0, 100, 100, 100]
            },
        },
        markers: {
            size: 4,
            colors: ["#8833ff"],
            strokeColors: "#fff",
            strokeWidth: 2,
            hover: {
                size: 7,
            }
        },
        colors: ["#8833ff"],
        yaxis: {
            title: {
                text: 'Price',
            },
        }
    };
    var chart = new ApexCharts(document.querySelector("#chart5"), options);
    chart.render();
}