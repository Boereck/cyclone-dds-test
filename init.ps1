# Variables
$startdir = $pwd
$generator = "Visual Studio 15 2017"
$cyclonedir = "$startdir\cyclonedds"
$cyclonebuilddir = "$cyclonedir\build"

# Clone Cyclone DDS
# Currently no release tag, so we clone master
if(-not (Test-Path $cyclonedir)) {
	git clone https://github.com/eclipse/cyclonedds.git
} else {
	cd $cyclonebuilddir
	git pull
}

# Build & install Cyclone DDS
mkdir $cyclonebuilddir  -ErrorAction Ignore
cd $cyclonebuilddir
cmake ..\src -G $generator
start-process powershell -Wait -verb RunAs -ArgumentList "-NoProfile -Command `"cd '$cyclonebuilddir'; cmake --build . --config Release --target install`""

# Set up test project
cd $startdir
mkdir build -ErrorAction Ignore
cd build
cmake .. -G $generator
cmake --build .

cd $startdir