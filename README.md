# ulfius-msvc

[![AppVeyor](https://img.shields.io/appveyor/ci/WebFolder/ulfius-msvc.svg?label=Windows)](https://ci.appveyor.com/project/WebFolder/ulfius-msvc)

Example project to build [ulfius](https://github.com/babelouest/ulfius) on the **Visual Studio 2017 (x86/x64)** platform.

## What is ulfius?

Web Framework to build REST APIs, Webservices or any HTTP endpoint in C language. Can stream large amount of data, integrate JSON data with Jansson, and create websocket services.

## Prerequisites

The following prerequisites required to compile ulfius on the Windows platform.

* [Visual Studio 2017](https://visualstudio.microsoft.com/downloads/)
* [vcpkg](https://github.com/Microsoft/vcpkg)

## Install

**1. Instal vcpkg**

Follow the [README.md](https://github.com/microsoft/vcpkg/blob/master/README.md) to install the vcpkg. 

**2. Set VCPKG_ROOT**

It's required to to set `VCPKG_ROOT` enviorment variable to vcpkg installation directory e.g. *C:\tools\vcpkg*

**3. Copy ulfius, yder and orcania packages to vcpkg's port directory**
```
git clone https://github.com/webfolderio/ulfius-msvc.git
cd ulfius-msvc
xcopy vcpkg %VCPKG_ROOT%\ports /S /E /Y
```

**4. Install the ulfius package**
```
vcpkg install ulfius:x64-windows-static
```

Note: *[Third-party](https://github.com/webfolderio/ulfius-msvc/blob/master/vcpkg/ulfius/CONTROL#L4) dependencies will be installed by vcpkg*.

**5. Build the example project**
```
cd example
mkdir build-x64
cd build-x64
cmake .. -DCMAKE_BUILD_TYPE=Release -DVCPKG_TARGET_TRIPLET=x64-windows-static -G"Visual Studio 15 2017 Win64"
cmake --build . --target server --config Release
cmake -- build .
```

### Build with IDE

* Make sure that [Visual C++ Tools for CMake](https://docs.microsoft.com/tr-tr/cpp/build/cmake-projects-in-visual-studio?view=vs-2017) is installed to your IDE.
* File -> Open -> CMake...
* Select the [example\CMakeLists.txt](https://github.com/webfolderio/ulfius-msvc/blob/master/example/CMakeLists.txt) file

### How it is tested
This project regularly built and tested on [Appveyor platform](https://ci.appveyor.com/project/WebFolder/ulfius-msvc).

### x86 Support

Use **x86-windows-static** vcpkg triplet and **Visual Studio 15 2017** CMake generator to build for x86 platform.

### Visual Studio 2015/2019

This example project have never been built with Visual Studio 2015/2019 but installation steps should also work for them.

### GnuTLS & WebSocket

Unfortunately ulfius Windows port does not support GnuTLS and WebSocket.
