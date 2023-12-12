#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Removes the original configuration files and creates a symlink to the repository ones

BASEDIR="$(dirname "$(realpath "$0")")"

rm -f "$HOME/.gradle/gradle.properties"
mkdir -p "$HOME/.gradle"
ln -sf "$BASEDIR/gradle.properties" "$HOME/.gradle/gradle.properties"

rm -f "$HOME/.sdkman/etc/config"
ln -sf "$BASEDIR/sdk.config" "$HOME/.sdkman/etc/config"

rm -f "$HOME/.fleet/settings.json"
ln -sf "$BASEDIR/fleet_settings.json" "$HOME/.fleet/settings.json"
