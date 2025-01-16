# ALI SafeHealth

A lightweight FiveM script for ESX framework that saves player health and armor states without requiring a database.

## 🇬🇧 English

### Features
- Saves player health and armor automatically when disconnecting
- Restores player health and armor when rejoining
- Uses FiveM's built-in KVP (Key-Value Pairs) storage system
- No database required
- Lightweight and optimized
- Debug mode for easy monitoring

### Installation
1. Download the script
2. Place it in your resources folder
3. Add `ensure ali_safehealth` to your server.cfg
4. Restart your server

### Configuration
In `config/config.lua`:
```lua
Config.Debug = true -- Set to false to disable debug messages
```

### Dependencies
- es_extended (ESX)

---

## 🇩🇪 Deutsch

### Funktionen
- Speichert automatisch Leben und Schutzweste beim Verlassen des Servers
- Stellt Leben und Schutzweste beim erneuten Verbinden wieder her
- Nutzt FiveM's eingebautes KVP (Key-Value Pairs) Speichersystem
- Keine Datenbank erforderlich
- Ressourcenschonend und optimiert
- Debug-Modus für einfache Überwachung

### Installation
1. Skript herunterladen
2. In den resources Ordner kopieren
3. `ensure ali_safehealth` in die server.cfg einfügen
4. Server neu starten

### Konfiguration
In `config/config.lua`:
```lua
Config.Debug = true -- Auf false setzen um Debug-Nachrichten zu deaktivieren
```

### Abhängigkeiten
- es_extended (ESX)

## License
This script is released under the MIT License.

## Author
Created by AliOG // Discord: AliOG1337
