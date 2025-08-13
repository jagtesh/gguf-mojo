"""
Example usage of the GGUF parser.

This demonstrates how to use the GGUF parser to read and parse GGUF model files.
Since this is a prototype, it demonstrates the core parsing functionality.
"""

from gguf_parser import GGUFParser


def main():
    """Main function demonstrating GGUF parser usage."""
    print("GGUF Parser Example")
    print("===================")
    
    # Create parser instance
    var parser = GGUFParser()
    
    print("\nDemonstrating GGUF header parsing...")
    let success = parser.demo_parse()
    
    if success:
        print("\nExample completed successfully!")
        print("\nThe parser successfully:")
        print("- Read the GGUF magic number")
        print("- Parsed the file version")
        print("- Read tensor and metadata counts")
        print("- Validated the header format")
    else:
        print("\nExample failed!")
    
    print("\nThis prototype demonstrates the core structure for:")
    print("- GGUF file format parsing")
    print("- Header validation")
    print("- Extensible metadata parsing")
    print("- Pure Mojo implementation without external dependencies")