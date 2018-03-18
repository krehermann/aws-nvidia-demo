# Cribbed from
# https://www.learnopencv.com/install-opencv3-on-ubuntu/

#!/bin/bash

#Remove any previous installations of x264</h3>
sudo apt-get remove x264 libx264-dev


sudo apt-get install build-essential checkinstall cmake pkg-config yasm
sudo apt-get install git gfortran
sudo apt-get install libjpeg8-dev libjasper-dev libpng12-dev

# If you are using Ubuntu 16.04
sudo apt-get install libtiff5-dev

sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
sudo apt-get install libxine2-dev libv4l-dev
sudo apt-get install libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev
sudo apt-get install qt5-default libgtk2.0-dev libtbb-dev
sudo apt-get install libatlas-base-dev
sudo apt-get install libfaac-dev libmp3lame-dev libtheora-dev
sudo apt-get install libvorbis-dev libxvidcore-dev
sudo apt-get install libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt-get install x264 v4l-utils

# Optional dependencies
sudo apt-get install libprotobuf-dev protobuf-compiler
sudo apt-get install libgoogle-glog-dev libgflags-dev
sudo apt-get install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen

if [ -z $APP_ROOT ]; then
    echo "APP_ROOT not set" 1>&2
    exit 1
fi

# Setup directories for opencv source
OPENCV_ROOT=${APP_ROOT}/opencv
mkdir $OPENCV_ROOT
cd $OPENCV_ROOT

# Checkout opencv and opencv-contrib from git
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout 3.3.1
cd $OPENCV_ROOT
git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib
git checkout 3.3.1


# Configure
mkdir -p $OPENCV_ROOT/build
cd $OPENCV_ROOT/build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_C_EXAMPLES=ON \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D WITH_TBB=ON \
      -D WITH_V4L=ON \
      -D WITH_QT=ON \
      -D WITH_OPENGL=ON \
      -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
      -D BUILD_EXAMPLES=ON ..

# Compile and install
make -j4
sudo make install
sudo sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig
