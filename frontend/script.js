let cpuDetails = "";
let diskDetails = "";
let infraLogs = "";

async function loadData() {
    try {

        const cpuResponse = await fetch('logs/cpu_summary.txt');
        const cpuText = await cpuResponse.text();
        cpuDetails = cpuText;

        const cpuMatch = cpuText.match(/CPU Usage\s*:\s*(\d+)%/);
        const cpuUsage = cpuMatch ? parseInt(cpuMatch[1]) : 0;

        updateBar("cpu-bar", cpuUsage);
        document.getElementById("cpu-value").textContent = cpuUsage + "%";


        const diskResponse = await fetch('logs/disk_summary.txt');
        const diskText = await diskResponse.text();
        diskDetails = diskText;

        const diskMatch = diskText.match(/Disk Usage\s*:\s*(\d+)%/);
        const diskUsage = diskMatch ? parseInt(diskMatch[1]) : 0;

        updateBar("disk-bar", diskUsage);
        document.getElementById("disk-value").textContent = diskUsage + "%";


        const logResponse = await fetch('logs/infrapilot.log');
        infraLogs = await logResponse.text();

        document.getElementById("updated").textContent =
            new Date().toLocaleTimeString();

    } catch (err) {
        console.error("Error loading data", err);
    }
}

function updateBar(id, value) {
    const bar = document.getElementById(id);
    bar.style.width = value + "%";
    bar.classList.remove("green", "yellow", "red");

    const dotId = id === "cpu-bar" ? "cpu-status" : "disk-status";
    const dot = document.getElementById(dotId);
    dot.classList.remove("green", "yellow", "red");

    if (value < 60) {
        bar.classList.add("green");
        dot.classList.add("green");
    } else if (value < 80) {
        bar.classList.add("yellow");
        dot.classList.add("yellow");
    } else {
        bar.classList.add("red");
        dot.classList.add("red");
    }
}

function openModal(type) {
    const modal = document.getElementById("modal");
    const title = document.getElementById("modal-title");
    const body = document.getElementById("modal-body");

    if (type === "cpu") {
        title.textContent = "Top CPU Processes";
        body.textContent = cpuDetails;
    }

    if (type === "disk") {
        title.textContent = "Disk Usage Details";
        body.textContent = diskDetails;
    }

    if (type === "logs") {
        title.textContent = "Latest InfraPilot Logs";
        const lines = infraLogs.trim().split("\n");
        const lastForty = lines.slice(-95).join("\n");
        body.textContent = lastForty;
    }

    modal.style.display = "block";
}

function closeModal() {
    document.getElementById("modal").style.display = "none";
}

loadData();
setInterval(loadData, 5000);
