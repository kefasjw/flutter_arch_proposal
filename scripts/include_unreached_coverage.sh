#!/bin/sh

outputFile="$(pwd)/test/coverage_helper_test.dart"
packageName="$(cat pubspec.yaml| grep '^name: ' | awk '{print $2}')"

if [ "$packageName" = "" ]; then
    echo "Run $0 from the root of your Dart/Flutter project"
    exit 1
fi

if [ ! -d "test" ]; then
  mkdir "test"
fi

echo "// GENERATED CODE - DO NOT MODIFY BY HAND" > "$outputFile"
echo "// Include unreached files in test coverage https://github.com/flutter/flutter/issues/27997#issue-410722816\n" >> "$outputFile"
echo "// ignore_for_file: type=lint" >> "$outputFile"
echo "// ignore_for_file: unused_import, directives_ordering\n" >> "$outputFile"
echo "import 'package:flutter_test/flutter_test.dart';" >> "$outputFile"
find lib -name '*.dart' | grep -v '.g.dart' | grep -v '.freezed.dart' | grep -v 'generated_plugin_registrant' | awk -v package=$packageName '{gsub("^lib", "", $1); printf("import '\''package:%s%s'\'';\n", package, $1);}' >> "$outputFile"
echo "\nvoid main() {\n  test('', () {});\n}" >> "$outputFile"
