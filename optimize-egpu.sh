#!/bin/bash
# Erlaube persistente Einstellungen
nvidia-smi -i 1 -pm 1
# Setze das Power Limit auf 260 Watt
nvidia-smi -i 1 -pl 260
# Fixiere den Kerntakt auf einen effizienten Wert
# Finde heraus, wie hoch deine Karte taktet, während der llama-server läuft:
# nvidia-smi --query-gpu=clocks.current.graphics,clocks.current.memory --format=csv -l 
nvidia-smi -i 1 -lgc 1500
