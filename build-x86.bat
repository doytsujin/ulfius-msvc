set curdir=%cd%
cd /D "%~dp0"

xcopy vcpkg %VCPKG_ROOT%\ports /S /E /Y

vcpkg install ulfius:x86-windows-static

cd example
mkdir build-x86
cd build-x86

cmake .. -DCMAKE_BUILD_TYPE=Release -DVCPKG_TARGET_TRIPLET=x86-windows-static -G"Visual Studio 15 2017"
cmake --build . --target server --config Release
cmake -- build .

cd %curdir%