part of 'file_upload_bloc.dart';

abstract class FileUploadEvent extends Equatable {
  const FileUploadEvent();

  @override
  List<Object> get props => [];
}

class PickFileEvent extends FileUploadEvent {
  final bool isUpload;

  const PickFileEvent(this.isUpload);

  @override
  List<Object> get props => [isUpload];
}

class FetchDataEvent extends FileUploadEvent {
  final String filePath;
  final Map<String, dynamic> params;

  const FetchDataEvent(this.filePath, this.params);

  @override
  List<Object> get props => [filePath, params];
}
