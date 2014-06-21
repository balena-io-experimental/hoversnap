# Hoversnap

Hoversnap is a node application that controls a PTP camera connected over USB
(a DSLR, or simply your smartphone) and captures picture whenever a jump is detected
using a simple DIY floor pad connected to the GPIO interface of a [Raspberry Pi][1].

## Usage

This is a [resin.io](http://resin.io) supercharged application. Clone it, push
it to your resin endpoint and you're good to go!

## Parts

The recipe for this project is as follows:

* Raspberry Pi with ethernet cable for internet connectivity and
  USB -> micro USB cable for power.
* A spare Ethernet cable
* A clothes-peg
* A piece of aluminium foil
* A breadboard, for example the [AD-102 from Maplin][2].
* Jumper wires to connect everything. For example, these
  [male-to-female connectors from Maplin][3].

## Build Instructions

### DIY Floor Switch

1. Tear ethernet cable apart
1. Wrap each part of the clothes-peg with aluminium foil
1. Connect wires to each part of the clothes-peg

### Wiring

1. Connect your camera using a USB cable to your RaspberryPi.
1. Connect the floor switch you just made to the GPIO pins of your Pi.
Here is a schematic and a diagram of the circuit:
![Circuit schematic](/docs/images/schematic.jpg)
![Circuit diagram](/docs/images/diagram.jpg)

[1]:http://www.raspberrypi.org/
[2]:http://www.maplin.co.uk/p/ad-102-breadboard-ag10l
[3]:http://www.maplin.co.uk/p/raspberry-pi-compatible-jumper-wires-malefemale-n75de
