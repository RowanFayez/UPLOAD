import 'package:dio/dio.dart';
import 'package:taskaia/core/remote/api_constants.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = ApiConstants.baseUrl;
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        error: true,
      ),
    );
  }

  Future<Response> get({required String path}) async {
    try {
      return await _dio.get(path);
    } on DioException catch (e) {
      throw e.message ?? "Something went wrong";
    }
  }

  Future<Response> post({required String path, required dynamic data}) async {
    try {
      return await _dio.post(path, data: data);
    } on DioException catch (e) {
      throw e.message ?? "Something went wrong";
    }
  }

  Future<Response> update({required String path, required dynamic data}) async {
    try {
      return await _dio.put(path, data: data);
    } on DioException catch (e) {
      throw e.message ?? "Something went wrong";
    }
  }

  Future<Response> delete({required String path}) async {
    try {
      return await _dio.delete(path);
    } on DioException catch (e) {
      throw e.message ?? "Something went wrong";
    }
  }
}

// "CRUD operations"
// Read --> GET
// Update --> (put - patch)
// Create --> POST
// Delete --> DELETE
