
DIR="build"
if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  echo "${DIR} directory exists, removing old build..."
  cd build
  rm -r *
else
  ###  Control will jump here if $DIR does NOT exists ###
  echo "${DIR} directory not exists, create one..."
  mkdir build
  cd build
fi

cmake \
-DANDROID_ABI=arm64-v8a \
-DANDROID_NDK=/home/photon/Android/Sdk/ndk/21.3.6528147 \
-DCMAKE_TOOLCHAIN_FILE=/home/photon/Android/Sdk/ndk/21.3.6528147/build/cmake/android.toolchain.cmake \
-DANDROID_NATIVE_API_LEVEL=28 \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=install \
-DANDROID_STL=c++_shared \
-DBUILD_SHARED_LIBS=ON \
-DQML_LIBRARY=/home/photon/Documents/sparse-solver/QML/1.4.0/arm64/ilp64/lib/libQML-1.4.0.so \
-DEIGEN3_DIR=/home/photon/Documents/sparse-solver/eigen-3.3.7 \
-DGFLAGS_DIR=/home/photon/Documents/gflags-master/build \
-DSUITESPARSE_DIR=/home/photon/Documents/sparse-solver/suitesparse-metis-for-windows/build/install \
-DCERES_THREADING_MODEL=OPENMP \
-DCXX_SHARED_LIB=/home/photon/Android/Sdk/ndk/21.3.6528147/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/lib/aarch64-linux-android/libc++_shared.so \
..


make -j8
