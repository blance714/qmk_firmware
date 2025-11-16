# NuPhy Air75 V2 with Apple Globe Key Support

A QMK firmware configuration for the NuPhy Air75 V2 keyboard with full Apple Globe (🌐) key support.

## Features

- ✅ **Apple Globe Key (KC_GLOBE)** - Full support for macOS Globe key
- ✅ **Globe as Modifier** - Can be used as modifier key (Globe+other keys)
- ✅ **RGB Matrix** - Full RGB backlighting support
- ✅ **VIA Support** - Dynamic keymap configuration
- ✅ **macOS Optimized** - Uses Apple VID/PID for native Globe key functionality

## Hardware

- **MCU**: STM32F072
- **Matrix**: 6 rows × 17 columns
- **Layout**: 75% ANSI (84 keys)
- **RGB**: WS2812 RGB Matrix

## Important Notes

### Apple VID/PID Configuration

This firmware uses Apple's Vendor ID and Product ID:
- **VID**: `0x05AC` (Apple Inc.)
- **PID**: `0x024F` (Apple Aluminium Keyboard)

⚠️ **Why?** The Globe key only functions properly on macOS when the keyboard is identified as an Apple device. This is a macOS kernel requirement, not a QMK limitation.

### Globe Key Functionality

- **Single Press**: Opens emoji picker / character viewer
- **As Modifier**: Works with most keys (Globe+Q, Globe+E, etc.)
- **Known Limitations**:
  - Globe+F1-F12 may not work as expected
  - Globe+Arrow keys may have limited functionality
  - This is due to macOS kernel-level restrictions

## Building the Firmware

### Prerequisites

```bash
# Install QMK CLI
python3 -m pip install --user qmk

# Setup QMK (first time only)
qmk setup
```

### Compile

```bash
# Default keymap
qmk compile -kb nuphy/air75_v2 -km default

# VIA keymap (for VIA configurator)
qmk compile -kb nuphy/air75_v2 -km via
```

### Flash

```bash
# Put keyboard in bootloader mode, then:
qmk flash -kb nuphy/air75_v2 -km default
```

## Keymaps

### Default Layer (Layer 0)
Standard QWERTY layout with Fn key to access Layer 1.

### Function Layer (Layer 1)
- `Fn + 1-12`: F1-F12 keys
- `Fn + RGB keys`: RGB control
- `Fn + Right GUI`: **Globe Key** 🌐
- `Fn + Arrow keys`: Media controls
- Mission Control and Launchpad keys available

## Customization

You can customize your keymap using:
1. **VIA Configurator**: Flash the `via` keymap and use [https://usevia.app](https://usevia.app)
2. **Edit keymap.c**: Modify `keyboards/nuphy/air75_v2/keymaps/default/keymap.c`

### Using KC_GLOBE

In your keymap, you can use:
- `KC_GLOBE` or `KC_GLOB` - The Apple Globe key

Example:
```c
[1] = LAYOUT_75_ansi(
    ...,
    KC_GLOBE,  // Globe key
    ...
)
```

## Credits

- Keyboard: NuPhy Air75 V2
- Firmware: QMK
- Globe Key Implementation: Based on community research and Apple HID specifications

## License

GPL-2.0-or-later
