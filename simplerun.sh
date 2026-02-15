#!/bin/bash
# Web Site: www.cansahin.tr
# Project: simplerun.cansahin.tr
# Author: CanSQL
set -e

#-------
# Colors
source <(curl -sSL https://static.cansahin.tr/beacol/color.sh)
#-------

clear
echo -e "${PURPLE}${BOLD}====================================================${RESET}"
echo -e "${PURPLE}${BOLD}    ____  _                 __     ____             ${RESET}"
echo -e "${PURPLE}${BOLD}   / ___|(_)_ __ ___  _ __ |  |   |  _ \\ _   _ _ __ ${RESET}"
echo -e "${PURPLE}${BOLD}   \\___ \\| | '_ ' _ \\| '_ \\|  |   | |_) | | | | '_ \\ ${RESET}"
echo -e "${PURPLE}${BOLD}    ___) | | | | | | | |_) |  |___|  _ <| |_| | | | |${RESET}"
echo -e "${PURPLE}${BOLD}   |____/|_|_| |_| |_| .__/|______| | \\_\\\\__,_|_| |_|${RESET}"
echo -e "${PURPLE}${BOLD}                     |_|                            ${RESET}"
echo -e "${PURPLE}${BOLD}====================================================${RESET}"
echo -e "${CYAN}${BOLD}       >> Minecraft 'start.sh' Generator <<         ${RESET}"
echo -e "${CYAN}             simplerun.cansahin.tr                  ${RESET}"
echo -e "${PURPLE}${BOLD}====================================================${RESET}"
echo ""

echo -e "${BOLD}${WHITE}🔸 STEP 1: MEMORY ALLOCATION${RESET}"
while true; do
    read -e -p "$(echo -e "${YELLOW}   ➤ RAM to allocate (in MB, e.g. 2048): ${RESET}")" RAM_MB
    if [[ "$RAM_MB" =~ ^[0-9]+$ ]] && [ "$RAM_MB" -gt 0 ]; then break;
    else echo -e "   ${RED}⚠ Invalid RAM amount. Please enter numbers only.${RESET}"; fi
done

echo -e "\n${BOLD}${WHITE}🔸 STEP 2: SERVER DIRECTORY${RESET}"
while true; do
    DEFAULT_PATH=$(pwd)
    read -e -p "$(echo -e "${YELLOW}   ➤ Installation Path [Default: $DEFAULT_PATH]: ${RESET}")" SERVER_PATH
    SERVER_PATH=${SERVER_PATH:-$DEFAULT_PATH}
    if [ -n "$SERVER_PATH" ]; then
        SERVER_PATH=$(mkdir -p "$SERVER_PATH" && cd "$SERVER_PATH" && pwd)
        break
    else echo -e "   ${RED}⚠ Path cannot be empty.${RESET}"; fi
done

echo -e "\n${BOLD}${WHITE}🔸 STEP 3: JAR FILE SELECTION${RESET}"
while true; do
    read -e -p "$(echo -e "${YELLOW}   ➤ Server JAR file name (e.g. paper.jar): ${RESET}")" JAR_FILE
    if [[ "$JAR_FILE" == *.jar ]]; then break;
    else echo -e "   ${RED}⚠ Please provide a valid '.jar' file name.${RESET}"; fi
done

echo -e "\n${BOLD}${WHITE}🔸 STEP 4: JAVA OPTIMIZATION${RESET}"
echo -e "   ${CYAN}1)${RESET} Standard   ${WHITE}(Aikar's Recommended Flags)${RESET}"
echo -e "   ${CYAN}2)${RESET} Aggressive ${WHITE}(Max Performance for Large Servers)${RESET}"
echo -e "   ${CYAN}3)${RESET} Vanilla    ${WHITE}(Default Java Garbage Collection)${RESET}"

while true; do
    read -p "$(echo -e "${YELLOW}   ➤ Choose [1-3]: ${RESET}")" FLAG_CHOICE
    case $FLAG_CHOICE in
        1) FLAGS="-XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true"; break ;;
        2) FLAGS="-XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=40 -XX:G1MaxNewSizePercent=50 -XX:G1HeapRegionSize=16M -XX:G1ReservePercent=15 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true"; break ;;
        3) FLAGS=""; break ;;
        *) echo -e "   ${RED}⚠ Select a valid option (1-3).${RESET}" ;;
    esac
done

echo -e "\n${BOLD}${WHITE}🔸 STEP 5: REMOTE MONITORING${RESET}"
read -e -p "$(echo -e "${YELLOW}   ➤ Discord Webhook URL (Press Enter to Skip): ${RESET}")" DISCORD_URL

echo -e "\n${PURPLE}${BOLD}----------------------------------------------------${RESET}"
echo -e " ${BOLD}PREVIEW SETTINGS${RESET}"
echo -e " ${WHITE}RAM      :${RESET} ${GREEN}${RAM_MB}M${RESET}"
echo -e " ${WHITE}Path     :${RESET} ${GREEN}${SERVER_PATH}${RESET}"
echo -e " ${WHITE}JAR      :${RESET} ${GREEN}${JAR_FILE}${RESET}"
echo -e " ${WHITE}Webhook  :${RESET} ${GREEN}${DISCORD_URL:-Disabled}${RESET}"
echo -e "${PURPLE}${BOLD}----------------------------------------------------${RESET}"

while true; do
    read -e -p "$(echo -e "${BOLD}${YELLOW}   Generate script now? [Y/n]: ${RESET}")" yn
    if [[ "$yn" == "n" || "$yn" == "N" ]]; then echo -e "${RED}Setup aborted.${RESET}"; exit 1;
    elif [[ "$yn" == "y" || "$yn" == "Y" || -z "$yn" ]]; then break;
    else echo -e "${RED}Please enter 'y' or 'n'.${RESET}"; fi
done

OUTPUT_FILE="$SERVER_PATH/start.sh"
cat << 'EOF' > "$OUTPUT_FILE"
#!/bin/bash
# Clear trap for clean exit
trap 'echo -e "\n\nStopping Server Loop..."; kill $JAVA_PID 2>/dev/null; exit 0' INT TERM
EOF

cat <<EOF >> "$OUTPUT_FILE"
MIN_RAM="${RAM_MB}M"
MAX_RAM="${RAM_MB}M"
JAR_FILE="$JAR_FILE"
SERVER_DIR="$SERVER_PATH"
WEBHOOK_URL="$DISCORD_URL"
AIKAR_FLAGS="$FLAGS"
EOF

cat << 'EOF' >> "$OUTPUT_FILE"
send_notification() {
    if [ -n "$WEBHOOK_URL" ]; then
        local timestamp=$(date -u +%Y-%m-%dT%H:%M:%SZ)
        curl -s -H "Content-Type: application/json" -X POST -d "{
            \"embeds\": [{
                \"title\": \"🛡️ SimpleRun Server Monitor\",
                \"description\": \"$1\",
                \"color\": $2,
                \"timestamp\": \"$timestamp\",
                \"footer\": { \"text\": \"System Status: Active\" }
            }]
        }" "$WEBHOOK_URL" > /dev/null 2>&1
    fi
}

if ! command -v java &> /dev/null; then echo "Error: Java not found."; exit 1; fi
cd "$SERVER_DIR" || exit 1

while true
do
    START_TIME=$SECONDS
    JAVA_VER=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')
    OS_INFO=$(uname -sr)
    
    send_notification "🚀 **Server is initializing...**\n\n**Environment:** \`$OS_INFO\`\n**Java:** \`$JAVA_VER\`\n**Memory:** \`$MAX_RAM\`\n**File:** \`$JAR_FILE\`" 65280
    
    java -Xms$MIN_RAM -Xmx$MAX_RAM $AIKAR_FLAGS -jar "$JAR_FILE" nogui &
    JAVA_PID=$!
    wait $JAVA_PID
    
    EXIT_CODE=$?
    ELAPSED_TIME=$(( SECONDS - START_TIME ))
    UPTIME_STR=$(printf '%dh %dm %ds' $((ELAPSED_TIME/3600)) $(( (ELAPSED_TIME%3600)/60 )) $((ELAPSED_TIME%60)))

    if [ $EXIT_CODE -eq 0 ] || [ $EXIT_CODE -eq 130 ]; then
        send_notification "✅ **Server stopped normally.**\n\n**Last Uptime:** \`$UPTIME_STR\`" 255
        echo "Server stopped. Exiting loop."
        break
    else
        send_notification "🚨 **Server Crashed!**\n\n**Exit Code:** \`$EXIT_CODE\`\n**Last Uptime:** \`$UPTIME_STR\`\n\n🔄 Restarting in 5s..." 16711680
        echo "Crashed. Press CTRL+C to stop restart."
        sleep 5
    fi
done
EOF

chmod +x "$OUTPUT_FILE"

echo ""
echo -e "${GREEN}${BOLD}    ************************************************${RESET}"
echo -e "${GREEN}${BOLD}    * *${RESET}"
echo -e "${GREEN}${BOLD}    * INSTALLATION COMPLETED SUCCESSFULLY     *${RESET}"
echo -e "${GREEN}${BOLD}    * *${RESET}"
echo -e "${GREEN}${BOLD}    ************************************************${RESET}"
echo ""
echo -e " ${WHITE}➤ Script Location :${RESET} ${YELLOW}$OUTPUT_FILE${RESET}"
echo -e " ${WHITE}➤ Execution       :${RESET} ${CYAN}cd $SERVER_PATH && ./start.sh${RESET}"
echo ""
echo -e "${PURPLE}${BOLD} SimpleRun: Your terminal, your rules. Enjoy!${RESET}"
echo ""