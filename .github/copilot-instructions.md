# GGUF-Mojo

GGUF-Mojo is a Mojo language project that provides bindings and tools for working with GGUF (GPT-Generated Unified Format) files, commonly used for AI model storage and inference. The project integrates with the ggml tensor library and gguf-tools for file manipulation.

Always reference these instructions first and fallback to search or bash commands only when you encounter unexpected information that does not match the info here.

## Working Effectively

### Prerequisites and Setup
- Install Mojo compiler from Modular:
  ```bash
  curl -s "https://get.modular.com" | sh -
  export PATH=/home/runner/.modular/bin:$PATH
  modular install mojo
  ```
  - **CRITICAL**: Mojo installation may fail in some environments. If Mojo is not available, you cannot build the Mojo components but can still work with ggml and gguf-tools.

### Bootstrap and Build Process
- Initialize git submodules (REQUIRED):
  ```bash
  git config --global url."https://github.com/".insteadOf "git@github.com:"
  git submodule update --init --recursive
  ```
  - Takes approximately 2-3 minutes to clone submodules. NEVER CANCEL.

- Build ggml library:
  ```bash
  cd ggml && mkdir build && cd build
  cmake -DBUILD_SHARED_LIBS=1 .. && cmake --build . --config Release --target ggml common common-ggml
  ```
  - Takes approximately 3-5 minutes. NEVER CANCEL. Set timeout to 10+ minutes.
  - **IMPORTANT**: Do NOT use `-DGGML_METAL=1` on Linux systems - this will fail. Metal is macOS-only.
  - Successful build creates: `libggml.so`, `libcommon.a`, `libcommon-ggml.a`

- Build gguf-tools:
  ```bash
  cd gguf-tools && make
  ```
  - Takes approximately 30-60 seconds. Build warnings about format specifiers are expected and harmless.
  - Creates executable `gguf-tools` with subcommands: show, inspect-tensor, compare, split-mixtral

- Build Mojo components (if Mojo is available):
  ```bash
  # NOTE: Makefile has a bug - it references 'make.mojo' which doesn't exist
  # Use main.mojo instead:
  mojo build main.mojo -I $(PWD)/ggml/include/ggml -L $(PWD)/ggml/build/examples/libcommon.a -L $(PWD)/ggml/build/examples/libcommon-ggml.a
  ```
  - Takes approximately 1-2 minutes if Mojo is available.

### Complete Build Process
```bash
make clean
cd ggml && mkdir build && cd build && cmake -DBUILD_SHARED_LIBS=1 .. && cmake --build . --config Release --target ggml common common-ggml
cd ../../gguf-tools && make
# If Mojo is available:
mojo build main.mojo -I $(PWD)/ggml/include/ggml -L $(PWD)/ggml/build/examples/libcommon.a -L $(PWD)/ggml/build/examples/libcommon-ggml.a
```

## Validation

### Testing Built Components
- Test ggml build validation:
  ```bash
  ls -la ggml/build/src/libggml.so ggml/build/examples/libcommon.a ggml/build/examples/libcommon-ggml.a
  ```
  - Expected output: libggml.so (~613KB), libcommon.a (~500KB), libcommon-ggml.a (~323KB)
  - All three files should exist and be non-zero size.

- Test gguf-tools validation:
  ```bash
  cd gguf-tools && ./gguf-tools --help
  ```
  - Should display: "Usage: ./gguf-tools <subcommand> [arguments...] [options...]"
  - Should list subcommands: show, inspect-tensor, compare, split-mixtral

- Test Mojo build (if available):
  ```bash
  ./main  # Should execute without errors if Mojo build succeeded
  ```

### Complete Validation Scenario
Run this complete test to verify everything works:
```bash
# 1. Check submodules are initialized
git submodule status

# 2. Validate ggml build outputs exist
ls -la ggml/build/src/libggml.so ggml/build/examples/libcommon.a ggml/build/examples/libcommon-ggml.a

# 3. Test gguf-tools functionality
cd gguf-tools && ./gguf-tools --help && cd ..

# 4. Check Mojo availability
mojo --version || echo "Mojo not available - this is expected in many environments"
```

### Known Issues and Limitations
- **Makefile Bug**: References non-existent `make.mojo` file. Use `main.mojo` instead.
- **macOS Dependency**: `main.mojo` references `./ggml-tools/gguf-tools.dSYM` which is macOS-specific. On Linux, this will cause runtime issues.
- **Mojo Availability**: Mojo compiler may not be available in all environments. Document when this prevents building.
- **Metal Support**: Only available on macOS. Remove `-DGGML_METAL=1` flag on Linux/Windows.

## Project Structure

### Key Files
- `main.mojo`: Main Mojo entry point, imports from extern_gguf
- `extern_gguf.mojo`: GGUF type definitions and external function declarations  
- `union_experiment.mojo`: Experimental code (appears incomplete)
- `Makefile`: Build configuration (contains bugs - see known issues)

### Submodules
- `ggml/`: Machine learning tensor library (from ggerganov/ggml)
- `gguf-tools/`: GGUF file manipulation tools (from antirez/gguf-tools)

### Repository Root Contents
```
.
├── .gitmodules         # Git submodule configuration
├── Makefile           # Build configuration (has bugs)
├── extern_gguf.mojo   # GGUF type definitions for Mojo
├── main.mojo          # Main Mojo application entry point
├── union_experiment.mojo  # Experimental union implementation
├── ggml/              # Submodule: ggml tensor library
└── gguf-tools/        # Submodule: GGUF file tools
```

## Common Tasks

### Working with GGUF Files
```bash
# Show GGUF file information
./gguf-tools/gguf-tools show model.gguf

# Inspect specific tensor
./gguf-tools/gguf-tools inspect-tensor model.gguf tensor_name

# Compare two GGUF files
./gguf-tools/gguf-tools compare model1.gguf model2.gguf
```

### Development Workflow
- Always build and test after making changes to Mojo files
- Use the corrected build command for Mojo (main.mojo not make.mojo)
- Test both with and without Mojo available for compatibility
- Build ggml without Metal support on non-macOS systems

## Troubleshooting

### Build Failures
- **CMake Foundation Library Error**: 
  ```
  CMake Error at src/CMakeLists.txt:298 (find_library):
    Could not find FOUNDATION_LIBRARY using the following names: Foundation
  ```
  **Solution**: Remove `-DGGML_METAL=1` flag (macOS-only). Use plain cmake command on Linux.

- **Git Submodule SSH Failure**: 
  ```
  ssh: connect to host github.com port 22: Connection timed out
  fatal: Could not read from remote repository.
  ```
  **Solution**: Run `git config --global url."https://github.com/".insteadOf "git@github.com:"`

- **Mojo Not Found**: 
  ```
  bash: mojo: command not found
  ```
  **Solution**: Install Modular CLI first, or document limitation if unavailable in environment.

- **make.mojo Not Found**: 
  ```
  mojo build make.mojo ... (file does not exist)
  ```
  **Solution**: Use `main.mojo` instead (Makefile bug - see Known Issues above).

### Expected Build Times
- **NEVER CANCEL** any build command before these timeouts:
  - Submodule initialization: 5 minutes timeout
  - ggml build: 10 minutes timeout  
  - gguf-tools build: 2 minutes timeout
  - Mojo build: 5 minutes timeout

### Build Output Validation
- ggml build should produce ~613KB libggml.so, ~500KB libcommon.a, ~323KB libcommon-ggml.a
- gguf-tools should produce working executable with help text containing "Usage: ./gguf-tools"
- Build warnings in gguf-tools about format specifiers (`%llu` vs `uint64_t`) are expected and harmless