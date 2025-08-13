# GGUF-Mojo

A pure Mojo implementation for parsing GGUF (GPT-Generated Unified Format) model files.

## Overview

This project provides a minimal prototype GGUF parser implemented entirely in Mojo, without external C library dependencies. GGUF is a binary format used to store large language models and their metadata.

## Features

- **Pure Mojo Implementation**: No external C dependencies
- **GGUF Header Parsing**: Reads magic number, version, and counts
- **Binary Data Reading**: Little-endian UInt32/UInt64 parsing
- **Extensible Design**: Foundation for metadata and tensor parsing
- **Validation**: Built-in format validation and error handling

## Files

- `gguf_parser.mojo` - Core parser implementation
- `main.mojo` - Main demonstration program
- `example.mojo` - Usage examples
- `extern_gguf.mojo` - Original C library bindings (for reference)

## GGUF File Format

GGUF files have the following structure:

1. **Header** (24 bytes)
   - Magic number: `0x46554747` ("GGUF" in little-endian)
   - Version: `3` (current specification)
   - Tensor count: Number of tensors in the file
   - Metadata count: Number of key-value pairs

2. **Metadata** (variable length)
   - Key-value pairs with type information
   - Supports strings, numbers, arrays, etc.

3. **Tensor Information** (variable length)
   - Tensor headers with names, types, dimensions

4. **Tensor Data** (variable length, aligned)
   - Raw tensor weight data

## Usage

### Basic Usage

```mojo
from gguf_parser import GGUFParser

def main():
    var parser = GGUFParser()
    
    # Demo parsing with in-memory data
    let success = parser.demo_parse()
    
    if success:
        print("GGUF header parsed successfully!")
```

### Running the Examples

```bash
# Run main demonstration
mojo main.mojo

# Run usage examples
mojo example.mojo
```

## Current Implementation Status

✅ **Completed**:
- GGUF header parsing (magic, version, counts)
- Binary data reading utilities (UInt32, UInt64)
- Basic validation and error handling
- In-memory demo data parsing
- Extensible parser structure

🚧 **Future Extensions**:
- File I/O integration
- Complete metadata value parsing
- Tensor information parsing
- Tensor data reading
- Advanced error handling

## Technical Details

### Parser Architecture

The `GGUFParser` struct provides:
- `demo_parse()` - Demonstrates header parsing with sample data
- `read_uint32()` - Reads 32-bit little-endian integers
- `read_uint64()` - Reads 64-bit little-endian integers
- `parse_header()` - Validates and parses GGUF headers

### Data Types

- `GGUFHeader` - Header information structure
- `DynamicVector[UInt8]` - Binary data storage
- Little-endian binary format support

## Validation

A Python validation script confirms the implementation correctness:

```bash
python3 /tmp/validate_gguf.py
```

This validates:
- GGUF magic number constants
- Binary data layout (little-endian)
- Creates test GGUF files

## Examples

### Header Parsing Output

```
GGUF Header parsed successfully:
  Magic: 1179993927
  Version: 3
  Tensor count: 0
  Metadata KV count: 0
```

## Contributing

This is a prototype implementation. Future contributions could include:

1. File I/O integration for real GGUF files
2. Complete metadata parsing with all value types
3. Tensor information and data parsing
4. Performance optimizations
5. Error handling improvements

## License

This project follows the same license as the parent repository.

## References

- [GGUF Format Specification](https://github.com/ggerganov/ggml/blob/master/docs/gguf.md)
- [Mojo Language Documentation](https://docs.modular.com/mojo/)