cmake_minimum_required(VERSION 3.13)

project(mpm88)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

add_executable(mpm88 mpm88.cpp)

if("${TAICHI_REPO}" STREQUAL "")
    message(FATAL_ERROR "Set TAICHI_REPO with -DTAICHI_REPO=.. ")
endif()

target_compile_options(mpm88 PUBLIC -DTI_WITH_VULKAN=ON -DTI_INCLUDED)

# C-API Dependencies
target_include_directories(mpm88
  PRIVATE
    ${PROJECT_SOURCE_DIR}
    ${TAICHI_REPO}/c_api/include
    ${TAICHI_REPO}/c_api/src
  )

target_link_directories(mpm88
  PRIVATE
    ${PROJECT_SOURCE_DIR}
    ${TAICHI_REPO}/build
  )

target_link_libraries(mpm88 PUBLIC taichi_c_api)

# GUI Dependencies
target_include_directories(mpm88 
    PUBLIC 
        ${TAICHI_REPO}
        ${TAICHI_REPO}/taichi/backends/vulkan
        ${TAICHI_REPO}/external/Vulkan-Headers/include/
        ${TAICHI_REPO}/external/SPIRV-Tools/include/
        ${TAICHI_REPO}/external/volk/
        ${TAICHI_REPO}/external/glm/
        ${TAICHI_REPO}/external/imgui/
        ${TAICHI_REPO}/external/glfw/include
        ${TAICHI_REPO}/external/imgui/backends
        ${TAICHI_REPO}/external/eigen/
        ${TAICHI_REPO}/external/spdlog/include/
        ${TAICHI_REPO}/external/VulkanMemoryAllocator/include/
        )
