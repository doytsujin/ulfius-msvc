set curdir=%cd%
cd /D "%~dp0"

xcopy vcpkg %VCPKG_ROOT%\ports /S /E /Y

vcpkg install ulfius:x64-windows-static

cd example
mkdir build-x64
cd build-x64

cmake .. -DCMAKE_BUILD_TYPE=Release -DVCPKG_TARGET_TRIPLET=x64-windows-static -G"Visual Studio 15 2017 Win64"
cmake --build . --target server --config Release
cmake -- build .

cd %curdir%