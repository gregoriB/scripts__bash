cmake_build=$(cat <<EOF

if [[ -d "build" ]]; then 
    echo -e "removing build folder..." 
    rm -rf build 
fi;

echo -e "creating build folder..."
mkdir build

echo -e "building..."
cmake -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON;
cmake --build build;

echo -e "building complete"
EOF

)

task "cmake_build" "$cmake_build"
