#!/bin/bash
# CB1 + 5GHz USB 동글용 Wi-Fi 고정 스크립트 (SSH 안 끊기게 버전)

SSID="AX6000_5G"                       # 5GHz SSID
BSSID="A4:39:B3:D8:81:E5"              # 지금 연결된 AP의 BSSID (고정)

IFACE_MAIN="wlxb0386cf5cfa7"           # 실제 사용하는 USB Wi-Fi 동글
IFACE_DISABLE_1="wlan0"                # 안 쓸 내장/다른 Wi-Fi 인터페이스
IFACE_DISABLE_2="wlan1"

WIFI_PASS="여기에_5G_실제_비밀번호_입력"   # <<< 이거만 네 비번으로 바꿔줘!

set -e

echo "✔ 안 쓰는 Wi-Fi 인터페이스 비활성화 (wlan0 / wlan1 있을 때만)"
for IFACE in "$IFACE_DISABLE_1" "$IFACE_DISABLE_2"; do
  if nmcli device status | grep -q "^${IFACE}"; then
    nmcli device set "${IFACE}" managed no || true
    ip link set "${IFACE}" down || true
  fi
done

echo "✔ '$SSID' 프로필 존재 확인"
if ! nmcli -t -f NAME connection show | grep -qx "$SSID"; then
  echo "  - '$SSID' 연결 프로필 없음 → 새로 생성"
  nmcli connection add type wifi ifname "$IFACE_MAIN" con-name "$SSID" ssid "$SSID"
  nmcli connection modify "$SSID" wifi-sec.key-mgmt wpa-psk
  nmcli connection modify "$SSID" wifi-sec.psk "$WIFI_PASS"
else
  echo "  - 기존 '$SSID' 프로필 발견 → 수정 모드"
fi

echo "✔ ${IFACE_MAIN}에 고정 & 자동 연결/절전 설정 & BSSID 고정"
nmcli connection modify "$SSID" \
  connection.interface-name "$IFACE_MAIN" \
  connection.autoconnect yes \
  connection.autoconnect-retries 0 \
  802-11-wireless.powersave 2 \
  connection.lldp disable \
  802-11-wireless.bssid "$BSSID"

echo "✔ 현재 ${IFACE_MAIN} 활성 상태 확인"
ACTIVE=$(nmcli -t -f NAME,DEVICE connection show --active | grep ":${IFACE_MAIN}$" || true)

if echo "$ACTIVE" | grep -qx "$SSID:${IFACE_MAIN}"; then
  echo "⚠ 지금 SSH가 '${SSID}' (${IFACE_MAIN}) 위에서 돌아가는 중이라"
  echo "   연결 down/up는 건너뜁니다. (끊기면 곤란하니까요)"
  echo "   설정은 이미 저장됐고, 필요하면 나중에 수동으로:"
  echo "     nmcli connection down \"$SSID\""
  echo "     nmcli connection up \"$SSID\""
else
  echo "✔ 현재 '${SSID}'로 붙어있지 않음 → 안전하게 재연결 시도"
  nmcli connection down "$SSID" || true
  nmcli connection up "$SSID"
fi

echo "🎉 설정 저장 완료 — 다음 부팅부터 ${IFACE_MAIN} -> ${SSID} (BSSID=$BSSID)로 자동 연결됩니다."
