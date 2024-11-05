# Home-Fi: Smart Home Automation System

<div align="center">
  <img src="assets/readmeFiles/Home-Fi.png" width="700" alt="Home-Fi Logo">

  [![Flutter](https://img.shields.io/badge/Flutter-2.0+-blue.svg)](https://flutter.dev/)
  [![ESP32](https://img.shields.io/badge/ESP32-Compatible-brightgreen.svg)](https://www.espressif.com/)
  [![Adafruit IO](https://img.shields.io/badge/Adafruit%20IO-Connected-red.svg)](https://io.adafruit.com/)
  
  <p>
    A modern home automation solution combining Flutter's beautiful UI with ESP32's powerful capabilities and Adafruit IO's reliable cloud infrastructure.
  </p>
</div>

## ✨ Features

- 🏠 Control multiple home appliances remotely
- 💡 RGB light control with color picker
- 📊 Real-time device status monitoring
- 🌡️ Temperature and humidity sensing
- 🔐 Secure communication with Adafruit IO
- 📱 Beautiful, responsive Flutter UI
- ⚡ Low-latency ESP32 control

## 🎯 System Architecture

```
Mobile App (Flutter) <-> Adafruit IO Cloud <-> ESP32 Device <-> Home Appliances
```

- **Flutter App**: Handles user interface and cloud communication
- **Adafruit IO**: Manages device state and real-time data
- **ESP32**: Controls physical devices and sensors

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (2.0 or higher)
- Arduino IDE
- ESP32 Development Board
- Adafruit IO Account
- Basic electronic components (relays, RGB LED, sensors)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/home-fi.git
   cd home-fi
   ```

2. **Set up Flutter app**
   ```bash
   flutter pub get
   ```

3. **Configure Adafruit IO**
   - Create an Adafruit IO account
   - Set up required feeds (switches, RGB values, sensor data)
   - Copy your AIO Key

4. **ESP32 Setup**
   - Install required libraries in Arduino IDE
   - Update credentials in ESP32 code
   ```cpp
   #define IO_USERNAME  "your_username"
   #define IO_KEY       "your_aio_key"
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

## 📱 User Interface

<div align="center">
  <table>
    <tr>
      <td><img src="assets/readmeFiles/1_Splash.gif" width="240" alt="Splash Screen"/></td>
      <td><img src="assets/readmeFiles/2_Dash.jpg" width="240" alt="Dashboard"/></td>
      <td><img src="assets/readmeFiles/3_RGB.jpg" width="240" alt="RGB Control"/></td>
    </tr>
    <tr>
      <td align="center">Splash Screen</td>
      <td align="center">Dashboard</td>
      <td align="center">RGB Control</td>
    </tr>
  </table>
</div>

## 🛠️ Hardware Setup

### Components Required
- ESP32 Development Board
- Relay Module (for appliance control)
- RGB LED Strip
- DHT11/DHT22 Sensor (optional)
- Power Supply
- Connecting Wires

## 📡 Communication Protocol

The system uses MQTT protocol for communication:
- **Topics**: Organized by device type (switches/rgb/sensors)
- **Message Format**: JSON payloads for complex data
- **Update Frequency**: Real-time for switches, 1s for sensor data

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Adafruit for their reliable IoT platform
- ESP32 community for their extensive documentation

## ☕ Support

<a href="https://www.buymeacoffee.com/jobinbiju234" target="_blank">
  <img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" height="50" alt="Buy Me A Coffee">
</a>
