#!/usr/bin/env bash

set -e

projectDir=$(cd "$(dirname ${BASH_SOURCE[0]})/.." && pwd)

developmentTeam="$1"

if [ -z "$developmentTeam" ]; then
    echo "You have to provide a development team id as the first argument."
    exit 1
fi

cmd="$2"

if [ -z "$cmd" ]; then
    echo "You have to provide the command to run as the second argument."
    exit 1
fi

archivesDir="$projectDir/build/xcode/archives"
xcframeworksDir="$projectDir/build/xcode/xcframeworks"
cblFlutterFrameworksDir="$projectDir/packages/cbl_flutter_apple/Frameworks"

scheme=CBL_Dart_All
frameworks=(CBLDart CouchbaseLite)
platforms=(iOS "iOS Simulator" macOS)

function buildArchives() {
    for platform in "${platforms[@]}"; do
        echo Building platform "$platform"

        local destination="generic/platform=$platform"

        xcodebuild archive \
            -scheme "$scheme" \
            -destination "$destination" \
            -archivePath "$archivesDir/$scheme-$platform" \
            SKIP_INSTALL=NO \
            BUILD_FOR_DISTRIBUTION=YES \
            DEVELOPMENT_TEAM=$developmentTeam \
            CODE_SIGN_IDENTITY="Apple Development" \
            CODE_SIGN_STYLE=Automatic
    done
}

function createXcframeworks() {
    for framework in "${frameworks[@]}"; do
        echo Creating xcframework "$framework"

        local frameworksArgs=()

        for platform in "${platforms[@]}"; do
            frameworksArgs+=(
                "-framework"
                "$archivesDir/$scheme-$platform.xcarchive/Products/Library/Frameworks/$framework.framework"
                "-debug-symbols"
                "$archivesDir/$scheme-$platform.xcarchive/dSYMs/$framework.framework.dSYM"
            )
        done

        xcodebuild -create-xcframework \
            "${frameworksArgs[@]}" \
            -output "$xcframeworksDir/$framework.xcframework"
    done
}

function copyToCblFlutter() {
    rm -rf "$cblFlutterFrameworksDir"
    mkdir -p "$cblFlutterFrameworksDir"

    for framework in "${frameworks[@]}"; do
        local srcPath="$xcframeworksDir/$framework.xcframework"

        cp -a "$srcPath" "$cblFlutterFrameworksDir"
    done
}

"$cmd"
