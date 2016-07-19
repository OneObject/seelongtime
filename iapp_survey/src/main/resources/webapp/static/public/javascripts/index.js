$('#studynumber').highcharts({
            chart: {
                type: 'column',
                margin: [ 20, 20, 20, 30],
                height:108
                
            },
            title: {
                text: ''
            },
            xAxis: {
                categories: [
                    '1',
                    '3',
                    '5',
                    '7',
                    '9',
                    '11',
                    '13',
                    '15',
                    '17',
                    '19',
                    '21',
                    '23'
                ],
                labels: {
                    align: 'right'
                }
            },
            yAxis: {
                min: 0,
                title: null
            },
            legend: {
                enabled: false
            },
            tooltip: {
                pointFormat: '',
            },
            Credits:{
            	enable:false
            },
            series: [{
                name: '学习课程数',
                data: [34, 21, 20, 20, 19, 19, 34, 21, 20, 20,15, 14],
                dataLabels: {
                    enabled: true,
                    rotation: -90,
                    color: '#FFFFFF',
                    align: 'right',
                    x: 4,
                    y: 10,
                    style: {
                        fontSize: '13px',
                        fontFamily: 'Verdana, sans-serif',
                        textShadow: '0 0 3px black'
                    }
                }
            }]
        });
/*
 * 排片表
 * 
 */
	 
	  
