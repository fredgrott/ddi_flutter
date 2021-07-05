# Flutter SDK Set Up

I use some specific Flutter SDK accessories and this how to set that up.

## Installation

The get to installing at least one mobile SDK as a platform target for the Flutter SDK, we need to install Git first.

### Git Installation

[Git Download](https://git-scm.com/)

Then set your path:

```text
PATH previous-entries;D:/myOpt/Git/bin/
```

We next need to install the Java JDK, as we use it to run PlantUML for generating UML graphical diagrams.

### Java SDK

One Flutter SDK accessory requires the Java SDK. We can get that from either Amazon or Microsoft:

[Amazon's Corretto JAVA JDK Distro](https://aws.amazon.com/corretto/)

[Microsoft's Build of OpenJDK](https://www.microsoft.com/openjdk)

Then the environment vars to set are:

```text
JAVA_HOME D:\myOpt\Java\JDKVersionNumber

JDK_HOME %JAVA_HOME%\jre

CLASSPATH .;%JAVA_HOME%\lib

PATH previous-entries;%JAVA_HOME%\bin
```

### Android SDK Set Up

Before you download the Android Studio IDE, set up an androidstuff folder on your hard drive. Then create an androidsdk sub-folder in the androidstuff folder.

And, yes now set some system envs before starting the installation of the Android Studio IDE you just downloaded. The envs to set are:

```text
ANDROID_SDK_ROOT   D:\androidstuff\androidsdk
ANDROID_PREFS_ROOT D:\androidstuff\androidsdk
ANDROID_EMULATOR_HOME %ANDROID_PREFS_ROOT%\.android\

```

You will set the paths of different bin tools after Android Studio installation. Reboot and install Android Studio, and it will automatically install one android SDK with the ANDROID_SDK_ROOT you have already set.

The path settings to set:

```text
PATH previous entries; %ANDROID_SDK_ROOT%\platforms;%ANDROID_SDK_ROOT%\tools;%ANDROID_SDK_ROOT%\platform
```

Now we are ready to install the Flutter SDK.

## Installing the Flutter SDK

To install the Flutter SDK, download it here:

[Flutter SDK Install](https://flutter.dev/docs/get-started/install)

The environment variables to set are:

```text
FLUTTER_SDK_ROOT D:\fluttersdk\myfluttersdk\flutter

```

And the paths to set are:

```text
PATH  previous-entries;%FLUTTER_SDK_ROOT%\bin;%FLUTTER_SDK_ROOT%\pub-cache;%FLUTTER_SDK_ROOT%\bin\cache\dark-sdk\bin;%USER_HOME%\AppData\Local\Pub

```

Now we can install the Flutter SDK accessories.

## Flutter SDK Accessories

Let's install the Flutter SDK accessories that most Flutter developers use.

### Install Graphviz

[GraphViz download](https://graphviz.org/)

```text

DOT_PATH D:\myOpt\GraphViz\bin\

```

### Install PlantUML

[PlantUML](https://plantuml.com/)

Then set the environmental variable of:

```text

PLANTUML_HOME   

```

### Install LCOV

The installation of LCOV allows us the cmd-line to generate the code coverage reports as far as unit testing. And we have to install the LCOV for our OS. With most OSes, even MS Windows, the better way is to use a package manager.

[MS Windows LCOV via Chocolately](https://community.chocolatey.org/packages/lcov)

```text
choco install lcov
```

### Dart Accessory Binaries

These Dart binaries along with the other previous installed accessories are used in the Derry YAML script to generate specific reports for build feedback.

#### Dart Code Metrics

[Dart Code Metrics](https://pub.dev/packages/dart_code_metrics)

To install:

```text

flutter pub global activate dart_code_metrics

```

#### Dart Doc and dhttpd

[DartDoc](https://pub.dev/packages/dartdoc)

To install:

```text
flutter pub global activate dartdoc

```

[dhttpd](https://pub.dev/packages/dhttpd)

And to install dhttpd:

```text
flutter pub global activate dhttpd

```

#### DCDG

[DCDG](https://pub.dev/packages/dcdg)

To install:

```text
flutter pub global activate dcdg

```

#### Derry

[Derry](https://pub.dev/packages/derry)

To install:

```text
flutter pub global activate derry

```

#### Grinder

[Grinder](https://pub.dev/packages/grinder)

To install:

```text
flutter pub global activate grinder
```

#### JunitReport

[JunitReport](https://pub.dev/packages/junitreport)

To install:

```text
flutter pub global activate junitreport
```

#### PubViz

[PubViz](https://pub.dev/packages/pubviz)

To install:

```text

flutter pub global activate pubviz

```
