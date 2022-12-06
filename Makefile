.PHONY: setup
setup:
	use stable
	 fvm flutter upgrade
	 fvm flutter pub get
	cd ios/ && pod install && cd ..

.PHONY: dependencies
dependencies:
	fvm flutter clean &&  fvm flutter pub get dependencies &&  fvm flutter packages get

.PHONY: analyze
analyze:
	fvm flutter analyze

.PHONY: format
format:
	dart format -l 80 lib/

.PHONY: icon
icon:
	fvm flutter pub get
	fvm flutter pub run flutter_launcher_icons:main -f flutter_launcher_icon.yaml

.PHONY: splash
splash:
	fvm flutter pub get
	fvm flutter pub run flutter_native_splash:create --path=flutter_native_splash.yaml

.PHONY: test-uni-link
test-uni-link:
	 adb shell am start -a android.intent.action.VIEW \
        -c android.intent.category.BROWSABLE \
        -d "https://app.dev.astech.com/"

.PHONY: test-uni-link-reset-pass
test-uni-link-reset-pass:
	 adb shell am start -a android.intent.action.VIEW \
             -c android.intent.category.BROWSABLE \
             -d "https://app.dev.astech.com/\?page\=reset-password\&param\=https://connect.dev.astech.com/reset/MWQwOTUzOWMtNjM2MS00YTkwLTk0MDMtOWZhZTU1MmFlN2U2/besbw3-ffe2a260dfdbac484f43f88976aa8603/"

.PHONY: test-uni-link-register
test-uni-link-register:
	 adb shell am start -a android.intent.action.VIEW \
             -c android.intent.category.BROWSABLE \
             -d "https://app.dev.astech.com/"


.PHONY: build
build:
	fvm flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: watch
watch:
	fvm flutter pub run build_runner watch --delete-conflicting-outputs

.PHONY: unit-test
unit-test:
	fvm flutter test --coverage --coverage-path=./coverage/lcov.info

.PHONY: invalidate-cache
invalidate-cache:
	android/gradlew cleanBuildCache

.PHONY: staging
staging:
	fvm flutter run --release --flavor staging --target lib/main_staging.dart

.PHONY: production
production:
	fvm flutter run --release --flavor production --target lib/main_production.dart

.PHONY: development
development:
	fvm flutter run --release --flavor development --target lib/main_development.dart

.PHONY: build-dev-apk
build-dev-apk:
	fvm flutter clean
	fvm flutter pub get
	fvm flutter pub run build_runner build --delete-conflicting-outputs
	dart format -l 80 lib/
	fvm flutter build apk --release --split-per-abi --flavor development --target lib/main_development.dart

.PHONY: build-prod-apk
build-prod-apk:
	fvm flutter clean
	fvm flutter pub get
	fvm flutter pub run build_runner build --delete-conflicting-outputs
	dart format -l 80 lib/
	fvm flutter build apk --release --split-per-abi --flavor production --target lib/main_production.dart

.PHONY: bundle
bundle:
	fvm flutter clean
	fvm flutter pub get
	fvm flutter pub run build_runner build --delete-conflicting-outputs
	dart format -l 80 lib/
	fvm flutter build appbundle --flavor production --target lib/main_production.dart

.PHONY: delivery
delivery:
	fvm flutter clean
	fvm flutter pub get
	fvm flutter pub run build_runner build --delete-conflicting-outputs
	fvm format -l 80 lib/
	fvm flutter build apk --release --split-per-abi --flavor production --target lib/main_production.dart
	fvm flutter build appbundle --flavor production --target lib/main_production.dart