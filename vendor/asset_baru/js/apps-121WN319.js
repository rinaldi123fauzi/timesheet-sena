"use strict";

// Mode switcher
$("#modeSwitcher").on("click", function (e) {
    e.preventDefault();
    modeSwitch();
    location.reload();
});

// Collapse sidebar
$(".collapseSidebar").on("click", function (e) {
    const $vertical = $(".vertical");
    if ($vertical.hasClass("narrow")) {
        $vertical.toggleClass("open");
    } else {
        $vertical.toggleClass("collapsed");
        if ($vertical.hasClass("hover")) {
            $vertical.removeClass("hover");
        }
    }
    e.preventDefault();
});

// Sidebar hover effect
$(".sidebar-left").hover(
    function () {
        const $vertical = $(".vertical");
        if ($vertical.hasClass("collapsed")) {
            $vertical.addClass("hover");
        }
        if (!$(".narrow").hasClass("open")) {
            $vertical.addClass("hover");
        }
    },
    function () {
        const $vertical = $(".vertical");
        if ($vertical.hasClass("collapsed")) {
            $vertical.removeClass("hover");
        }
        if (!$(".narrow").hasClass("open")) {
            $vertical.removeClass("hover");
        }
    }
);

// Toggle sidebar
$(".toggle-sidebar").on("click", function () {
    $(".navbar-slide").toggleClass("show");
});

// Dropdown menus
(function ($) {
    $(".dropdown-menu a.dropdown-toggle").on("click", function (e) {
        const $this = $(this);
        if (!$this.next().hasClass("show")) {
            $this.parents(".dropdown-menu").first().find(".show").removeClass("show");
        }
        $this.next(".dropdown-menu").toggleClass("show");
        $this.parents("li.nav-item.dropdown.show").on("hidden.bs.dropdown", function (e) {
            $(".dropdown-submenu .show").removeClass("show");
        });
        return false;
    });
}(jQuery));

// Handle dropdown visibility
$(".navbar .dropdown").on("hidden.bs.dropdown", function () {
    $(this).find("li.dropdown").removeClass("show open");
    $(this).find("ul.dropdown-menu").removeClass("show open");
});

// File panel card click
$(".file-panel .card").on("click", function () {
    const $this = $(this);
    if ($this.hasClass("selected")) {
        $this.removeClass("selected").find(".bg-light").removeClass("shadow-lg");
        $(".file-container").removeClass("collapsed");
    } else {
        $this.addClass("selected shadow-lg");
        $(".file-panel .card").not($this).removeClass("selected");
        $(".file-container").addClass("collapsed");
    }
});

// Close info panel
$(".close-info").on("click", function () {
    if ($(".file-container").hasClass("collapsed")) {
        $(".file-container").removeClass("collapsed");
        $(".file-panel").find(".selected").removeClass("selected");
    }
});

// Stick info content on scroll
$(function () {
    $(".info-content").stickOnScroll({ topOffset: 0, setWidthOnStick: true });
});

// Basic wizard
const basicWizard = $("#example-basic");
if (basicWizard.length) {
    basicWizard.steps({
        headerTag: "h3",
        bodyTag: "section",
        transitionEffect: "slideLeft",
        autoFocus: true
    });
}

// Vertical wizard
const verticalWizard = $("#example-vertical");
if (verticalWizard.length) {
    verticalWizard.steps({
        headerTag: "h3",
        bodyTag: "section",
        transitionEffect: "slideLeft",
        stepsOrientation: "vertical"
    });
}

// Form validation and steps
const form = $("#example-form");
if (form.length) {
    form.validate({
        errorPlacement: function (error, element) {
            element.before(error);
        },
        rules: {
            confirm: {
                equalTo: "#password"
            }
        }
    });

    form.children("div").steps({
        headerTag: "h3",
        bodyTag: "section",
        transitionEffect: "slideLeft",
        onStepChanging: function (e, currentIndex, newIndex) {
            form.validate().settings.ignore = ":disabled,:hidden";
            return form.valid();
        },
        onFinishing: function (e, currentIndex) {
            form.validate().settings.ignore = ":disabled";
            return form.valid();
        },
        onFinished: function (e, currentIndex) {
            alert("Submitted!");
        }
    });
}

// Chart options
const ChartOptions = {
    maintainAspectRatio: false,
    responsive: true,
    legend: { display: false },
    scales: {
        xAxes: [{ gridLines: { display: false } }],
        yAxes: [{
            gridLines: {
                display: false,
                color: colors.borderColor,
                zeroLineColor: colors.borderColor
            }
        }]
    }
};

// Chart data
const ChartData = {
    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep"],
    datasets: [
        {
            label: "Visitors",
            barThickness: 10,
            backgroundColor: base.primaryColor,
            borderColor: base.primaryColor,
            pointRadius: false,
            data: [28, 48, 40, 19, 64, 27, 90, 85, 92],
            fill: "",
            lineTension: 0.1
        },
        {
            label: "Orders",
            barThickness: 10,
            backgroundColor: "rgba(210, 214, 222, 1)",
            borderColor: "rgba(210, 214, 222, 1)",
            pointRadius: false,
            data: [65, 59, 80, 42, 43, 55, 40, 36, 68],
            fill: "",
            borderWidth: 2,
            lineTension: 0.1
        }
    ]
};

// Initialize charts
const barChartjs = document.getElementById("barChartjs");
if (barChartjs) {
    new Chart(barChartjs, { type: "bar", data: ChartData, options: ChartOptions });
}

const lineChartjs = document.getElementById("lineChartjs");
if (lineChartjs) {
    new Chart(lineChartjs, { type: "line", data: lineChartData, options: ChartOptions });
}

const pieChartjs = document.getElementById("pieChartjs");
if (pieChartjs) {
    new Chart(pieChartjs, {
        type: "pie",
        data: pieChartData,
        options: { maintainAspectRatio: false, responsive: true }
    });
}

const areaChartjs = document.getElementById("areaChartjs");
if (areaChartjs) {
    new Chart(areaChartjs, { type: "line", data: areaChartData, options: ChartOptions });
}

// Sparkline charts
if ($(".sparkline").length) {
    $(".inlinebar").sparkline([3, 2, 7, 5, 4, 6, 8], {
        type: "bar",
        width: "100%",
        height: "32",
        barColor: base.primaryColor,
        barWidth: 4,
        barSpacing: 2
    });

    $(".inlineline").sparkline([2, 0, 5, 7, 4, 6, 8], {
        type: "line",
        width: "100%",
        height: "32",
        defaultPixelsPerValue: 5,
        lineColor: base.primaryColor,
        fillColor: "transparent",
        minSpotColor: false,
        spotColor: false,
        highlightSpotColor: "",
        maxSpotColor: false,
        lineWidth: 2
    });

    $(".inlinepie").sparkline([5, 7, 4, 6, 8], {
        type: "pie",
        height: "32",
        width: "32",
        sliceColors: chartColors
    });
}

// Gauges
const gauges = [
    { id: "gauge1", options: { max: 100, dialStartAngle: -90, dialEndAngle: -90.001, value: 100, showValue: false, label: e => Math.round(100 * e) / 100 } },
    { id: "gauge2", options: { max: 100, value: 46, dialStartAngle: 0, dialEndAngle: -90.001 } },
    { id: "gauge3", options: { max: 100, dialStartAngle: -90, dialEndAngle: -90.001, value: 80, showValue: false, label: e => Math.round(100 * e) / 100 } },
    { id: "gauge4", options: { max: 500, dialStartAngle: 90, dialEndAngle: 0, value: 50 } }
];

gauges.forEach(({ id, options }) => {
    const svgElement = document.getElementById(id);
    if (svgElement) {
        const gauge = Gauge(svgElement, options);
        (function animate() {
            gauge.setValue(90);
            gauge.setValueAnimated(60, 1);
            window.setTimeout(animate, 6000);
        })();
    }
});
