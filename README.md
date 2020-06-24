# appium_test
The demo test case of IOS appium automation

## Usage

**1. Run the robot framework with command.**

```
robot appiumios/testcase/test_twitch.robot
```
For more command example:
* Run specific device & os E.g.
```
robot -v "DEVICE_NAME:iPhone 11" -v PLATFORM_NAME:IOS appiumios/testcase/test_twitch.robot
```
* Run specific test case. E.g.
```
robot -t 'Check twitch video playing with video searh list' appiumios/testcase
```
