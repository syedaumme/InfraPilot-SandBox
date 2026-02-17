let cpuDetails = "";
let diskDetails = "";

async function loadData() {
    try {
        // CPU
        const cpuResponse = await fetch('../logs/cpu_summary.txt');
        const cpuText = await cpuResponse.text();
        cpuDetails = cpuText;

        const cpuMatch = cpuText.match(/CPU Usage\s*:\s*(\d+)%/);
        const cpuUsage = cpuMatch ? parseInt(cpuMatch[1]) : 0;

        updateBar("cpu-bar", cpuUsage);
        document.getElementById("cpu-value").textContent = cpuUsage + "%";

        // Disk
        const diskResponse = await fetch('../logs/disk_summary.txt');
        const diskText = await diskResponse.text();
        diskDetails = diskText;

        const diskMatch = diskText.match(/Disk Usage\s*:\s*(\d+)%/);
        const diskUsage = diskMatch ? parseInt(diskMatch[1]) : 0;

        updateBar("disk-bar", diskUsage);
        document.getElementById("disk-value").textContent = diskUsage + "%";

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

    let statusColor;
    let statusClass;

    if (value < 60) {
        bar.classList.add("green");
        statusClass = "status-green";
    } else if (value < 80) {
        bar.classList.add("yellow");
        statusClass = "status-yellow";
    } else {
        bar.classList.add("red");
        statusClass = "status-red";
    }

    const statusId = id === "cpu-bar" ? "cpu-status" : "disk-status";
    const statusDot = document.getElementById(statusId);

    statusDot.classList.remove("status-green", "status-yellow", "status-red");
    statusDot.classList.add(statusClass);
}

function openModal(type) {
    const modal = document.getElementById("modal");
    const title = document.getElementById("modal-title");
    const body = document.getElementById("modal-body");

    if (type === "cpu") {
        title.textContent = "Top 10 CPU Processes";
        body.textContent = cpuDetails.split("\n").slice(-15).join("\n");
    }

    if (type === "disk") {
        title.textContent = "Disk Usage Details";
        body.textContent = diskDetails;
    }

    modal.style.display = "block";
}

function closeModal() {
    document.getElementById("modal").style.display = "none";
}

loadData();
setInterval(loadData, 5000);
