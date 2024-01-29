from sys import ffi

# Declare the return type struct, a pair of int32_t values
# @register_passable("trivial")
# struct div_t:
#     var quot: Int32
#     var rem: Int32


# fn clib_div(numer: Int32, denom: Int32) -> div_t:
#     return external_call["div", div_t, Int32, Int32](numer, denom)


fn c_gguf_open() -> Int64:
    return external_call["_gguf_open", Int64]()


def main():
    ffi.DLHandle("./ggml-tools/gguf-tools.dSYM")
    # should print (4, 1)
    print("hello world", str(_gguf_open))
