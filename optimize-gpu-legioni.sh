#!/bin/bash
# EGPU-Tuning für RTX 3090 (nvidia-smi Index 1, Bus 0A) — empirisch ermittelt am 29.10.,
# gemessen gegen den laufenden llama-server (Port 9931), siehe bench-egpu-results.json:
#
#   Einstellung              pp tok/s   tg tok/s   max Temp
#   260W + Clock fix 1500    ~1109      ~37.5      53°C     (alter Zustand)
#   260W + Auto-Boost         ~1116     ~42.9      53°C     → nur Unlock: tg +14%
#   350W + Auto-Boost        ~1232      ~43.7      57°C
#   400W + Auto-Boost        ~1276     ~49.8       60°C     ← BESTE (pp +15%, tg +33%)
#   Memory-Clock fix 9751    kein Vorteil gegenüber Auto-Boost → nicht nötig
#
# Fazit: Karte ist thermisch völlig unbelastet (Ziel-Temp ~83–90°C, HW-Thermal nie aktiv).
# Der alte Lock auf 1500MHz + 260W war reines Self-Throttling. Power-Limit ist nur eine
# Obergrenze — im Idle zieht die Karte trotzdem wenig (P-State), Auto-Boost taktet unter
# Last hoch und runtertacktet zwischen Requests automatisch.

set -e
GPU=0   # nvidia-smi-Index der RTX 3090 (EGPU). ACHTUNG: CUDA-Ordinal ist hier 0!

# Persistente Einstellungen über Neustarts/Reloads hinweg erhalten
nvidia-smi -i $GPU -pm 0 

# Power-Limit auf Maximum (400W = Obergrenze der Karte, Default wäre 350W)
nvidia-smi -i $GPU -pl 400 

# Kerntakt NICHT fixieren: frühere Locks entfernen und Auto-Boost freilassen.
# nvidia-smi erlaubt nur EINE Änderung pro Aufruf → separate Befehle!
nvidia-smi -i $GPU -rgc
nvidia-smi -i $GPU -rmc

# Kontrolle (optional):
#   nvidia-smi -q -d PERFORMANCE -i 1        # Throttle-Reasons (SW Power Cap bei pp-Bursts ist normal)
#   watch -n2 'nvidia-smi --query-gpu=power.draw,clocks.current.graphics,temperature.gpu --format=csv,noheader -i 1'
