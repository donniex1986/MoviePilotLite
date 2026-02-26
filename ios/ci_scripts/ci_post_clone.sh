#!/bin/sh

# Fail this script if any subcommand fails.
set -e

# The default execution directory of this script is the ci_scripts directory.
cd $CI_PRIMARY_REPOSITORY_PATH # change working directory to the root of your cloned repo.

# Install Flutter using git. Use 3.38.2 to match local dev (pubspec requires sdk ^3.8.1).
git clone https://github.com/flutter/flutter.git --depth 1 -b 3.38.2 $HOME/flutter
export PATH="$PATH:$HOME/flutter/bin"

# Install Flutter artifacts for iOS (--ios), or macOS (--macos) platforms.
flutter precache --ios

# Install Flutter dependencies.
flutter pub get

# Install CocoaPods using Homebrew.
HOMEBREW_NO_AUTO_UPDATE=1 # disable homebrew's automatic updates.
brew install cocoapods

flutter build ios --config-only --release

# Install CocoaPods dependencies. --no-repo-update 避免更新 specs 导致 CI 卡住或超时。
cd ios && pod install --no-repo-update

exit 0