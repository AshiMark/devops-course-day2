#!/bin/bash

# 1. הגדרת משתנים
SERVER_NAME=$(hostname)
CURRENT_DATE=$(date)

# 2. חילוץ אחוז הניצול של הדיסק (מחלץ רק את המספר 95)
USAGE=$(df -h / | grep -o '[0-9]\+%' | tr -d '%')

echo "=== דוח מצב שרת: $SERVER_NAME ==="
echo "זמן בדיקה: $CURRENT_DATE"
echo "אחוז תפוסת הדיסק: $USAGE%"
echo "-----------------------------------"

# 3. תנאי: אם התפוסה גדולה מ-80%
if [ "$USAGE" -gt 80 ]; then
    echo "⚠️ אזהרה: שטח הדיסק קריטי! ($USAGE% בשימוש)"
else
    echo "✅ מצב הדיסק תקין."
fi

# 3. תנאי וכתיבה לקובץ לוג
LOG_FILE="server_health.log"

if [ "$USAGE" -gt 80 ]; then
    MESSAGE="⚠️ אזהרה: שטח הדיסק קריטי! ($USAGE% בשימוש)"
else
    MESSAGE="✅ מצב הדיסק תקין."
fi

# הדפסה למסך
echo "$MESSAGE"

# שמירת התיעוד לקובץ לוג (עם תאריך ושם השרת)
echo "[$CURRENT_DATE] [$SERVER_NAME] - $MESSAGE" >> $LOG_FILE