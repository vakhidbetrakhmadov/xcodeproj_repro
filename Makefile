clean:
	bazelisk clean
	rm -fdr Sources.xcodeproj

build: clean
	bazelisk build --config=ios-simulator //...

test: clean
	bazelisk test --config=ios-simulator //...

proj: clean
	bazelisk run --config=ios-simulator //:SourcesXcodeproj