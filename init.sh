mkdir ./cyclonedds/build-linux
cd ./cyclonedds/build-linux
cmake ../src
make
sudo make install

cd ../..
mkdir build-linux
cd build-linux
cmake ..
cmake --build .