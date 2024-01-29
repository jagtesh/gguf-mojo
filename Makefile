.PHONY: ggml clean all

clean:
	@echo "Cleaning ggml"
	cd ggml && rm -Rf build

ggml:
	@echo "Building ggml"
	cd ggml && \
	mkdir build && \
	cd build && \
	cmake -DBUILD_SHARED_LIBS=1 .. && \
	cmake --build . --config Release --target ggml common common-ggml

all:
	@echo "Building all"
	$(MAKE) clean
	$(MAKE) ggml