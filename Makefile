.PHONY: ggml clean all

clean:
	@echo "Cleaning ggml"
	cd ggml && rm -Rf build

ggml:
	@echo "Building ggml"
	cd ggml && \
	mkdir build && \
	cd build && \
	cmake -DBUILD_SHARED_LIBS=1 -DGGML_METAL=1 .. && \
	cmake --build . --config Release --target ggml common common-ggml

mojo:
	@echo "Building make"
	mojo build make.mojo -I $(PWD)/ggml/include/ggml -L $(PWD)/ggml/build/examples/libcommon.a -L $(PWD)/ggml/build/examples/libcommon-ggml.a

all:
	@echo "Building all"
	$(MAKE) clean && \
	$(MAKE) ggml && \
	$(MAKE) mojo