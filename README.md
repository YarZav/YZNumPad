# YZNumPad
IOS framework to show simple number pad with decimal point

![Example](/YZNumpadExample.png)

## Features
- Swift 4.2.
- Show round number pad with decimal pad and delete buttonr.
- Only vertical landscape

## Setup

**import YZNumPad**

After that need to create configuration

**var configurator = YZNumPadViewConfiguration()**  

This configurator can be change colors, buton size border, delete button and decimal eparator symbol.

And now you can show number pad view

 **let numPadView = YZNumPadView(config: configurator)**
 
 Also need to subscribe to delegate for observing tap on buttons
 
  **numPadView.delegate = self**

## Instalation
### Cocoapods

To install it, simply add the following line to your Podfile:

pod 'YZNumPad', :git => 'https://github.com/YarZav/YZNumPad.git', :branch => 'master'

## Feedback

Feel free to create a pull request.
