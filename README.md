# flutter_instagram_clone

Uses Firebase, BLoC.

This project is current in progress.


# Lessons
## Why use Cubit?
Cubits are great for simple screens that don't need tracking of events such as forms.

## Why use Bloc?
When tracking events are needed.


* SignupState basically a copy of the LoginState

- What is the difference between MaterialPageRoute and PageRouteBuilder?
-- MaterialPageRoute uses a builder and no transition.
-- PageRouteBuilder uses a pageBuilder instead and can have a transition.

Makes every equatable stringified for debug mode.
```
EquatableConfig.stringify = kDebugMode;
```
