#include "config.h"

/************************ Example Starts Here *******************************/
#include <Adafruit_Sensor.h>
#include <DHT.h>
#include <DHT_U.h>

// pin connected to DH22 data line
#define DATA_PIN 4

// LED Pin
#define LED_2 12

// you should change these to match PWM pins on other platforms.
#define RED_PIN 18
#define GREEN_PIN 19
#define BLUE_PIN 21

// create DHT22 instance
DHT_Unified dht(DATA_PIN, DHT11);

// set up the 'temperature' and 'humidity' feeds
AdafruitIO_Feed *temperature = io.feed("Temperature");
AdafruitIO_Feed *humidity = io.feed("Humidity");

// set up the 'led' feed
AdafruitIO_Feed *led = io.feed("led-1");

// set up the 'color' feed
AdafruitIO_Feed *color = io.feed("color");

int x = 0;

void setup()
{

  // set LED pin as an output
  pinMode(LED_2, OUTPUT);

  // start the serial connection
  Serial.begin(115200);

  // wait for serial monitor to open
  while (!Serial)
    ;

#if defined(ARDUINO_ARCH_ESP32) // ESP32 pinMode
  // assign rgb pins to channels
  ledcAttachPin(RED_PIN, 1);
  ledcAttachPin(GREEN_PIN, 2);
  ledcAttachPin(BLUE_PIN, 3);
  // init. channels
  ledcSetup(1, 12000, 8);
  ledcSetup(2, 12000, 8);
  ledcSetup(3, 12000, 8);
#else
  pinMode(RED_PIN, OUTPUT);
  pinMode(GREEN_PIN, OUTPUT);
  pinMode(BLUE_PIN, OUTPUT);
#endif

  // initialize dht22
  dht.begin();

  // connect to io.adafruit.com
  Serial.print("Connecting to Adafruit IO");
  io.connect();

  led->onMessage(handleMessage);
  color->onMessage(handleMessageRGB);

  // wait for a connection
  while (io.status() < AIO_CONNECTED)
  {
    Serial.print(".");
    delay(500);
  }

  // we are connected
  Serial.println();
  Serial.println(io.statusText());

  led->get();
  color->get();
}

void loop()
{

  // io.run(); is required for all sketches.
  // it should always be present at the top of your loop
  // function. it keeps the client connected to
  // io.adafruit.com, and processes any incoming data.
  io.run();

  x++;

  if (x == 102)
  {
    sensors_event_t event;
    dht.temperature().getEvent(&event);

    float celsius = event.temperature;
    float fahrenheit = (celsius * 1.8) + 32;

    Serial.print("celsius: ");
    Serial.print(celsius);
    Serial.println("C");

    Serial.print("fahrenheit: ");
    Serial.print(fahrenheit);
    Serial.println("F");

    // save fahrenheit (or celsius) to Adafruit IO
    temperature->save(celsius);

    dht.humidity().getEvent(&event);

    Serial.print("humidity: ");
    Serial.print(event.relative_humidity);
    Serial.println("%");
    Serial.println("................");

    // save humidity to Adafruit IO
    humidity->save(event.relative_humidity);
    x = 0;
  }
}

void handleMessage(AdafruitIO_Data *data)
{
  Serial.print("received <- ");

  if (data->toPinLevel() == HIGH)
    Serial.println("HIGH");
  else
    Serial.println("LOW");
  digitalWrite(LED_2, data->toPinLevel());
}
void handleMessageRGB(AdafruitIO_Data *data)
{

  // print RGB values and hex value
  Serial.println("Received:");
  Serial.print("  - R: ");
  Serial.println(data->toRed());
  Serial.print("  - G: ");
  Serial.println(data->toGreen());
  Serial.print("  - B: ");
  Serial.println(data->toBlue());
  Serial.print("  - HEX: ");
  Serial.println(data->value());

// invert RGB values for common anode LEDs
#if defined(ARDUINO_ARCH_ESP32) // ESP32 analogWrite
  ledcWrite(1, data->toRed());
  ledcWrite(2, data->toGreen());
  ledcWrite(3, data->toBlue());
#else
  analogWrite(RED_PIN, data->toRed());
  analogWrite(GREEN_PIN, data->toGreen());
  analogWrite(BLUE_PIN, data->toBlue());
#endif
}