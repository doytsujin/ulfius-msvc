set curdir=%cd%
cd /D "%~dp0"

set VCPKG_ROOT=C:\tools\vcpkg
xcopy vcpkg c:\tools\vcpkg\ports /S /E /Y
%VCPKG_ROOT%\vcpkg.exe install curl:x64-windows-static
%VCPKG_ROOT%\vcpkg.exe install jansson:x64-windows-static
%VCPKG_ROOT%\vcpkg.exe install libmicrohttpd:x64-windows-static
%VCPKG_ROOT%\vcpkg.exe install pthreads:x64-windows-static
%VCPKG_ROOT%\vcpkg.exe install yder:x64-windows-static
%VCPKG_ROOT%\vcpkg.exe install orcania:x64-windows-static
%VCPKG_ROOT%\vcpkg.exe install ulfius:x64-windows-static
cd app
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DVCPKG_TARGET_TRIPLET=x64-windows-static -G"Visual Studio 15 2017 Win64"
cmake --build . --target app --config Release
cmake -- build .

cd %curdir%