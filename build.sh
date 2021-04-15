cargo rustc --release --target wasm32-unknown-unknown -- --emit=llvm-ir
mkdir -p "incremental"
sed -i "s/wasm32-unknown-unknown/ez80/" ./target/wasm32-unknown-unknown/release/deps/ti_84_poc.ll
./tools/llc --march=ez80 ./target/wasm32-unknown-unknown/release/deps/ti_84_poc.ll -o ./incremental/main.s
mkdir -p "bin"
${CEDEV}/bin/fasmg -n "${CEDEV}/meta/ld.alm" -i "DEBUG := 0" -i "STATIC := 1" -i "include \"${CEDEV}/meta/linker_script\"" -i "range .bss \$D031F6 : \$D13FD6" -i "provide __stack = \$D1A87E" -i "locate .header at \$D1A87F" -i "require __cleanup"  -i "source \"${CEDEV}/lib/shared/crt0.src\", \"./incremental/main.s\"" bin/DEMO.bin
${CEDEV}/bin/convbin --oformat 8xp --uppercase --name DEMO --input "bin/DEMO.bin" --output "bin/DEMO.8xp"