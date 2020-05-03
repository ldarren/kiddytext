# KiddyText

This a vocabulary learning app for kids. Type a term, picture will be shown, sound will be play to help kids learn languages in a fun way

## Getting Started

- register an unsplash developer account and add to key to cfg.json
```
cp cfg.template.json cfg.json
```

## Troubleshooting

### if updated xcode is causing `error: Building for iOS, but the linked and embedded framework 'App.framework' was built for iOS Simulator. (in target 'Runner' from project 'Runner')

it usually caused by ios plugged to deevlopment machine. to resolve it, unplug the device and run following commands
```
rm -rf ios.Flutter/App.framework
flutter build ios
```

## Folder Structures
- m: models
- s: services
- v: views
- vm: view models
- w: widgets