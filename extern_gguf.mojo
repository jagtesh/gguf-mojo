from collections.vector import InlinedFixedVector

# /* Flags that can be used in different functions with the same meaning. */
# #define GGUF_NONE           0           // No flags.
# #define GGUF_OVERWRITE      (1<<0)      // Overwrite the destination object.

alias GGUF_NONE = 0  # No flags.
alias GGUF_OVERWRITE = 1 << 0  # Overwrite the destination object.

# enum gguf_tensor_type {
#     GGUF_TYPE_F32  = 0,
#     GGUF_TYPE_F16  = 1,
#     GGUF_TYPE_Q4_0 = 2,
#     GGUF_TYPE_Q4_1 = 3,
#     // GGUF_TYPE_Q4_2 = 4, support has been removed
#     // GGUF_TYPE_Q4_3 (5) support has been removed
#     GGUF_TYPE_Q5_0 = 6,
#     GGUF_TYPE_Q5_1 = 7,
#     GGUF_TYPE_Q8_0 = 8,
#     GGUF_TYPE_Q8_1 = 9,
#     // k-quantizations
#     GGUF_TYPE_Q2_K = 10,
#     GGUF_TYPE_Q3_K = 11,
#     GGUF_TYPE_Q4_K = 12,
#     GGUF_TYPE_Q5_K = 13,
#     GGUF_TYPE_Q6_K = 14,
#     GGUF_TYPE_Q8_K = 15,
#     GGUF_TYPE_I8,
#     GGUF_TYPE_I16,
#     GGUF_TYPE_I32,
#     GGUF_TYPE_COUNT,
# };


struct GGUFTensorType:
    alias GGUF_TYPE_F32 = 0
    alias GGUF_TYPE_F16 = 1
    alias GGUF_TYPE_Q4_0 = 2
    alias GGUF_TYPE_Q4_1 = 3
    alias GGUF_TYPE_Q5_0 = 6
    alias GGUF_TYPE_Q5_1 = 7
    alias GGUF_TYPE_Q8_0 = 8
    alias GGUF_TYPE_Q8_1 = 9
    alias GGUF_TYPE_Q2_K = 10
    alias GGUF_TYPE_Q3_K = 11
    alias GGUF_TYPE_Q4_K = 12
    alias GGUF_TYPE_Q5_K = 13
    alias GGUF_TYPE_Q6_K = 14
    alias GGUF_TYPE_Q8_K = 15
    alias GGUF_TYPE_I8 = 16
    alias GGUF_TYPE_I16 = 17
    alias GGUF_TYPE_I32 = 18
    alias GGUF_TYPE_COUNT = 19


# enum gguf_value_type {
#     // The value is a 8-bit unsigned integer.
#     GGUF_VALUE_TYPE_UINT8 = 0,
#     // The value is a 8-bit signed integer.
#     GGUF_VALUE_TYPE_INT8 = 1,
#     // The value is a 16-bit unsigned little-endian integer.
#     GGUF_VALUE_TYPE_UINT16 = 2,
#     // The value is a 16-bit signed little-endian integer.
#     GGUF_VALUE_TYPE_INT16 = 3,
#     // The value is a 32-bit unsigned little-endian integer.
#     GGUF_VALUE_TYPE_UINT32 = 4,
#     // The value is a 32-bit signed little-endian integer.
#     GGUF_VALUE_TYPE_INT32 = 5,
#     // The value is a 32-bit IEEE754 floating point number.
#     GGUF_VALUE_TYPE_FLOAT32 = 6,
#     // The value is a boolean.
#     // 1-byte value where 0 is false and 1 is true.
#     // Anything else is invalid, and should be treated as either the model
#     // being invalid or the reader being buggy.
#     GGUF_VALUE_TYPE_BOOL = 7,
#     // The value is a UTF-8 non-null-terminated string, with length prepended.
#     GGUF_VALUE_TYPE_STRING = 8,
#     // The value is an array of other values, with the length and type
#     // prepended. Arrays can be nested, and the length of the array is the
#     // number of elements in the array, not the number of bytes.
#     GGUF_VALUE_TYPE_ARRAY = 9,
#     // The value is a 64-bit unsigned little-endian integer.
#     GGUF_VALUE_TYPE_UINT64 = 10,
#     // The value is a 64-bit signed little-endian integer.
#     GGUF_VALUE_TYPE_INT64 = 11,
#     // The value is a 64-bit IEEE754 floating point number.
#     GGUF_VALUE_TYPE_FLOAT64 = 12,
#     // Special values used by the callbacks of gguf_do_with_value().
#     GGUF_VALUE_TYPE_ARRAY_START = 100,
#     GGUF_VALUE_TYPE_ARRAY_END = 101
# };


struct GGUFValueType:
    # The value is a 8-bit unsigned integer.
    alias GGUF_VALUE_TYPE_UINT8 = 0
    # The value is a 8-bit signed integer.
    alias GGUF_VALUE_TYPE_INT8 = 1
    # The value is a 16-bit unsigned little-endian integer.
    alias GGUF_VALUE_TYPE_UINT16 = 2
    # The value is a 16-bit signed little-endian integer.
    alias GGUF_VALUE_TYPE_INT16 = 3
    # The value is a 32-bit unsigned little-endian integer.
    alias GGUF_VALUE_TYPE_UINT32 = 4
    # The value is a 32-bit signed little-endian integer.
    alias GGUF_VALUE_TYPE_INT32 = 5
    # The value is a 32-bit IEEE754 floating point number.
    alias GGUF_VALUE_TYPE_FLOAT32 = 6
    # The value is a boolean.
    # 1-byte value where 0 is false and 1 is true.
    # Anything else is invalid, and should be treated as either the model
    # being invalid or the reader being buggy.
    alias GGUF_VALUE_TYPE_BOOL = 7
    # The value is a UTF-8 non-null-terminated string, with length prepended.
    alias GGUF_VALUE_TYPE_STRING = 8
    # The value is an array of other values, with the length and type
    # prepended. Arrays can be nested, and the length of the array is the
    # number of elements in the array, not the number of bytes.
    alias GGUF_VALUE_TYPE_ARRAY = 9
    # The value is a 64-bit unsigned little-endian integer.
    alias GGUF_VALUE_TYPE_UINT64 = 10
    # The value is a 64-bit signed little-endian integer.
    alias GGUF_VALUE_TYPE_INT64 = 11
    # The value is a 64-bit IEEE754 floating point number.
    alias GGUF_VALUE_TYPE_FLOAT64 = 12
    # Special values used by the callbacks of gguf_do_with_value().
    alias GGUF_VALUE_TYPE_ARRAY_START = 100
    alias GGUF_VALUE_TYPE_ARRAY_END = 101


# // A string in GGUF.
# struct gguf_string {
#     // The length of the string, in bytes.
#     uint64_t len;
#     // The string as a UTF-8 non-null-terminated string.
#     char string[];
# };

alias Char = Int8


struct GGUString:
    var len: UInt64  # The length of the string, in bytes.
    var string: Char  # The string as a UTF-8 non-null-terminated string.


# // Union of possible values.
# union gguf_value {
#     uint8_t uint8;
#     int8_t int8;
#     uint16_t uint16;
#     int16_t int16;
#     uint32_t uint32;
#     int32_t int32;
#     float float32;
#     uint64_t uint64;
#     int64_t int64;
#     double float64;
#     uint8_t boolval;
#     struct gguf_string string;
#     struct {
#         // Any value type is valid, including arrays.
#         uint32_t type;
#         // Number of elements, not bytes
#         uint64_t len;
#         // The array of values follow...
#     } __attribute__((packed)) array;
# };


# This is a slight modification as we cannot combine struct definition and declaration in Mojo
struct GGUFArray:
    var type: UInt32  # Any value type is valid, including arrays.
    var len: UInt64  # Number of elements, not bytes


struct GGUFValue:
    var uint8: UInt8
    var int8: Int8
    var uint16: UInt16
    var int16: Int16
    var uint32: UInt32
    var int32: Int32
    var float32: Float32
    var uint64: UInt64
    var int64: Int64
    var float64: Float64
    var boolval: UInt8
    var string: GGUString
    var array: GGUFArray


# // Header
# struct gguf_header {
#     // Magic number to announce that this is a GGUF file.
#     // Must be `GGUF` at the byte level: `0x47` `0x47` `0x55` `0x46`.
#     uint32_t magic;
#     // The version of the format implemented.
#     // Must be `3` for version described in this spec.
#     uint32_t version;
#     // The number of tensors in the file.
#     // This is explicit, instead of being included in the metadata, to ensure
#     // it is always present for loading the tensors.
#     uint64_t tensor_count;
#     // The number of metadata key-value pairs.
#     uint64_t metadata_kv_count;
# };


struct GGUFHeader:
    var magic: UInt32  # Magic number to announce that this is a GGUF file. Must be `GGUF` at the byte level: `0x47` `0x47` `0x55` `0x46`.
    var version: UInt32  # The version of the format implemented. Must be `3` for version described in this spec.
    var tensor_count: UInt64  # The number of tensors in the file.
    var metadata_kv_count: UInt64  # The number of metadata key-value pairs.


# /* Key representation in this library API. */
# typedef struct {
#     const char *name;
#     size_t namelen;
#     uint32_t type;
#     union gguf_value *val;
# } gguf_key;


struct GGUFKey:
    var name: Pointer[Char]  # Key name
    var namelen: Int  # Length of the key name
    var type: UInt32  # Key type
    var val: DTypePointer[AnyType]  # Key value


# /* Tensor representation in this library API. */
# #define GGUF_TENSOR_MAX_DIM 8           // Future-proof: actual limit is 4.
# typedef struct {
#     const char *name;
#     size_t namelen;
#     uint32_t type;                      // Tensor type (enum gguf_tensor_type).
#     uint32_t ndim;                      // Number of dimensions of the tensor.
#     uint64_t dim[GGUF_TENSOR_MAX_DIM];  // Dimensions (Eg. [512, 1024, 1, 1]).
#     uint64_t offset;                    // Offset from start of file.
#     uint64_t bsize;                     // Total size in bytes.
#     uint64_t num_weights;               // Total number of parameters.
#     uint8_t *weights_data;              // Pointer to the mmaped file.
# } gguf_tensor;

# typedef struct {
#     int fd;
#     uint8_t *data;  // Memory mapped data.
#     uint64_t size;  // Total file size.
#     struct gguf_header *header;     // GUFF file header info.
#     uint32_t left_kv;               // Number of key-value pairs yet to read.
#     uint32_t left_tensors;          // Number of tensors yet to read.
#     uint64_t off;                   // Offset of the next item to parse.
#     uint64_t data_off;              // Offset of tensor data section. This
#                                     // is only set when all the kv/tensor header
#                                     // entries are processed. Initially 0.
#     uint64_t alignment;             // File data alignment. Default: 32 bytes.
# } gguf_ctx;


struct GGUFContext:
    var fd: Int  # File descriptor
    var data: Pointer[UInt8]  # Memory mapped data
    var size: UInt64  # Total file size
    var header: Pointer[GGUFHeader]  # GUFF file header info
    var left_kv: UInt32  # Number of key-value pairs yet to read
    var left_tensors: UInt32  # Number of tensors yet to read
    var off: UInt64  # Offset of the next item to parse
    var data_off: UInt64  # Offset of tensor data section. This is only set when all the kv/tensor header entries are processed. Initially 0.
    var alignment: UInt64  # File data alignment. Default: 32 bytes.


# /* Tensor representation in this library API. */
# #define GGUF_TENSOR_MAX_DIM 8           // Future-proof: actual limit is 4.
# typedef struct {
#     const char *name;
#     size_t namelen;
#     uint32_t type;                      // Tensor type (enum gguf_tensor_type).
#     uint32_t ndim;                      // Number of dimensions of the tensor.
#     uint64_t dim[GGUF_TENSOR_MAX_DIM];  // Dimensions (Eg. [512, 1024, 1, 1]).
#     uint64_t offset;                    // Offset from start of file.
#     uint64_t bsize;                     // Total size in bytes.
#     uint64_t num_weights;               // Total number of parameters.
#     uint8_t *weights_data;              // Pointer to the mmaped file.
# } gguf_tensor;


alias GGUF_TENSOR_MAX_DIM = 8  # Future-proof: actual limit is 4.


struct GGUFTensor:
    var name: Pointer[Char]  # Tensor name
    var namelen: Int  # Length of the tensor name
    var type: UInt32  # Tensor type (enum gguf_tensor_type)
    var ndim: UInt32  # Number of dimensions of the tensor
    var dim: InlinedFixedVector[
        UInt64, GGUF_TENSOR_MAX_DIM
    ]  # Dimensions (Eg. [512, 1024, 1, 1])
    var offset: UInt64  # Offset from start of file
    var bsize: UInt64  # Total size in bytes
    var num_weights: UInt64  # Total number of parameters
    var weights_data: Pointer[UInt8]  # Pointer to the mmaped file


# /* The context you get after opening a GGUF file with gguf_init(). */
# typedef struct {
#     int fd;
#     uint8_t *data;  // Memory mapped data.
#     uint64_t size;  // Total file size.
#     struct gguf_header *header;     // GUFF file header info.
#     uint32_t left_kv;               // Number of key-value pairs yet to read.
#     uint32_t left_tensors;          // Number of tensors yet to read.
#     uint64_t off;                   // Offset of the next item to parse.
#     uint64_t data_off;              // Offset of tensor data section. This
#                                     // is only set when all the kv/tensor header
#                                     // entries are processed. Initially 0.
#     uint64_t alignment;             // File data alignment. Default: 32 bytes.
# } gguf_ctx;


fn gguf_open(file: StringRef, flags: Int) -> Pointer[GGUFContext]:
    let ctx_ptr: Pointer[GGUFContext] = external_call[
        "_gguf_open", Pointer[GGUFContext]
    ](file, flags)
    return ctx_ptr


# fn gguf_close(ctx: Pointer[GGUFContext]) -> Int:
#     pass


# fn gguf_read_header(ctx: Pointer[GGUFContext]) -> Int:
#     pass


# fn gguf_read_kv(ctx: Pointer[GGUFContext], kv: Pointer[GGUFKey]) -> Int:
#     pass


# fn gguf_read_tensor(ctx: Pointer[GGUFContext], tensor: Pointer[GGUFTensor]) -> Int:
#     pass


# fn gguf_read_tensor_data(ctx: Pointer[GGUFContext], tensor: Pointer[GGUFTensor]) -> Int:
#     pass


# fn gguf_read_tensor_data_at(
#     ctx: Pointer[GGUFContext], tensor: Pointer[GGUFTensor], offset: UInt64, size: UInt64
# ) -> Int:
#     pass
