import 'dart:convert';

import 'package:astro/data_upload/bloc/file_upload_bloc.dart';
import 'package:astro/data_upload/model/sales_model.dart';
import 'package:astro/data_upload/widgets/chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FileUploadePage extends StatelessWidget {
  const FileUploadePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('File Upload')),
      body: Center(
        child: BlocConsumer<FileUploadBloc, FileUploadState>(
          listener: (context, state) {
            if (state is FileUploadFailure) {
              _showSnackBar(context, state.error);
            } else if (state is FetchDataSuccess) {
              _showSnackBar(context, 'Data fetched successfully');
            }
          },
          builder: (context, state) {
            if (state is FileUploadInitial) {
              return _buildInitialButtons(context);
            } else if (state is FileUploadLoading) {
              return Skeletonizer(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: const Skeleton.shade(
                      child: Card(
                        child: Text('Loading...'),
                      ),
                    )),
              );
            } else if (state is FetchDataSuccess) {
              return _buildFetchDataSuccess(context, state.data);
            } else {
              return _buildInitialButtons(context);
            }
          },
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Widget _buildInitialButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildUploadAndGetJsonButton(context),
      ],
    );
  }

  Widget _buildUploadAndGetJsonButton(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        context.read<FileUploadBloc>().add(const PickFileEvent(false));
      },
      child: const Text('Upload File and Get JSON'),
    );
  }

  Widget _buildFetchDataSuccess(BuildContext context, String data) {
    final SalesData salesData = parseSalesData(data);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SalesChart(salesData: salesData),
        _buildUploadAndGetJsonButton(context),
      ],
    );
  }

  SalesData parseSalesData(String data) {
    final Map<String, dynamic> jsonData = jsonDecode(data);
    return SalesData.fromJson(jsonData);
  }
}
