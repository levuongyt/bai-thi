import 'dart:ffi';
import 'dart:io';

import 'package:get/get.dart';

final class Solution extends Struct{
  @Double()
  external double x1;

  @Double()
  external double x2;

  @Int32()
  external int numSolutions;
}

typedef SolveQuadraticNative = Solution Function(
    Double a,
    Double b,
    Double c,
    );

typedef SolveQuadratic = Solution Function(
    double a,
    double b,
    double c,
    );

class QuadraticSolverController extends GetxController{
  late final DynamicLibrary _dylib;
  late final SolveQuadratic solveQuadratic;

  RxString result = ''.obs;

  QuadraticSolverController() {
    _dylib = Platform.isAndroid
        ? DynamicLibrary.open("libnative_lib.so")
        : DynamicLibrary.process();

    solveQuadratic = _dylib
        .lookup<NativeFunction<SolveQuadraticNative>>('solve_quadratic')
        .asFunction();
  }

  void solve(double a, double b, double c){
    Solution solution=solveQuadratic(a,b,c);
    if(solution.numSolutions == 2){
      result.value = 'Phương trình có hai nghiệm phân biệt: \n x1 = ${solution.x1} ; x2 = ${solution.x2}';
    }else if(solution.numSolutions == 1){
      result.value = 'Phương trình có nghiệm kép: x = ${solution.x1}';
    }else{
      result.value = 'Phương trình vô nghiệm!';
    }
  }

}