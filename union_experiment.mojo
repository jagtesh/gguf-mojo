# @value
# struct Foo(AnyType):
#     var p: Pointer[Int]
#     var size: Int

#     fn __init__(inout self, size: Int):
#         self.p = Pointer[Int].alloc(size)
#         self.size = size

#     fn __del__(owned self):
#         print("--freeing allocated memory--")
#         self.p.free()

struct Union(AnyType):
    var a: DynamicVector[AnyType]