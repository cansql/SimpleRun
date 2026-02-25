# SimpleRun (Minecraft Server Starter)

<p align="center">
  <img src="https://static.cansahin.tr/images/simplerun-banner.jpg" alt="SimpleRun Banner" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License">
  <img src="https://img.shields.io/badge/version-v0.1.0-green.svg" alt="Version">
  <img src="https://img.shields.io/badge/shell-bash-lightgrey.svg" alt="Shell">
  <img src="https://img.shields.io/badge/platform-linux-orange.svg" alt="Platform">
</p>

**SimpleRun** is a modern, interactive CLI engine designed to generate optimized `start.sh` scripts for Linux-based Minecraft servers. It automates performance tuning and monitoring setup through a single command.

---

## 🛠 Key Features

### 🚀 JVM Performance Tuning
* **Aikar's Flags Integration:** Automated GC configuration with 3 presets: **Standard**, **Aggressive**, and **Vanilla**.
* **Low-Latency Focus:** Pre-configured JVM parameters to maintain stable TPS and minimize garbage collection spikes.

### 📊 Monitoring & Automation
* **Discord Webhook Integration:** Instant notifications for server events: **Start**, **Stop**, and **Crash**.
* **Advanced Tracking:** Reports uptime, Java version, and OS environment details directly to your Discord channel.
* **Smart Auto-Restart:** Automatically recovers from crashes while respecting manual `/stop` commands.

### 🛡 Security & UX
* **Modern CLI:** A sleek, step-by-step installation wizard within the terminal.
* **Sanitized Code:** Input validation to prevent shell injection vulnerabilities.

---

## ⚡ Quick Installation

Run the generator instantly by pasting the following command into your terminal:

```bash
bash <(curl -sSL get.cansahin.tr/simplerun.sh)
