load("@build_bazel_rules_swift//mixed_language:mixed_language_library.bzl", "mixed_language_library")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load("@build_bazel_rules_apple//apple:ios.bzl", "ios_unit_test")
load("@rules_xcodeproj//xcodeproj:defs.bzl", "xcodeproj")

mixed_language_library(
    name = "Dep",
    swift_srcs = [
        "Sources/Dummy.swift",
    ],
    clang_srcs = [
        "Sources/Dummy.h",
        "Sources/Dummy.m",
    ],
    enable_modules = True,
)

swift_library(
    name = "Sources",
    srcs = [
        "Sources/Dummy.swift",
    ],
    deps = [
        "Dep",
    ]
)

swift_library(
    name = "_SourcesUnitTests",
    srcs = [
        "Tests/Dummy.swift",
    ],
    deps = [
        "Sources",
    ],
    testonly = True,
)

ios_unit_test(
    name = "SourcesUnitTests",
    deps = [
        "_SourcesUnitTests",
    ],
    minimum_os_version = "11.0",
    visibility = ["//visibility:public"],
)

xcodeproj(
    name = "SourcesXcodeproj",
    project_name = "Sources",
    default_xcode_configuration = "Debug",
    top_level_targets = [
        "SourcesUnitTests",
    ],
    focused_targets = [
        "Sources",
        "_SourcesUnitTests",
        "SourcesUnitTests",
    ],
)