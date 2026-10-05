# AGENTS.md

Workflow-Regeln für die Zusammenarbeit in diesem Repo.

## Projekt

2D-Verkehrssimulation (Top-Down) in Godot 4 (GDScript). Lernprojekt – Erklärungen auf Deutsch, didaktisch, wenn der Nutzer nach Hilfe fragt.

## Workflow

- Nach **jedem abgeschlossenen Schritt**: committen und pushen (`main`).
- Commit-Messages: kurz, imperativ, deutsch oder englisch konsistent mit bisherigen Commits.
- **Issues und Milestones auf GitHub pflegen**: neue Aufgaben als Issue anlegen, erledigte Issues schließen (gerne mit Verweis im Commit, z. B. `Fixes #3`).
- Meilensteine:
  - M1 Setup
  - M2 Erste Fahrzeuge
  - M3 Verkehrslogik

## Technik

- Godot 4.x, Binary unter `~/.local/bin/godot`.
- Headless-Check: `godot --headless --quit` im Projektverzeichnis.
- Godot-spezifische `.gitignore` ist vorhanden; `.godot/` nicht committen.
- Szenen als `.tscn` (Textformat) speichern, Skripte in `scripts/`.
