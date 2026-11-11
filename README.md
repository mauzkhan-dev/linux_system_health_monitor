# Linux System Health Monitor

A Bash-based DevOps project that monitors Linux system resources, generates timestamped health reports, and records script execution activity through logging.

Built using Ubuntu Linux and Bash scripting as a practical project to explore Linux administration and automation.

## Features

- **System Information:** Collects hostname, current date, and system uptime.
- **CPU Monitoring:** Displays CPU hardware information, available processors, and CPU usage.
- **Disk Monitoring:** Checks filesystem disk usage.
- **Memory Monitoring:** Monitors RAM and memory consumption.
- **Health Alerts:** Displays HEALTHY or WARNING status based on disk and memory usage thresholds.
- **Automated Reports:** Generates a separate timestamped report whenever the script runs.
- **Logging System:** Records monitoring activity and report generation events.
- **Cron Scheduling:** Supports automatic daily execution.

## Technologies Used

- Ubuntu Linux
- Bash Scripting
- Linux Command-Line Utilities
- AWK
- Cron Jobs

## Project Structure

```text
linux_system_health_monitor/
│
├── README.md
├── .gitignore
├── system_health_monitor.sh
│
├── reports/                  # Generated automatically
│   └── timestamped reports
│
└── logs/                     # Generated automatically
    └── monitor.log
```

**Note:** The `reports/` and `logs/` directories are generated locally when the script runs. They are excluded from Git tracking using `.gitignore`.

## Installation

Clone the repository:

```bash
git clone https://github.com/mauzkhan-dev/linux_system_health_monitor.git
```

Navigate into the project directory:

```bash
cd linux_system_health_monitor
```

## How to Run

Execute the monitoring script:

```bash
bash system_health_monitor.sh
```

The script automatically:

1. Collects system information.
2. Checks CPU, disk, and memory information.
3. Evaluates disk and memory usage thresholds.
4. Generates a timestamped health report.
5. Records execution events in the log file.

## Reports

Each execution generates a new timestamped report inside the `reports/` directory.

Example:

```text
reports/
└── health_report_20261109_095152.txt
```

To view the generated reports:

```bash
ls -lt reports/
```

To view a report:

```bash
cat reports/your_report_filename.txt
```

Replace the example filename with the actual generated filename.

## Logging

The project maintains an execution log at:

```text
logs/monitor.log
```

The log records events such as:

- Monitoring started.
- Health report generated.
- Monitoring completed.

To view recent log entries:

```bash
tail -n 10 logs/monitor.log
```

## Automated Scheduling with Cron

The monitoring script can be scheduled to execute automatically using Cron.

Open the user's crontab:

```bash
crontab -e
```

Example schedule for daily execution at 9:00 AM:

```bash
0 9 * * * cd /absolute/path/to/linux_system_health_monitor && /bin/bash system_health_monitor.sh
```

Replace the example directory with the actual absolute path of your project.

Cron uses the system's configured timezone.

## Learning Objectives

This project provided practical experience with:

- Linux system administration.
- Bash scripting and automation.
- Linux monitoring commands.
- Variables, functions, and conditional statements.
- Command substitution.
- Output redirection.
- Logging and error checking.
- Cron job scheduling.

## Future Improvements

- Advanced command failure detection and error handling.
- More detailed CPU and system resource alerts.
- Improved logging and monitoring.
- Additional system performance metrics.

## Author

**Mauz Khan**

GitHub: [@mauzkhan-dev](https://github.com/mauzkhan-dev)

---

*Built as a hands-on DevOps learning project.*
