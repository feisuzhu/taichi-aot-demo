BACKEND_NAME="" # cuda, x64
TAICHI_REPO="" # example: /home/taichigraphics/workspace/taichi

AOT_DIRECTORY="/tmp/aot_files"
RUNTIME_LIB="${TAICHI_REPO}/python/taichi/_lib/runtime"

rm -rf ${AOT_DIRECTORY}
mkdir -p ${AOT_DIRECTORY}

rm -rf build && mkdir build && cd build
cmake .. -DTAICHI_REPO=${TAICHI_REPO} && make -j && cd ..

python3 comet.py --dir=${AOT_DIRECTORY} --arch=${BACKEND_NAME}

echo "TI_LIB_DIR=${RUNTIME_LIB} ./build/comet ${AOT_DIRECTORY} ${BACKEND_NAME}"
TI_LIB_DIR=${RUNTIME_LIB} ./build/comet ${AOT_DIRECTORY} ${BACKEND_NAME}
