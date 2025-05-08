//
//  Generated code. Do not modify.
//  source: image.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use imageMetadataDescriptor instead')
const ImageMetadata$json = {
  '1': 'ImageMetadata',
  '2': [
    {'1': 'filename', '3': 1, '4': 1, '5': 9, '10': 'filename'},
    {'1': 'content_type', '3': 2, '4': 1, '5': 9, '10': 'contentType'},
    {'1': 'size_bytes', '3': 3, '4': 1, '5': 3, '10': 'sizeBytes'},
    {'1': 'uploaded_by', '3': 4, '4': 1, '5': 9, '10': 'uploadedBy'},
    {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `ImageMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageMetadataDescriptor = $convert.base64Decode(
    'Cg1JbWFnZU1ldGFkYXRhEhoKCGZpbGVuYW1lGAEgASgJUghmaWxlbmFtZRIhCgxjb250ZW50X3'
    'R5cGUYAiABKAlSC2NvbnRlbnRUeXBlEh0KCnNpemVfYnl0ZXMYAyABKANSCXNpemVCeXRlcxIf'
    'Cgt1cGxvYWRlZF9ieRgEIAEoCVIKdXBsb2FkZWRCeRIgCgtkZXNjcmlwdGlvbhgFIAEoCVILZG'
    'VzY3JpcHRpb24=');

@$core.Deprecated('Use uploadImageRequestDescriptor instead')
const UploadImageRequest$json = {
  '1': 'UploadImageRequest',
  '2': [
    {'1': 'metadata', '3': 1, '4': 1, '5': 11, '6': '.fileupload.ImageMetadata', '10': 'metadata'},
    {'1': 'image_data', '3': 2, '4': 1, '5': 12, '10': 'imageData'},
  ],
};

/// Descriptor for `UploadImageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadImageRequestDescriptor = $convert.base64Decode(
    'ChJVcGxvYWRJbWFnZVJlcXVlc3QSNQoIbWV0YWRhdGEYASABKAsyGS5maWxldXBsb2FkLkltYW'
    'dlTWV0YWRhdGFSCG1ldGFkYXRhEh0KCmltYWdlX2RhdGEYAiABKAxSCWltYWdlRGF0YQ==');

@$core.Deprecated('Use uploadImageResponseDescriptor instead')
const UploadImageResponse$json = {
  '1': 'UploadImageResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'status', '17': true},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'message', '17': true},
    {'1': 'image_id', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'imageId', '17': true},
  ],
  '8': [
    {'1': '_status'},
    {'1': '_message'},
    {'1': '_image_id'},
  ],
};

/// Descriptor for `UploadImageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadImageResponseDescriptor = $convert.base64Decode(
    'ChNVcGxvYWRJbWFnZVJlc3BvbnNlEhsKBnN0YXR1cxgBIAEoCUgAUgZzdGF0dXOIAQESHQoHbW'
    'Vzc2FnZRgCIAEoCUgBUgdtZXNzYWdliAEBEh4KCGltYWdlX2lkGAMgASgJSAJSB2ltYWdlSWSI'
    'AQFCCQoHX3N0YXR1c0IKCghfbWVzc2FnZUILCglfaW1hZ2VfaWQ=');

